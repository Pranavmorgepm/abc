;EXPERIMENT NO.: 1D:Convertion of Fahrenheit to Celsius
;NAME: ABHAY SACHIN PHALLE
;ROLL NO.: 213070
;DATE: 30/01/2024
;BATCH: C3
	X EQU P1.0		;assign name to the port pin 1.0 as x
	y EQU P1.1		;assign name to the port pin 1.1 as y
	SUM EQU P1.2	;assign name to the port pin 1.2 as sum
	CAR EQU P1.3	;assign name to the port pin 1.3 as car
		ORG 0000H	;initialise the code location from location 0000h
		SETB X		;set port pin x as a input
		SETB Y		;set port pin y as a input
	L1: MOV C,X		;moov information in x to carry bit
		CPL C		;compliment information in carry bit
		ANL C,Y		;do logically ANDing of carry bit and y
		MOV 00H,C	;store result inside carry into bit location 00h
		MOV C,Y		;moov information in y to carry bit
		CPL C		;compliment information in carry bit
		ANL C,X		;do logically ANDing of carry bit and x
		ORL C,00H	;do logical ORing of info. in c and info. at location 00h
		MOV SUM,C	;moov result to the sum(port pin 1.2)
		MOV C,X		;moov information in x to carry bit
		ANL C,Y		;do logically ANDing of carry bit and y
		MOV CAR,C	;moov result to the car(port pin 1.3)
		SJMP L1		;short jump to the loop L1
		END			;end the program