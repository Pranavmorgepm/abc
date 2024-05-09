;EXPERIMENT NO.:05:A:
;Interfaceing Serial communication using UART of 8051 with PC 
;using various baud rate.
;NAME: ABHAY SACHIN PHALLE
;ROLL NO.: 213070
;DATE: 06/03/2024
;BATCH: C3
	ORG 0000H
	MOV SCON,#50H 	; Load 50H in the SCON to select the mode 1 of serial communication
	MOV TMOD,#20H 	;Load 20H in the TCON n select timer 1 mode 2 for baud rate gene.
	MOV TH1,#-3; 	;baud rate of 9600
	SETB TR1 		;Start timer
L3: MOV DPTR,#MESS 	;Load dptr with location of data 
L2: CLR A 			; Clear ACC
	MOVC A,@A+DPTR 	; Take the first 8 bit data in the ACC
	JZ L3 			; Chack if ACC is zero or not , if not the jmp to L3
	MOV SBUF,A 		; Move the data from ACC to SBUF
	JNB TI,$ 		;Check the TI flag and stay in loop if it is 0
	CLR TI 			;Clear TI flag
	INC DPTR 		; Increment the DPTR
	SJMP L2 		; Backward unconditional jmp to continue
 
		;Data store in the code memory
		ORG 500
MESS: 	DB "WELCOME TO VIIT ",0DH,0AH,"ROLL NO : 213070",0DH,0AH,"ABHAY SACHIN PHALLE",0DH,0AH,0DH,0AH,0;
		END