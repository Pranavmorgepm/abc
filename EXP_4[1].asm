;EXPERIMENT NO.:04:
;To Interface 4X4 matrix Keyboard to 8051 Microcontroller.
;NAME: ABHAY SACHIN PHALLE
;ROLL NO.: 213070
;DATE: 28/02/2024
;BATCH: C3
			COLUMN EQU P0			;equate port 0 for column of 4*4 matrix keyboard
			ROW EQU P1				;equate port 1 for row of *4 matrix keyboard
			LCD EQU P3				;equate port 0 as LCD
			RS EQU P2.5 			;equate P2.0 as Reg. Select of LCD
			RW EQU P2.6 			;equate P2.1 as Read/Write of LCD
			EN EQU P2.7 			;equate P2.2 as Enable of LCD  
				
		
			ORG 0000H 				;Initialise code memmory from 0000H
			MOV A,#38H 				;use LCD in 8_bitx2_lines
			ACALL command 			;set 38H as a command to LCD
			MOV A,#0EH 				;make display On cursor On of LCD 
			ACALL command 			;set 0EH as a command to LCD
			MOV A,#01H 				;clear prvious display of LCD
			ACALL command 			;set 01H as a command to LCD
			MOV A,#06H 				;turn on LCD in Entry Mode
			ACALL command 			;set 06H as a command to LCD
			MOV A,#80H 				;1st line 1st position of LCD
			ACALL command 			;set 80H as a command to LCD

			MOV A,#'N' 				;move character 'N' to Accu.
			ACALL display 			;absolute call 'display' to dis. character in A
			MOV A,#'A' 				;move character 'A' to Accu.
			ACALL display 			;absolute call 'display' to dis. character in A
			MOV A,#'M' 				;move character 'M' to Accu.
			ACALL display 			;absolute call 'display' to dis. character in A
			MOV A,#'E' 				;move character 'E' to Accu.
			ACALL display 			;absolute call 'display' to dis. character in A
			MOV A,#':' 				;move character ':' to Accu.
			ACALL display 			;absolute call 'display' to dis. character in A
			MOV A,#'A' 				;move character 'A' to Accu.
			ACALL display 			;absolute call 'display' to dis. character in A
			MOV A,#' ' 				;move character '.' to Accu.
			ACALL display 			;absolute call 'display' to dis. character in A
			MOV A,#'S' 				;move character 'S' to Accu.
			ACALL display 			;absolute call 'display' to dis. character in A
			MOV A,#' ' 				;move character '.' to Accu.
			ACALL display 			;absolute call 'display' to dis. character in A
			MOV A,#'P' 				;move character 'P' to Accu.
			ACALL display 			;absolute call 'display' to dis. character in A
			MOV A,#'H' 				;move character 'A' to Accu.
			ACALL display 			;absolute call 'display' to dis. character in A
			MOV A,#'A' 				;move character 'T' to Accu.
			ACALL display 			;absolute call 'display' to dis. character in A
			MOV A,#'L' 				;move character 'I' to Accu.
			ACALL display 			;absolute call 'display' to dis. character in A
			MOV A,#'L' 				;move character 'L' to Accu.
			ACALL display 			;absolute call 'display' to dis. character in A
			MOV A,#'E' 				;move character 'L' to Accu.
			ACALL display 			;absolute call 'display' to dis. character in A

			MOV A,#0C0H 			;2nd line 1st position of LCD
			ACALL command 		
			MOV A,#'R' 				;move character 'R' to Accu.
			ACALL display 			;absolute call 'display' to dis. character in A
			MOV A,#'O' 				;move character 'O' to Accu.
			ACALL display 			;absolute call 'display' to dis. character in A
			MOV A,#'L' 				;move character 'L' to Accu.
			ACALL display 			;absolute call 'display' to dis. character in A
			MOV A,#'L' 				;move character 'L' to Accu.
			ACALL display 			;absolute call 'display' to dis. character in A
			MOV A,#' ' 				;move character '(NULL)' to Accu.
			ACALL display 			;absolute call 'display' to dis. character in A
			MOV A,#'N' 				;move character 'N' to Accu.
			ACALL display 			;absolute call 'display' to dis. character in A
			MOV A,#'O' 				;move character 'O' to Accu.
			ACALL display 			;absolute call 'display' to dis. character in A
			MOV A,#':' 				;move character ':' to Accu.
			ACALL display 			;absolute call 'display' to dis. character in A
			MOV A, #0C8H
			ACALL command
			
			;MATRIX PROGRAM
			
			MOV COLUMN, #0FFH		;make input port
			MOV ROW, #00H			;make output port
			MOV A, COLUMN 			;see if any key is pressed
			ANL A, #00001111B 		;mask the data 
			CJNE A, #00001111B,K1	;key pressed, await closure
			ACALL DELAY				;some delay
K1:			MOV A,COLUMN			;see if any key is pressed
			ANL A,#00001111B 		;mask unused bits
			CJNE A,#00001111B,OVER 	;key pressed, await closure
K2:			ACALL DELAY				;some delay
			MOV A,COLUMN			;see if any key is pressed
			ANL A,#00001111B 		;mask unused bits
			CJNE A,#00001111B,K2	
			ACALL DELAY
OVER: 		MOV P1,#11111110B;ground row 0

			MOV A,P3 				;read all columns
			ANL A,#00001111B 		;masked unused bits
			CJNE A,#00001111B,ROW0 	;key row 0, find the column
			
			MOV P1,#11111101B 		;ground row 1
			MOV A,P3 				;read all columns
			ANL A,#00001111B 		;masked unused bits
			CJNE A,#00001111B,ROW1 	;key row 1, find the column
			
			MOV P1,#11111011B 		;ground row 2
			MOV A,P3 				;read all columns
			ANL A,#00001111B 		;masked unused bits
			CJNE A,#00001111B,ROW2 	;key row 2, find the column
			
			MOV P1,#11110111B 		;ground row 3
			MOV A,P3 				;read all columns
			ANL A,#00001111B 		;masked unused bits
			CJNE A,#00001111B,ROW3 	;key row 3, find the column
			LJMP K2 				;if none, false input, repeat
			
ROW0: 		MOV DPTR,#KCODE0 		;set DPTR = start of row 0
			SJMP FIND 				;find column key belongs to
ROW1: 		MOV DPTR,#KCODE1 		;set DPTR = start of row 1
			SJMP FIND 				;find column key belongs to
ROW2: 		MOV DPTR,#KCODE2 		;set DPTR = start of row 2
			SJMP FIND 				;find column key belongs to
ROW3: 		MOV DPTR,#KCODE3 		;set DPTR = start of row 3

FIND: 		RRC A 					;see any CY bit is low
			JNC MATCH 				;if zero, get the ASCII code
			INC DPTR 				;point to next column address
			SJMP FIND 				;keep searching
			
MATCH: 		CLR A 					;set A=0 (match is found)
			MOVC A,@A+DPTR 			;get ASCII code from table
			MOV R5,A 				;store ASCII code in register R5
			ACALL DISPLAY			;Call DISPLAY subroutine
			SJMP K1					;check if key is pressed
			
			ORG 500H
KCODE0: 	DB '0','1','2','3'
KCODE1: 	DB '4','5','6','7'
KCODE2: 	DB '8','9','A','B'
KCODE3: 	DB 'C','D','E','F'
			
command:	ACALL DELAY 			;absolute call to 'DELAY' function
			MOV LCD,A 				;move value in Accu. to LCD port
			CLR RS 					;move data on LCD port to command reg. of LCD
			CLR RW 
			SETB EN 
			NOP 					;provide delay of 1 machine cycle
			NOP 					;provide delay of 1 machine cycle
			CLR EN 					;latch the data as command
			RET 					;return tolocation from where called
display:	ACALL DELAY 			;absolute call to 'DELAY' function
			MOV LCD,A 				;move value in Accu. to LCD port
			SETB RS 				;move data on LCD port to data reg. of LCD
			CLR RW 
			SETB EN 
			NOP 					;provide delay of 1 machine cycle
			NOP 					;provide delay of 1 machine cycle
			CLR EN 					;latch the data as display
			RET 					;return tolocation from where called
DELAY: 		MOV R0,#0FFH			;delay function
L2: 		MOV R1,#0FFH
L1: 		DJNZ R1,L1 
			DJNZ R0,L2 
			RET
			END