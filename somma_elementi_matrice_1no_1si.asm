;Somma elementi uno si e uno no
;Partendo dal primo 

section .data
M dw 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
n equ 4
k equ 68
dim equ $-M
vero db "vero",10
len_vero equ $-vero
falso db "falso",10
len_falso equ $-falso

section .text
global _start
_start:
	mov eax,0
	mov ebx,0
	mov ecx,3
	mov ebp,0
	mov esi,n
	shl esi,1
	mov dx,0
	
scansiona:
	inc ebp
	add dx,[M+eax+ebx*2]
	add eax,esi
	inc ebx
	add dx,[M+eax+ebx*2]
	sub eax,esi
	cmp ebp,2
	je cambiariga
	inc ebx
	loop scansiona
	
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
	
cambiariga:
	mov ebx,0
	add eax,esi
	add eax,esi
	jmp scansiona
	
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
