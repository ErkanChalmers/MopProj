#ifndef DELAYS_H
#define DELAYS_H

#define SYSTICK 0xE000E010
#define STK_CTRL ((volatile unsigned int*)SYSTICK)
#define STK_LOAD ((volatile unsigned int*) SYSTICK+4)
#define STK_VAL ((volatile unsigned int*) SYSTICK+8)

void delay_250ns();
void delay_500ns();

void delay_mikro(unsigned int us);
void delay_milli(unsigned int ms);
#endif