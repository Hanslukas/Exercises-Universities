;Somma elementi sotto la 
;diagonale non compresa

section .data
M dw 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
n equ 4
k equ 76
dim equ $-M
vero db "vero",10
len_vero equ $-vero
falso db "falso",10
len_falso equ $-falso

section .text
global _start
_start:
	mov ecx,n
	mov ebp,0
	mov esi,n	
	shl esi	,1
	mov dx,0
	mov ebx,3
	mov eax,8
	dec ecx

scansiona:
	add dx,[M+eax+ebx*2]
	cmp ebx,ecx
	je cambiariga
	inc ebx
	jmp scansiona

cambiariga:
	add eax,esi
	inc ebp
	cmp eax,dim
	je compara	
	sub ebx,ebp
	jmp scansiona

compara:
	cmp dx,k
	je stampavero

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
