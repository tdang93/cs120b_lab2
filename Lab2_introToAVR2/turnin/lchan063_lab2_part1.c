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
	DDRB = 0xFF; PORTB = 0x00; //set PORTB to 0
	unsigned char tmpB = 0x00; //init tmpB to 0
	unsigned char tmpA0 = 0x00; 
	unsigned char tmpA1 = 0x00;
    /* Insert your solution below */
    while (1) {
	tmpA0 = PINA & 0x01;
	tmpA1 = PINA & 0x02;
	if (!tmpA0 && tmpA1) {
		tmpB = (tmpB & 0x00) | 0x01;	
	} else {
		tmpB = (tmpB & 0x00) | 0x00;	
	}
	PORTB = tmpB;
    }
    return 1;
}
