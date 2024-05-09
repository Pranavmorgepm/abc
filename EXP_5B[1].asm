;EXPERIMENT NO.:05:B:
;Interfaceing Serial communication using UART of 8051 with PC 
;using various baud rate.
;NAME: ABHAY SACHIN PHALLE
;ROLL NO.: 213070
;DATE: 06/03/2024
;BATCH: C3
	ORG 0000H
	MOV P0,#00H 	;Make the Port 0 as output port
	MOV SCON,#50H 	;Load 50H in the SCON to select the mode 1 of serial communication
	MOV TMOD,#20H 	;Load 20H in the TCON n select timer 1 mode 2 for baud rate gene.
	MOV TH1,#-3; 	;baud rate of 9600
	SETB TR1 		;Start the timer
L1: CLR RI 			;Clear the RI flag
	JNB RI,$ 		;Check the RI flag and stay in loop if it is 0
	MOV P0,SBUF 	;Move the received data to the port 0
	SJMP L1 		;Backward short jump to continue
	END