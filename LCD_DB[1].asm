;EXPERIMENT NO.:03:
;Interfacing of 16x2 LCD in 8 bit mode with 8051 microcontroller
;NAME: ABHAY SACHIN PHALLE
;ROLL NO.: 213070
;DATE: 12/02/2024
;BATCH: C3

	LCD EQU P0  	;equate port 0 as LCD
	RS EQU P2.0  	;equate P2.0 as Reg. Select of LCD
	RW EQU P2.1  	;equate P2.1 as Read/Write of LCD
	EN EQU P2.2  	;equate P2.2 as Enable of LCD
		
	ORG 0000H		;Initialise code memmory from 0000H
	MOV A,#38H		;use LCD in 8_bitx2_lines
	ACALL command	;set 38H as a command to LCD
	MOV A,#0EH		;make display On cursor On of LCD 
	ACALL command	;set 0EH as a command to LCD
	MOV A,#01H		;clear prvious display of LCD
	ACALL command	;set 01H as a command to LCD
	MOV A,#06H		;turn on LCD in Entry Mode
	ACALL command	;set 06H as a command to LCD
	
	MOV A,#80H		;1st line 1st position of LCD
	ACALL command 	;set 80H as a command to LCD
	MOV A,#'N'   	;move character 'N' to Accu.
	ACALL display  	;absolute call 'display' to dis. character in A
	MOV A,#'A'   	;move character 'A' to Accu.
	ACALL display   ;absolute call 'display' to dis. character in A
	MOV A,#'M'   	;move character 'M' to Accu.
	ACALL display   ;absolute call 'display' to dis. character in A
	MOV A,#'E'   	;move character 'E' to Accu.
	ACALL display  	;absolute call 'display' to dis. character in A
	MOV A,#':'   	;move character ':' to Accu.
	ACALL display  	;absolute call 'display' to dis. character in A
	MOV A,#'A'   	;move character 'A' to Accu.
	ACALL display  	;absolute call 'display' to dis. character in A
	MOV A,#' '   	;move character '(NULL)' to Accu.
	ACALL display   ;absolute call 'display' to dis. character in A
	MOV A,#'S'   	;move character 'S' to Accu.
	ACALL display   ;absolute call 'display' to dis. character in A
	MOV A,#' '   	;move character '(NULL)' to Accu.
	ACALL display   ;absolute call 'display' to dis. character in A
	MOV A,#'P'   	;move character 'P' to Accu.
	ACALL display   ;absolute call 'display' to dis. character in A
	MOV A,#'H'   	;move character 'H' to Accu.
	ACALL display   ;absolute call 'display' to dis. character in A
	MOV A,#'A'   	;move character 'A' to Accu.
	ACALL display   ;absolute call 'display' to dis. character in A
	MOV A,#'L'   	;move character 'L' to Accu.
	ACALL display	;absolute call 'display' to dis. character in A
	MOV A,#'L'		;move character 'L' to Accu.
	ACALL display	;absolute call 'display' to dis. character in A
	MOV A,#'E'		;move character 'E' to Accu.
	ACALL display	;absolute call 'display' to dis. character in A

	MOV A,#0C0H		;2nd line 1st position of LCD
	ACALL command 	;
	MOV A,#'R'		;move character 'R' to Accu.
	ACALL display	;absolute call 'display' to dis. character in A
	MOV A,#'O'   	;move character 'O' to Accu.
	ACALL display   ;absolute call 'display' to dis. character in A
	MOV A,#'L'   	;move character 'L' to Accu.
	ACALL display   ;absolute call 'display' to dis. character in A
	MOV A,#'L'   	;move character 'L' to Accu.
	ACALL display   ;absolute call 'display' to dis. character in A
	MOV A,#' '   	;move character '(NULL)' to Accu.
	ACALL display   ;absolute call 'display' to dis. character in A
	MOV A,#'N'   	;move character 'N' to Accu.
	ACALL display   ;absolute call 'display' to dis. character in A
	MOV A,#'O'		;move character 'O' to Accu.
	ACALL display	;absolute call 'display' to dis. character in A
	MOV A,#':'		;move character ':' to Accu.
	ACALL display	;absolute call 'display' to dis. character in A
	MOV A,#'2'		;move character '2' to Accu.
	ACALL display	;absolute call 'display' to dis. character in A
	MOV A,#'1'		;move character '1' to Accu.
	ACALL display	;absolute call 'display' to dis. character in A
	MOV A,#'3'		;move character '3' to Accu.
	ACALL display	;absolute call 'display' to dis. character in A
	MOV A,#'0'		;move character '0' to Accu.
	ACALL display	;absolute call 'display' to dis. character in A
	MOV A,#'7'		;move character '7' to Accu.
	ACALL display	;absolute call 'display' to dis. character in A
	MOV A,#'0'		;move character '0' to Accu.
	ACALL display	;absolute call 'display' to dis. character in A
	SJMP $			;contineous loop
		
command:ACALL DELAY	;absolute call to 'DELAY' function
		MOV LCD,A	;move value in Accu. to LCD port
		CLR RS		;move data on LCD port to command reg. of LCD
		CLR RW		;
		SETB EN		;
		NOP			;provide delay of 1 machine cycle
		NOP			;provide delay of 1 machine cycle
		CLR EN		;latch the data as command
		RET			;return tolocation from where called

display:ACALL DELAY	;absolute call to 'DELAY' function
		MOV LCD,A	;move value in Accu. to LCD port
		SETB RS		;move data on LCD port to data reg. of LCD
		CLR RW		;
		SETB EN		;
		NOP			;provide delay of 1 machine cycle
		NOP			;provide delay of 1 machine cycle
		CLR EN		;latch the data as display
		RET			;return tolocation from where called
	  
DELAY:	MOV R0,#0FFH;delay function
L2:		MOV R1,#0FFH;
L1:		DJNZ R1,L1	;
		DJNZ R0,L2	;
		RET			;return tolocation from where called
		END			;terminate the program