#ifndef GRAPHIC_DISPLAY_CONTROLLER_INTERFACE_H
#define GRAPHIC_DISPLAY_CONTROLLER_INTERFACE_H


void select_controller(uint_8 controller);
void graphic_ctrl_bit_set(uint_8 x);
void graphic_ctrl_bit_clear(uint_8 x);
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