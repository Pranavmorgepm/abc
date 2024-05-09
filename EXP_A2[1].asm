;EXPERIMENT NO.:02:Interfacing Of LED's,Switch,Buzzer,Relay with 8051 Microcontroller
;NAME: ABHAY SACHIN PHALLE
;ROLL NO.: 213070
;DATE: 07/02/2024
;BATCH: C3
	SWITCH EQU P3.0	;equate pin P3.0 as switch
	RELAY EQU P1.0	;equate port P1.0 as relay
	LED EQU P0		;equate port 0 as LED
	BUZZER EQU P2.0	;equate port P2.0 as buzzer
				//if status 1 switch is zero(released)
	ORG 0000H		;initialize code memory from location 0000h
	SETB SWITCH		;make the switch as input to controller
L5:	JNB SWITCH,L4	;Jump to "L4" if switch status is zero
	SETB RELAY		;switch on the relay
	SETB BUZZER		;start (buzzing) relay
	MOV LED,#00H	;turn on all leds
	ACALL DELAY		;absolute call to delay
	MOV LED,#0FFH	;turn off all leds
	ACALL DELAY		;absolute call to delay
	SJMP L5			;short jump again to "L5"
				//if status o switch is zero(pressed)
L4:	CLR RELAY		;turn off the relay
	CLR BUZZER		;turn of the buzzer
	MOV LED,#55H	;turn on leds alternately(at even pin's)
	ACALL DELAY		;absolute call to delay
	MOV LED,#0AAH	;turn on leds alternately(at odd pin's)
	ACALL DELAY		;absolute call to delay
	SJMP L5			;short jump again to "L5"
				//delay of 1Sec using loop
DELAY: 	MOV R0,#0AH	;moov 0Ah in R0 reg. immediately
	L3:	MOV R1,#0B4H;moov B4h in R1 reg. immediately
	L2:	MOV R2,#0FFH;moov FFh in R2 reg. immediately
	L1:	DJNZ R2,L1	;decrement R2 and jump to "L1" until zero
		DJNZ R1,L2	;decrement R1 and jump to "L2" until zero
		DJNZ R0,L3	;decrement R0 and jump to "L3" until zero
		RET			;retun to main program from where to call
		END			;end the program