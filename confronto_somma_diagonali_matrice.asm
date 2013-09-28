;Somma delle 2 diagonale e vedo se i
;Risultati sono uguali

section .data
M dw 7,15,3,10,4,2,1,11,7,2,0,56,1,21,4,5
n equ 4
vero db "vero",10
len_vero equ $-vero
falso db "falso",10
len_falso equ $-falso

section .text
global _start
_start:
	mov ebx,0
	mov ebp,0
	mov esi,n
	shl esi,1
	mov ecx,4
	mov dx,0
	mov ax,0
	mov edi,3
	
scansiona:
	add dx,[M+ebp+ebx*2]
	add ax,[M+ebp+edi*2]
	inc ebx
	add ebp,esi
	dec edi
	loop scansiona

confronta:
	cmp dx,ax
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
