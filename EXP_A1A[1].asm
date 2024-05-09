;EXPERIMENT NO.: 1A:To add two BCD numbers.
;NAME: ABHAY SACHIN PHALLE
;ROLL NO.: 213070
;DATE: 24/01/2024
;BATCH: C3
	ORG 0000H	;initialise the code location from 0000h
	SETB RS0	;set bit rs0 in psw to select reg. bank 1
	CLR RS1		;clear bit rs1 in psw to select reg. bank 1
	MOV R0,#0AH	;load the reg. r0 with value 0A
	MOV R1,#02H	;load the reg. r1 with value 02
	MOV A,R0	;moov data in r0 to Accu. 
	ADD A,R1	;do the addition of data in r1 with data in Accu.
	DA A		;convert the hexadecimal no. to BCD
	END			;terminate the program