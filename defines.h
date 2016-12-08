#ifndef DEFINES_H
#define DEFINES_H

#define PORT_BASE 0x40021000
#define portModer ((volatile unsigned int*)PORT_BASE)
#define portOtyper ((volatile unsigned short*) PORT_BASE+4)
#define portOspeedr ((volatile unsigned int*)PORT_BASE+8)
#define portPupdr ((volatile unsigned int*)PORT_BASE+0xC)

//Datastyrreg
#define portIdrLow ((volatile unsigned short*)PORT_BASE+0x10)
#define portIdrHigh ((volatile unsigned char*)PORT_BASE+0x11)
#define portOdrLow ((volatile unsigned char*)PORT_BASE+0x14)
#define portOdrHigh ((volatile unsigned char*)PORT_BASE+0x15)

//Styrbitar
#define B_E 0x40
#define B_SELECT 0x04
#define B_RW 0x02
#define B_RS 0x01
#define B_RST 0x20
#define B_CS2 0x10
#define B_CS1 0x08

//LCD grejs
#define LCD_ON 0x3F
#define LCD_OFF 0x3E
#define LCD_SET_ADD 0x40
#define LCD_SET_PAGE 0xB8
#define LCD_DISP_START 0xC0
#define LCD_BUSY 0x80

typedef unsigned char uint8_t;
#define MAX_POINTS 20

#endif