%include "stdmac.mac"
%include "tablero.mac"
section .bss
	
	buffText:		resb 8
	buffTextTemp:	resb 8

	buffPosA:		resb 8	; pos A --> pos B
	buffPosB:		resb 8		;
	lenBuffPos:	equ $ - buffPosB	

	buffFila:		resb 8	;
	buffColu:		resb 8		;

	arrayJuego:		resb 8*8


	
section .data
	
	;Perdon por esto:
                           ; * ┌ ─ │  = 3Bytes cada uno ** 
   tablero:  db   " ┌────────────────────────────────────────────────────────────────────────┐",10,
   lenLinea1   equ   $ - tablero

   fill:  db   " │",0x1b,"[1;40m",0x1b,"[1;40m",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[0m│",10
   lenFila  equ   $ - fill
   msg3:  db   "a│",0x1b,"[1;40m",0x1b,"[1;40m",0x1b,"[1;47m    x    ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m    x    ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m    x    ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m    x    ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[0m│",10
   msg4:  db   " │",0x1b,"[1;40m",0x1b,"[1;40m",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[0m│",10

   msg5:  db   " │",0x1b,"[1;40m",0x1b,"[1;40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m",0x1b,"[0m│",10
   msg6:  db   "b│",0x1b,"[1;40m",0x1b,"[1;40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m",0x1b,"[0m│",10
   msg7:  db   " │",0x1b,"[1;40m",0x1b,"[1;40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m",0x1b,"[0m│",10


   msg10:  db  " │",0x1b,"[1;40m",0x1b,"[1;40m",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[0m│",10
   msg11:  db  "c│",0x1b,"[1;40m",0x1b,"[1;40m",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[0m│",10  
   msg12:  db  " │",0x1b,"[1;40m",0x1b,"[1;40m",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[0m│",10

   msg14:  db  " │",0x1b,"[1;40m",0x1b,"[1;40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m",0x1b,"[0m│",10
   msg15:  db  "d│",0x1b,"[1;40m",0x1b,"[1;40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m",0x1b,"[0m│",10
   msg16:  db  " │",0x1b,"[1;40m",0x1b,"[1;40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m",0x1b,"[0m│",10

   msg18:  db  " │",0x1b,"[1;40m",0x1b,"[1;40m",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[0m│",10
   msg19:  db  "e│",0x1b,"[1;40m",0x1b,"[1;40m",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[0m│",10
   msg20:  db  " │",0x1b,"[1;40m",0x1b,"[1;40m",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[0m│",10
   msg22:  db  " │",0x1b,"[1;40m",0x1b,"[1;40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m",0x1b,"[0m│",10
   msg23:  db  "f│",0x1b,"[1;40m",0x1b,"[1;40m         ",0x1b,"[1;47m    o    ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m    o    ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m    o    ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m    o    ",0x1b,"[0m",0x1b, "[40m",0x1b,"[0m│",10
   msg24:  db  " │",0x1b,"[1;40m",0x1b,"[1;40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m",0x1b,"[0m│",10

   msg26:  db  " │",0x1b,"[1;40m",0x1b,"[1;40m",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[0m│",10
   msg27:  db  "g│",0x1b,"[1;40m",0x1b,"[1;40m",0x1b,"[1;47m    o    ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m    o    ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m    o    ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m    o    ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[0m│",10
   msg28:  db  " │",0x1b,"[1;40m",0x1b,"[1;40m",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[0m│",10

   msg30:  db  " │",0x1b,"[1;40m",0x1b,"[1;40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m",0x1b,"[0m│",10
   msg31:  db  "h│",0x1b,"[1;40m",0x1b,"[1;40m         ",0x1b,"[1;47m    o    ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m    o    ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m    o    ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m    o    ",0x1b,"[0m",0x1b, "[40m",0x1b,"[0m│",10
   msg32:  db  " │",0x1b,"[1;40m",0x1b,"[1;40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m         ",0x1b,"[1;47m         ",0x1b,"[0m",0x1b, "[40m",0x1b,"[0m│",10,
   msg33:  db  " └────────────────────────────────────────────────────────────────────────┘",10
   msg34:  db  "      1        2        3        4        5        6        7        8   ",0x1b,"[0m",  0x0A

   lenTablero: equ $ - tablero

	errMov	db 'Movimiento no permitido', 0x0A
	lenErrMov	equ	$ - errMov

	errDatos	db 'Movimiento no permitido', 0x0A
	lenErrDatos	equ	$ - errDatos


	errTurno	db 'Continua el juador: ' 
	lenErrTurno	equ	$ - errTurno

	msjInicial	db 'Bienvenido al juegos damas', 0x0A, ' Inician las "x"',0x0A
	lenMsjInicial	equ	$ - msjInicial
	
	msjMoverDe	db '¿Cuál ficha desea mover?', 0x0A
	lenMsjMoverDe	equ	$ - msjMoverDe

	msjMoverA	db '¿A que posición la desea mover?',0x0A
	lenMsjMoverA equ	$ - msjMoverA
	
;	juego	db '4321aVcd5678efghABCDqwerEFGHwxyz4321abcd5678efghABCDqwerEFGHwxyz'
;	juego db '0 2 4 6 8 A C E G I G M O Q S V X Y b d f h j l n p r u w y " $ '
;	juego	db	'0 1 2 3 4 5 6 7 8 9 A B C D E F G H I J K L M N O P Q R S T U V W'
	juego	db	'0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ01234'

SECTION .text
	global _start

_start:

	print msjInicial, lenMsjInicial
	print tablero, lenTablero

	
llenarTablero:
	push	rax			; tmp valor a mover
	push	rbx			; filas
	push	rcx			; columnas
	push	r10			; Mapeo de lineas
	push	r11			; tmp	11-23
	push	r12			; puntero, array datos
	push	r14
	push	r15

	xor	rax, rax
	xor	rbx, rbx
	xor	rcx, rcx
;	xor	rcx, rcx
	xor	r10, r10
	xor	r11, r11
	xor	r12, r12
	xor	r14, r14
	xor	r15, r15
	inc	rcx		;rcx = 1
	call	llenarTableroAux

	pop	r15
	pop	r14
	pop	r12
	pop	r11
	pop	r10
	pop	rcx
	pop	rbx
	pop	rax

print tablero, lenTablero;  

	exit
	;ret


llenarTableroAux:
;call filas
	xor	r12, r12
	xor	r14, r14

.for1:
	cmp	r14, 9
	je		.listo
	inc	r14
	xor	r15, r15
	inc	r15
;	inc rcx
.for2:
	call	filas
	inc	r12	; puntero datos
.debug:
	inc	r15
	cmp	r15, 5
	jne	.for2
	jmp	.for1

.listo:
	ret


.fin:
	exit

filas:
;	jmp	.cargar
;	print tablero, lenTablero;  
	xor	r10, r10
	xor	r11, r11
	xor	rax, rax	
	cmp	r14, 1
	je		.fila1
	cmp	r14, 2
	je		.fila2
	cmp	r14, 3
	je		.fila3
	cmp	r14, 4
	je		.fila4
	cmp	r14, 5
	je		.fila5
	cmp	r14, 6
	je		.fila6
	cmp	r14, 7
	je		.fila7
	cmp	r14, 8
	je		.fila8
	cmp	r14, 9
	je	.lleno
;	jmp	.lleno

;                                   R10	    		RBX					    RCX	        r11->13/22	
;tablero + lenLinea1 + (lenFila * "XfilaX") + ( 16 * "fila" ) + ( 18 * ("col1"-1) ) + par/impar]

.fila1:
	mov	r10, 1
	mov	r11, 13
	jmp	.cargar
.fila2:
	mov	r10, 4
	mov	r11, 22
	jmp	.cargar
.fila3:
	mov	r10, 7
	mov	r11, 13
	jmp	.cargar
.fila4:
	mov	r10, 10
	mov	r11, 22
	jmp	.cargar
.fila5:
	mov	r10, 13
	mov	r11, 13
	jmp	.cargar
.fila6:
	mov	r10, 16
	mov	r11, 22
	jmp	.cargar
.fila7:
	mov	r10, 19
	mov	r11, 13
	jmp	.cargar
.fila8:
	mov	r10, 22
	mov	r11, 22
	jmp	.cargar
	
.cargar:	
;.ver0:
;	mov	r10, 4		;## numero +=3 = fila.next	
;	mov	r11, 22		;13/22
;	mov	r12, 1		;puntero array datos
;	mov	r15, 	2;filas pos		

	xor	r13, r13		;resultado, pos final
	xor	rdi, rdi		;reg de uso temporal

	
.ver1:	;lemfila * r10; XfilaX
	push	rdi
	xor	rdi, rdi
	mov	r13, r10
;	lea	rdi, [lenFila]
	mov	rdi, lenFila
	imul	r13, rdi	
	pop	rdi
	
	
.ver2: 	;16 * r15
	xor	rax, rax
	push	r15
	imul	r15, 16
	add	r13, r15
	pop	r15
	

.ver3:	; 18 * (r15-1)
	push	r15
	;dec	r15
	imul	r15, 18
	sub	r15, 18
	add	r13, r15
	pop	r15


.ver4:	;+r11 13/12
	add	r13, r11

.ver5:	
;            	R10					R15   	           R15 	 	r11->13/22
; (lenFila * "XfilaX") + ( 16 * "fila" ) + ( 18 * ("col1"-1) ) + par/imp

	mov	al, byte[juego+r12]	; 
	mov	byte[tablero +lenLinea1 + r13], al ; 1
	
.veros:
	print tablero, lenTablero

cmp r14, 9
jne	.good
.lleno:
exit
.good:
	ret

	;rdi  y rsi
		;  8, 16, 32nd 64-bit references, respectively:
;
;     AL/AH, CL/CH, DL/DH, BL/BH, SPL, BPL, SIL, DIL, R8B-R15B 
;     AX, CX, DX, BX, SP, BP, SI, DI, R8W-R15W 
;     EAX, ECX, EDX, EBX, ESP, EBP, ESI, EDI, R8D-R15D 
;     RAX, RCX, RDX, RBX, RSP, RBP, RSI, RDI,					

;	mov r10, lenTablero;len = 3879	;lenFill = 143

printTablero:
	print	tablero, lenTablero; lenLinea1 + lenFill 
	print msjMoverDe, lenMsjMoverDe

jmp readDe
	

readDe:	;
		leer  buffPosA, lenBuffPos	; len de lectura en rax
		print buffPosA, lenBuffPos			
readA:
		leer  buffPosB, lenBuffPos	; len de lectura en rax
		print buffPosB, lenBuffPos
		
	exit

ErrorLectura:
	print	errDatos, lenErrDatos
	ret
