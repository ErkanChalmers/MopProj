#ifndef GRAPHIC_DISPLAY_CONTROLLER_INTERFACE_H
#define GRAPHIC_DISPLAY_CONTROLLER_INTERFACE_H
#include "defines.h"
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
typedef unsigned char uint8_t;

void select_controller(uint8_t controller);
void graphic_ctrl_bit_set(uint8_t x);
void graphic_ctrl_bit_clear(uint8_t x);
void graphic_wait_ready();
uint8_t graphic_read(uint8_t controller);
void graphic_write(uint8_t value, uint8_t controller);
void graphic_write_command(uint8_t cmd, uint8_t controller);
void graphic_write_data(uint8_t data, uint8_t controller);
uint8_t graphic_read_data(uint8_t controller);
void graphic_initialize();
void graphic_clear_screen();
void pixel(unsigned x, unsigned y, unsigned set);
void set_object_speed(POBJECT o, int speedx, int speedy);
void draw_object(POBJECT o);
void clear_object(POBJECT o);
void move_object(POBJECT o);

#endif