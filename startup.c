/*
 * 	startup.c
 *
 */
#include "delays.h"
#include "defines.h"
#include "graphic_display_controller_interface.h"
#define SIMULATOR 2
#define MAX_POINTS 20
typedef unsigned char uint8_t;


void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	".L1: B .L1\n"				/* never return */
	) ;
}

void app_init()
{
	(*((unsigned int*) 0x40023830)) |= 0x10;
	*portOtyper = 0;
	*portOspeedr = 0x55555555;
	*portPupdr = 0x55550000;
	*portModer = 0x55555555;
	//graphic_ctrl_bit_clear(B_SELECT);
}



void main(void)
{
	app_init();
	
	
	graphic_initialize();
	graphic_clear_screen();

	
	
	POBJECT b = &ball;
	b -> set_speed(b,4,1);
	
	while(1)
	{
		b -> move(b);
		delay_milli(1);
	}
	
}

