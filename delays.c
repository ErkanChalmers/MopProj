#define SYSTICK 0xE000E010
#define STK_CTRL ((volatile unsigned int*)SYSTICK)
#define STK_LOAD ((volatile unsigned int*) SYSTICK+4)
#define STK_VAL ((volatile unsigned int*) SYSTICK+8)

void delay_250ns(){
	*STK_CTRL = 0x00;
	*STK_LOAD = 0x00000029;
	*STK_VAL = 0x00;
	*STK_CTRL = 0x5;
	while((*STK_CTRL && 0x10000) == 0)
	*STK_CTRL = 0x00;
}

void delay_500ns(){
	
	delay_250ns();
	delay_250ns();
}


void delay_mikro(unsigned int us){
	
	for(int i = 1; i < 4*us; i++){
		delay_250ns();
	}
}
void delay_milli(unsigned int ms){
	
	//Delay on simulator
		ms /= 500;
		ms++;
	
	
		
	delay_mikro(ms*1000);
}