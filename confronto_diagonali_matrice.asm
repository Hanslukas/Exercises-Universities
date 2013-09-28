;Vedo se il primo elemento della diagonale principale
;è uguale all'ultimo elemento della diagonale secondaria

section .data
M dd 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
n equ 4
vero db "vero",10
len_vero equ $-vero
falso db "falso",10
len_falso equ $-falso

section .text
global _start
_start:
	mov ebx,0; riga
	mov eax,0; colonna
	mov esi,n
	shl esi,2
	mov ecx,4
	mov ebp,48
	
scansiona:
	mov edx,[M+eax+ebx*4]
	mov edi,[M+ebp+ebx*4]
	cmp edx,edi
	jne stampafalso
	inc ebx
	add eax,esi
	sub ebp,esi
	loop scansiona
	
stampavero:
	mov edx, len_vero
	mov ecx,vero
	mov ebx,1
	mov eax,4
	int 0x80
	jmp fine

stampafalso:
	mov edx,len_falso
	mov ecx, falso
	mov ebx,1
	mov eax,4
	int 0x80
	
fine:
	mov ebx,0
	mov eax,1
	int 0x80
