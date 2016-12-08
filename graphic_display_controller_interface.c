#include "delays.h"

typedef struct tPoint {
	unsigned char x;
	unsigned char y;
} POINT;
typedef struct tGeometry {
	int numpoints;
	int sizeX;
	int sizeY;
	POINT px[MAX_POINTS];
} GEOMETRY, *PGEOMETRY;
typedef struct tObj {
	PGEOMETRY geo;
	int dirx, diry;
	int posx, posy;
	void (* draw)(struct tObj*);
	void (* clear)(struct tObj*);
	void (* move)(struct tObj*);
	void (* set_speed)(struct tObj*,int, int);
} OBJECT, *POBJECT;

void select_controller(uint8_t controller)
{
	switch(controller) {
		case 0: 
		graphic_ctrl_bit_clear(B_CS1 | B_CS2);
		break;
		case B_CS1:	
		graphic_ctrl_bit_set(B_CS1);
		graphic_ctrl_bit_clear(B_CS2);
		break;
		case B_CS2:	
		graphic_ctrl_bit_clear(B_CS1);
		graphic_ctrl_bit_set(B_CS2);
		break;
		case (B_CS1 | B_CS2):	
		graphic_ctrl_bit_set(B_CS1 | B_CS2);
		break;
		default:break;
	}
}

void graphic_ctrl_bit_set(uint8_t x)
{
	*portOdrLow |= (~B_SELECT & x);
}

void graphic_ctrl_bit_clear(uint8_t x)
{
	*portOdrLow &= (~B_SELECT & ~x);
}

void graphic_wait_ready()
{
	graphic_ctrl_bit_clear(B_E);
	*portModer = 0x00005555;
	graphic_ctrl_bit_clear(B_RS);
	graphic_ctrl_bit_set(B_RW);
	delay_500ns();
	while(1)
	{
		graphic_ctrl_bit_set(B_E);
		delay_500ns();
		
		char c = *portIdrHigh & 0x80;
		if(c == 0) break;
		graphic_ctrl_bit_clear(B_E);
		delay_500ns();
	}
	graphic_ctrl_bit_clear(B_E);
	
	*portModer = 0x55555555;
	graphic_ctrl_bit_set(B_E);
}

uint8_t graphic_read(uint8_t controller)
{
	//
	*portModer = 0x00005555;
	//
	select_controller(controller);
	graphic_ctrl_bit_clear(B_E);
	graphic_ctrl_bit_set(B_RS | B_RW);
	delay_500ns();
	graphic_ctrl_bit_set(B_E);
	delay_500ns();
	char rv = *portIdrHigh;
	graphic_ctrl_bit_clear(B_E);
	*portModer = 0x55555555;
	if(controller & B_CS1)
	{
		select_controller(B_CS1);
		graphic_wait_ready();
	}
	if(controller & B_CS2)
	{
		select_controller(B_CS2);
		graphic_wait_ready();
	}
	return rv;
}

void graphic_write(uint8_t value, uint8_t controller)
{
	*portOdrHigh = value;
	select_controller(controller);
	delay_500ns();
	graphic_ctrl_bit_set(B_E);
	delay_500ns();
	graphic_ctrl_bit_clear(B_E);
	if(controller & B_CS1)
	{
		select_controller(B_CS1);
		graphic_wait_ready();
	}
	if(controller & B_CS2)
	{
		select_controller(B_CS2);
		graphic_wait_ready();
	}
	*portOdrHigh = 0;
	graphic_ctrl_bit_set(B_E);
	select_controller(0);
}

void graphic_write_command(uint8_t cmd, uint8_t controller)
{
	graphic_ctrl_bit_clear(B_E);
	select_controller(controller);
	graphic_ctrl_bit_clear(B_RS | B_RW);
	graphic_write(cmd,controller);
}

void graphic_write_data(uint8_t data, uint8_t controller)
{
	graphic_ctrl_bit_clear(B_E);
	select_controller(controller);
	graphic_ctrl_bit_set(B_RS);
	graphic_ctrl_bit_clear(B_RW);
	graphic_write(data,controller);
}

uint8_t graphic_read_data(uint8_t controller)
{
	(void)graphic_read(controller);
	return graphic_read(controller);
}

void graphic_initialize()
{
	graphic_ctrl_bit_set(B_E);
	delay_mikro(10);
	graphic_ctrl_bit_clear(B_RST | B_E | B_CS1 | B_CS2);
	//select_controller(0);
	delay_milli(30);
	graphic_ctrl_bit_set(B_RST);
	graphic_write_command(LCD_OFF,B_CS1 | B_CS2);
	graphic_write_command(LCD_ON,B_CS1 | B_CS2);
	graphic_write_command(LCD_DISP_START,B_CS1 | B_CS2);
	graphic_write_command(LCD_SET_ADD,B_CS1 | B_CS2);
	graphic_write_command(LCD_SET_PAGE,B_CS1 | B_CS2);
	select_controller(0);
}

void graphic_clear_screen()
{
	for(char y = 0; y < 8; y++)
	{
		graphic_write_command(LCD_SET_PAGE | y,B_CS1 | B_CS2);
		graphic_write_command(LCD_SET_ADD | 0,B_CS1 | B_CS2);
		for(char x = 0; x < 64; x++)
		{
			graphic_write_data(0, B_CS1 | B_CS2);
		}
	}
}

void pixel(unsigned x, unsigned y, unsigned set)
{
	if((x < 1 || x >= 129) || (y < 1 || y >= 65)) return;
	char index = (y-1)/8;
	char mask;
	uint8_t controller;
	switch ((y-1) % 8)
	{
		case 0: mask = 1; break;
		case 1: mask = 2; break;
		case 2: mask = 4; break;
		case 3: mask = 8; break;
		case 4: mask = 0x10; break;
		case 5: mask = 0x20; break;
		case 6: mask = 0x40; break;
		case 7: mask = 0x80; break;
		default: break;
	}
	
	if(set == 0)
	{
		mask = ~mask;
	}
	if(x > 64)
	{
		controller = B_CS2;
		x = x-65;
	} 
	else 
	{
		controller = B_CS1;
		x = x-1;
	}
	graphic_write_command(LCD_SET_ADD | x, controller);
	graphic_write_command(LCD_SET_PAGE | index, controller);
	uint8_t temp = graphic_read_data(controller);
	graphic_write_command(LCD_SET_ADD | x, controller);
	if(set)
	{
		mask |= temp;
	}
	else
	{
		mask &= temp;
	}
	graphic_write_data(mask, controller);
}

void set_object_speed(POBJECT o, int speedx, int speedy)
{
	o -> dirx = speedx;
	o -> diry = speedy;
}

void draw_object(POBJECT o)
{
	for(char i = 0; i < o -> geo -> numpoints; i++)
	{
		pixel(o -> posx + o -> geo -> px[i].x, o -> posy + o -> geo -> px[i].y, 1);
	}
}

void clear_object(POBJECT o)
{
	for(char i = 0; i < o -> geo -> numpoints; i++)
	{
		pixel(o -> posx + o -> geo -> px[i].x, o -> posy + o -> geo -> px[i].y, 0);
	}
}

void move_object(POBJECT o)
{
	clear_object(o);
	o -> posx += o-> dirx;
	if(o -> posx < 1)
	{
		o -> dirx = -o -> dirx;
		o -> posx = 1;
	}
	if(o -> posx > 128)
	{
		o -> dirx = -o -> dirx;
		o -> posx = 128;
	}
	o -> posy += o-> diry;
	if(o -> posy < 1)
	{
		o -> diry = -o -> diry;
		o -> posy = 1;
	}
	if(o -> posy > 64)
	{
		o -> diry = -o -> diry;
		o -> posy = 64;
	}
	draw_object(o);
}
/**
static GEOMETRY ballgeo={
		12,4,4,{{0,1},{0,2},{1,0},{1,1},{1,2},{1,3},{2,0},{2,1},{2,2},{2,3},{3,1},{3,2}}
	};

static OBJECT ball = {
		&ballgeo,0,0,1,1,draw_object,clear_object,move_object,set_object_speed
	};
	*/