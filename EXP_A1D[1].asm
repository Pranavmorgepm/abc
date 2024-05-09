;EXPERIMENT NO.: 1D:Convertion of Fahrenheit to Celsius
;NAME: ABHAY SACHIN PHALLE
;ROLL NO.: 213070
;DATE: 30/01/2024
;BATCH: C3
	ORG 0000H	;initialise the code location from 0000h
	MOV R0,#30H	;initialise source pointer
	MOV R1,#40H	;initialise destination pointer
	MOV R2,#05H	;initialise counter
L1:	MOV A,@R0	;moov value in reg. R0 to Accu.
	SUBB A,#20H	;divide value in Accu. by 20H(32)
	MOV B,#9	;initialise math reg. by 9
	DIV AB		;divide value in Accu. by value in reg. B
	MOV B,#5	;initialise math reg. by 5
	MUL AB		;multiply value in Accu. with value in reg. B
	MOV @R1,A	;moov value in Accu. to memory location where reg. R1 is pointed
	INC R0		;increment reg. R0
	INC R1		;increment reg. R1
	DJNZ R2,L1	;decrement R2 and jump to L2 until zero 
	END			;terminate the program