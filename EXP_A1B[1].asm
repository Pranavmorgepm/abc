;EXPERIMENT NO.: 1B:To add Block of data assuming the sum to be 16 bit.
;NAME: ABHAY SACHIN PHALLE
;ROLL NO.: 213070
;DATE: 30/01/2024
;BATCH: C3
	ORG 0000H	;initialise the code location from 0000h
	SETB RS0	;set RS0 in PSW to select reg. bank 1
	CLR RS1		;clr RS1 in PSW to select reg. bank 1
	MOV R0,#30H	;initialise RO with value 30H
	MOV R1,#0AH	;initialise program counter by value 0A
	CLR A		;clear accu.
L2:	ADD A,@R0	;add data into reg. R0 and data in Accu.
	JNC L1		;jump to L1 if carry is not generated
	INC R3		;increment register R3 as a MSB of result
L1:	INC R0		;increment R0 reg.
	DJNZ R1,L2	;decrement reg. R1 and jump to L2 untill zero
	MOV R2,A	;moov data in the Accu. to reg. R2
	END			;terminate the code