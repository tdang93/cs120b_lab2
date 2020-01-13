/*	Author: lchan063
 *  Partner(s) Name: Tandy Dang
 *	Lab Section:
 *	Assignment: Lab #  Exercise #
 *	Exercise Description: [optional - include for your own benefit]
 *
 *	I acknowledge all content contained herein, excluding template or example
 *	code, is my own original work.
 */
#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

int main(void) {
    /* Insert DDR and PORT initializations */
	DDRA = 0x00; PORTA = 0xFF; //comment port bc we modify variables in test.gdb
	DDRB = 0x00; PORTB = 0xFF; //set PORTB to 0
	DDRC = 0x00; PORTC = 0xFF;
	DDRD = 0xFF; PORTD = 0x00;
	
	/* unsigned char tmpA = 0x00;
	unsigned char tmpB = 0x00; //init tmpB to 0
	unsigned char tmpC = 0x00;
	unsigned char tmpA0 = 0x00; 
	unsigned char tmpA1 = 0x00;
	unsigned char cntavail = 0x00; */

	unsigned char high = 0x00;
	unsigned char low = 0x00;
	unsigned char tmpD = 0x00;
    /* Insert your solution below */
    while (1) {
	/* tmpA0 = PINA & 0x01;
	tmpA1 = PINA & 0x02;
	if (!tmpA0 && tmpA1) {
		tmpB = (tmpB & 0x00) | 0x01;	
	} else {
		tmpB = (tmpB & 0x00) | 0x00;	
	}
	PORTB = tmpB; */
	
	/* tmpA = PINA & 0x0F;
	if (tmpA == 0x00) {
		cntavail = 0x00;
	} else if ( (tmpA == 0x01) || (tmpA == 0x02) || (tmpA == 0x04) || (tmpA == 0x08) ) {
		cntavail = 0x01;
	} else if ( (tmpA == 0x03) || (tmpA == 0x05) || (tmpA == 0x06) || (tmpA == 0x09) || (tmpA == 0x0A) || (tmpA == 0x0C) ) {
		cntavail = 0x02;
	} else if ( (tmpA == 0x07) || (PINA == 0x0B) || (tmpA == 0x0D) || (tmpA == 0x0E) ) {
		cntavail = 0x03;
	} else if ( tmpA == 0x0F ) {
		cntavail = 0x84; //debugger in campus returns error when unit testing, even though it returns the desired output
	}
	PORTC = cntavail;	
    } */
	
	low = (PINA & 0x0F) + (PINB & 0x0F) + (PINC & 0x0F);
	high = (PINA >> 4) + (PINB >> 4) + (PINC >> 4);

	high = high + (low >> 4);

	//unsigned char low4 = low & 0x0F;
	if ( (high > 0x08) ) {
		tmpD = 0x01;
	} else if (  ((high == 0x08) && ((low & 0x0F) > 0x0C)) ) {
		tmpD = 0x01;
	} else {
		tmpD = 0x00; //this appears to let the output default to 0x00
	}
	
	PORTD = tmpD;
	//PORTD = high;
	//PORTC = low;
}	
    	return 1;
}
