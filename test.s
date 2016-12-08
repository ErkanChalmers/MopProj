   1              		.syntax unified
   2              		.arch armv6-m
   3              		.fpu softvfp
   4              		.eabi_attribute 20, 1
   5              		.eabi_attribute 21, 1
   6              		.eabi_attribute 23, 3
   7              		.eabi_attribute 24, 1
   8              		.eabi_attribute 25, 1
   9              		.eabi_attribute 26, 1
  10              		.eabi_attribute 30, 6
  11              		.eabi_attribute 34, 0
  12              		.eabi_attribute 18, 4
  13              		.thumb
  14              		.syntax unified
  15              		.file	"startup.c"
  16              		.text
  17              	.Ltext0:
  18              		.cfi_sections	.debug_frame
  19              		.section	.start_section,"ax",%progbits
  20              		.align	2
  21              		.global	startup
  22              		.code	16
  23              		.thumb_func
  25              	startup:
  26              	.LFB0:
  27              		.file 1 "/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c"
   1:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** /*
   2:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c ****  * 	startup.c
   3:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c ****  *
   4:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c ****  */
   5:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** #include "delays.h"
   6:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** #include "defines.h"
   7:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** #include "graphic_display_controller_interface.h"
   8:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** #define SIMULATOR 2
   9:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 
  10:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 
  11:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 
  12:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 
  13:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  14:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 
  15:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** void startup ( void )
  16:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** {
  28              		.loc 1 16 0
  29              		.cfi_startproc
  30              		@ Naked Function: prologue and epilogue provided by programmer.
  31              		@ args = 0, pretend = 0, frame = 0
  32              		@ frame_needed = 1, uses_anonymous_args = 0
  17:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** asm volatile(
  33              		.loc 1 17 0
  34              		.syntax divided
  35              	@ 17 "/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c" 1
  36 0000 0248     		 LDR R0,=0x2001C000
  37 0002 8546     	 MOV SP,R0
  38 0004 FFF7FEFF 	 BL main
  39 0008 FEE7     	.L1: B .L1
  40              	
  41              	@ 0 "" 2
  18:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  19:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 	" MOV SP,R0\n"
  20:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 	" BL main\n"				/* call main */
  21:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 	".L1: B .L1\n"				/* never return */
  22:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 	) ;
  23:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** }
  42              		.loc 1 23 0
  43              		.thumb
  44              		.syntax unified
  45 000a C046     		nop
  46              		.cfi_endproc
  47              	.LFE0:
  49              		.text
  50              		.align	2
  51              		.global	app_init
  52              		.code	16
  53              		.thumb_func
  55              	app_init:
  56              	.LFB1:
  24:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 
  25:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** void app_init()
  26:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** {
  57              		.loc 1 26 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  27:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 	(*((unsigned int*) 0x40023830)) |= 0x10;
  67              		.loc 1 27 0
  68 0004 0A4B     		ldr	r3, .L3
  69 0006 0A4A     		ldr	r2, .L3
  70 0008 1268     		ldr	r2, [r2]
  71 000a 1021     		movs	r1, #16
  72 000c 0A43     		orrs	r2, r1
  73 000e 1A60     		str	r2, [r3]
  28:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 	*portOtyper = 0;
  74              		.loc 1 28 0
  75 0010 084B     		ldr	r3, .L3+4
  76 0012 0022     		movs	r2, #0
  77 0014 1A80     		strh	r2, [r3]
  29:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 	*portOspeedr = 0x55555555;
  78              		.loc 1 29 0
  79 0016 084B     		ldr	r3, .L3+8
  80 0018 084A     		ldr	r2, .L3+12
  81 001a 1A60     		str	r2, [r3]
  30:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 	*portPupdr = 0x55550000;
  82              		.loc 1 30 0
  83 001c 084B     		ldr	r3, .L3+16
  84 001e 094A     		ldr	r2, .L3+20
  85 0020 1A60     		str	r2, [r3]
  31:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 	*portModer = 0x55555555;
  86              		.loc 1 31 0
  87 0022 094B     		ldr	r3, .L3+24
  88 0024 054A     		ldr	r2, .L3+12
  89 0026 1A60     		str	r2, [r3]
  32:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 	//graphic_ctrl_bit_clear(B_SELECT);
  33:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** }
  90              		.loc 1 33 0
  91 0028 C046     		nop
  92 002a BD46     		mov	sp, r7
  93              		@ sp needed
  94 002c 80BD     		pop	{r7, pc}
  95              	.L4:
  96 002e C046     		.align	2
  97              	.L3:
  98 0030 30380240 		.word	1073887280
  99 0034 08100240 		.word	1073877000
 100 0038 20100240 		.word	1073877024
 101 003c 55555555 		.word	1431655765
 102 0040 30100240 		.word	1073877040
 103 0044 00005555 		.word	1431633920
 104 0048 00100240 		.word	1073876992
 105              		.cfi_endproc
 106              	.LFE1:
 108              		.align	2
 109              		.global	main
 110              		.code	16
 111              		.thumb_func
 113              	main:
 114              	.LFB2:
  34:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 
  35:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 
  36:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 
  37:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** void main(void)
  38:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** {
 115              		.loc 1 38 0
 116              		.cfi_startproc
 117              		@ args = 0, pretend = 0, frame = 0
 118              		@ frame_needed = 1, uses_anonymous_args = 0
 119 004c 80B5     		push	{r7, lr}
 120              		.cfi_def_cfa_offset 8
 121              		.cfi_offset 7, -8
 122              		.cfi_offset 14, -4
 123 004e 00AF     		add	r7, sp, #0
 124              		.cfi_def_cfa_register 7
  39:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 	app_init();
 125              		.loc 1 39 0
 126 0050 FFF7FEFF 		bl	app_init
  40:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 	
  41:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 	
  42:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 	graphic_initialize();
 127              		.loc 1 42 0
 128 0054 FFF7FEFF 		bl	graphic_initialize
  43:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 	graphic_clear_screen();
 129              		.loc 1 43 0
 130 0058 FFF7FEFF 		bl	graphic_clear_screen
 131              	.L6:
  44:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 
  45:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 	
  46:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 	
  47:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 	//POBJECT b = &ball;
  48:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 	//b -> set_speed(b,4,1);
  49:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 	
  50:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 	while(1)
  51:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 	{
  52:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 		//b -> move(b);
  53:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 		delay_milli(1);
 132              		.loc 1 53 0 discriminator 1
 133 005c 0120     		movs	r0, #1
 134 005e FFF7FEFF 		bl	delay_milli
  54:/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c **** 	}
 135              		.loc 1 54 0 discriminator 1
 136 0062 FBE7     		b	.L6
 137              		.cfi_endproc
 138              	.LFE2:
 140              	.Letext0:
