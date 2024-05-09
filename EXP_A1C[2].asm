;EXPERIMENT NO.: 1C:Transfer a block of N bytes from external memory to internal memory
;NAME: ABHAY SACHIN PHALLE
;ROLL NO.: 213070
;DATE: 30/01/2024
;BATCH: C3
	ORG 0000H		;initialise the code location from 0000h
	MOV DPTR,#1000H	;initialise the external memory from 1000h using DPTR
	MOV R1,#30H		;initialise internal memory pointer from 30h 
	MOV R3,#0AH		;initialise counter from 0Ah
L1:	MOVX A,@DPTR	;moov data into Accu. from external memory using DPTR
	MOV @R1,A		;moov data from Accu. to reg. location pointed by R1
	INC R1			;increment reg. R1
	INC DPTR		;increment reg. DPTR
	DJNZ R3,L1		;decrement R3 and jump to L1 until zero
	END				;terminate the program