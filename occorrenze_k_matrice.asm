;Vedo se c'è k sulla prima diagonale

section .data
M dw 21,5,3,12,4,3,14,11,32,2,5,56,4,11,14,3
n equ 4
k equ 3
vero db "vero",10
len_vero equ $-vero
falso db "falso",10
len_falso equ $-falso

section .text
global _start
_start:
	mov ebx,0
	mov eax,0
	mov esi,n
	shl esi,1
	mov ecx,4
	
scansiona:
	mov dx,[M+eax+ebx*2]
	cmp dx,k
	je stampavero
	inc ebx
	add eax,esi
	loop scansiona

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
