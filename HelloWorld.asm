;================================================
;=	Created by: Ahmed Ehab Al-kataby.	=
;=	April 6, 2023				=
;================================================


;HERE ARE MACROS
%macro print 2		;"print" macro to print in screen.
	;Prepare registers(parameters) of write system call function.
	mov rbx, 1	;"1" is file descriptor.
	mov rcx, %1	;First parameter is passing string pointer.
	mov rdx, %2	;Second parameter is passing string length.

	;Call system to write pointed string by rcx.
	mov rax, 4	;"4" is write system call.
	int 80h		;Call kernel.
%endmacro	;End of "print" macro.

%macro newLine 0	;"newLine" macro to print new line in screen.
	mov rbx, 1
	mov rcx, LF	;passing character pointer.
	mov rdx, 1	;passing "1" because its character!

	mov rax, 4
	int 80h
%endmacro	;End of "newLine" macro.


;HERE ARE PROGRAM SECTIONS
section .data
;	Initialized variables and constants are placed here.
	LF db 10, 0		;VARIABLE: Line Feed character to make new line.
	hiMessage db 'Hello, World!', 0	;VARIABLE: String message to be printed.
	length equ $ - hiMessage	;CONSTANTS: Length of string message.

section .text
;	Code is placed here.
	global exit	;Declared an exit procedure.
	global _start	;Declared an entry point procedure.

exit:	;Defind exit procedure.
	mov rax, 1	;"1" is exit system call.
	mov rdx, 0	;Return 0 to system in successfully ending.
	int 80h		;Call kernel.
;End of exit procedure.

_start:	;Defind entry point procedure.
	print hiMessage, length	;Use print macro with passing arguments.
	newLine			;Make new line.
	call exit		;Call exit procedure to end program.
;End of _start procedure.
