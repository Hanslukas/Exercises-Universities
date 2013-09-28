section .data

message: db 'Hello world!', 0x0A; Potevo scrivere pure 10 che equivale allo \n
length: equ $-message; equ definisce una costante. Il $ il cursore in questo preciso instante e message è il messaggio. La sottrazione mi da la lunghezza effettiva in byte

section .text

 	global _start
_start:

	mov eax, 4
	mov ebx, 1
	mov ecx, message
	mov edx, length
	int 80h

	mov eax, 1
	mov ebx, 0
	int 80h
