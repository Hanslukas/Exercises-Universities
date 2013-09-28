;Somma digaonale principale

section .data
M dd 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
n equ 4
vero db "vero",10
len_vero equ $-vero
falso db "falso",10
len_falso equ $-falso

section .text
global _start
_start:
	mov eax,0; colonna
	mov ebx,0; riga
	mov esi,n
	shl esi,2
	mov edx,0
	mov ecx,4
		
scansiona_diag1:
	add edx,[M+eax+ebx*4];
        cmp edx,34
        je stampavero
	inc ebx
	add eax,esi
	loop scansiona_diag1
	
stampafalso:
	mov edx,len_falso
	mov ecx, falso
	mov ebx,1
	mov eax,4
	int 0x80
	jmp fine

stampavero:
	mov edx, len_vero
	mov ecx,vero
	mov ebx,1
	mov eax,4
	int 0x80

fine:
	mov ebx,0
	mov eax,1
	int 0x80
