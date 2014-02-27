/*
===============================================================================
 Name        : main.c
 Author      : $(author)
 Version     :
 Copyright   : $(copyright)
 Description : main definition
===============================================================================
*/


#include "board.h"

int main(void)
{

	SystemInit();


	IP_GPIO_WriteDirBit(LPC_GPIO,3,1);		// Clock

	IP_GPIO_WriteDirBit(LPC_GPIO,2,1);		// Reset pin as open collector
	Chip_IOCON_EnableOD(LPC_IOCON,1,2);

	IP_GPIO_WriteDirBit(LPC_GPIO,19,1);		// Synch pin

	IP_GPIO_WriteDirBit(LPC_GPIO2,11,0);	// bottoms
	IP_GPIO_WriteDirBit(LPC_GPIO2,12,0);


	IP_GPIO_WritePortBit(LPC_GPIO,2,0);		// Holds reset low


	asm("movw   r0, #0xc000"); 		// Loading base address of port 0 (0x2009C000)
	asm("movt	r0,  #0x2009");

	asm("movw	r3, #0xC040"); 		// Loading base address of port 2 (0x2009C040)
	asm("movt	r3, #0x2009");

	asm("movw	r1, 0x0008");		// Loading bit mask for pin 3 in port 0 (CLOCK)
	asm("movt	r1, 0x0000");

	asm("movw	r5, 0x0004");		// Loading bit mask for pin 2 in port 0 (RESET)
	asm("movt	r5, 0x0000");

	asm("movw	r4, 0x0000");		// Loading bit mask for pin 19 in port 2 (SYNCH)
	asm("movt	r4, 0x0008");



	asm("LOOP_WAITING_BUTTON1:");	// This loop waits holding the target reset until PB1 is pressed

	asm("str	r4, [r0,#28]");		// SYNCH = 0
	asm("str	r1, [r0,#28]");		// Clock = 0
	asm("str	r5, [r0,#28]");		// Reset = 0

	asm("movw	r6, 0x003A");		// Loads the number of cycles to wait before injecting the glitch
	asm("movt	r6, 0x0000");

	asm("ldr	r2, [r3,#0x14]");	// Checks if PB1 is pressed (pin 12 - port 2)
	asm("tst	r2, #0x1000");
	asm("bne	LOOP_WAITING_BUTTON1");		// If PB1 was not pressed, repeat the loop

	asm("str	r5, [r0,#24]");		// Reset = 1

	asm("LOOP_1:");

	asm("str	r1, [r0,#24]");		// Clock = 1
	asm("str	r1, [r0,#24]");
	asm("str	r1, [r0,#24]");
	asm("subs	r6, 1");

	asm("str	r1, [r0,#28]");		// Clock = 0
	asm("str	r1, [r0,#28]");
	asm("bne	LOOP_1");			// If counter=0, break the loop


	asm("str	r4, [r0,#24]");		// SYNCH = 1
									// This signal is used to trigger the oscilloscope


	// Counter reached 0. A glitch has to be injected


	asm("str	r1, [r0,#28]");		// This instruction is used to wait just one instruction cycle.
									// Otherwise, the last clock period before glitching would be shorter


	// Generates three clock cycles at 60MHz
	asm("str	r1, [r0,#24]");
	asm("str	r1, [r0,#28]");
	asm("str	r1, [r0,#24]");
	asm("str	r1, [r0,#28]");
	asm("str	r1, [r0,#24]");
	asm("str	r1, [r0,#28]");





	asm("LOOP_WAITING_BUTTON2:");	// This loop generates a 15 MHz clock signal while PB2 is not pressed

	asm("str	r1, [r0,#24]");		// Clock = 1
	//asm("str	r1, [r0,#24]");
	asm("ldr	r2, [r3,#0x14]");	// Checks if PB2 is pressed (pin 11 - port 2)
	asm("tst	r2, 0x800");


	asm("str	r1, [r0,#28]");		// Clock = 0
	asm("str	r1, [r0,#28]");		// Clock = 0
	asm("bne	LOOP_WAITING_BUTTON2");		// If PB2 was not pressed, repeat the loop

	asm("b		LOOP_WAITING_BUTTON1");		// Jump to the beginning


}
