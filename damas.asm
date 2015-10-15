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

%macro	juegan 4; 'o'/'x', 'O'/'X', 'o'/'x'	
					; Mi ficha, mi ficha, ficha del otro
	;&&jueganN:
	cmp	bl, %1
	je		%4
	cmp	bl, %1
	jne	.noPuede
	mov	byte[tempoo], bl
	%4
	print	tempoo, 2
	print	msjMoverA, lenMsjMoverA
;validar movimiento
	xor 	r8, r8
	mov	r8, %3
	jmp	.finLeer

%endmacro
	


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

	
	; los '#' son los espacios en donde no puede ir fichas

	; esenario inicial:
	arrayJuego 	db	'o#o#o#o#'
	arrayJuego1 db '#o#o#o#o'
	arrayJuego2 db	'o#o#o#o#'
	arrayJuego3 db '# # # # '
	arrayJuego4 db ' # # # #'
	arrayJuego5 db '#x#x#x#x'
	arrayJuego6 db	'x#x#x#x#'
	arrayJuego7 db '#x#x#x#x'
	lenArrayJuego	equ $ - arrayJuego 
	
;	arrayJuego 	db	'o#o# #o#'
;	arrayJuego1 db '#o# #x#o'
;	arrayJuego2 db	'O# #o# #'
;	arrayJuego3 db '#x# # # '
;	arrayJuego4 db ' # #o#x#'
;	arrayJuego5 db '#x# #x#x'
;	arrayJuego6 db	'X#x# #x#'
;	arrayJuego6 db '#x#x# #x'
;	lenArrayJuego	equ $ - arrayJuego 

	; para probar fin de juego
;	arrayJuego 	db	' # # # #'
;	arrayJuego1 db '# # # # '
;	arrayJuego2 db	' # # # #'
;	arrayJuego3 db '# #o# # '
;	arrayJuego4 db ' #x# # #'
;	arrayJuego5 db '#x# #x#x'
;	arrayJuego6 db	'x#x#x#x#'
;	arrayJuego7 db '#x#x#x#x'
;	lenArrayJuego	equ $ - arrayJuego 


	errMov	db 'Movimiento no permitido', 0x0A
	lenErrMov	equ	$ - errMov

	errFicha	db 'No puede elegir esta posición.', 0x0A
	lenErrFicha	equ	$ - errFicha
	
	errPosReina	db 'No puede elegir esta posición.', 0x0A, 'Es reina, no Super Man.'
	lenErrPosReina	equ	$ - errFicha


	errVacio	db 'No hay ficha para mover', 0x0A
	lenErrVacio	equ	$ - errVacio

	errTurno	db 'Continua el juador:  ' 	,0x0A;r8
	lenErrTurno	equ	$ - errTurno

	msjInicial	db 'Bienvenido al juegos damas', 0x0A, ' Inician las "x"',0x0A
	lenMsjInicial	equ	$ - msjInicial
	
	msjMoverDe	db '¿Cuál ficha desea mover?', 0x0A
	lenMsjMoverDe	equ	$ - msjMoverDe

	msjMoverA	db '¿A qué posición la desea mover?',0x0A
	lenMsjMoverA equ	$ - msjMoverA

	msjOk	db 'Ok entró', 0x0A
	lenMsjOk	equ	$ - msjOk
	
	msjComerMas	db '¿Desea continuar comiendo?',0x0A
	lenComeMas	equ	$ - msjComerMas

	msjGanaO	db '¡Ganan las fichas O!',0x0A
	msjGanaX	db '¡Ganan las fichas X!',0x0A
	lenMsjGana	equ	$ - msjGanaX



	

	datos	db	'1234oooooooo        xxxxxxxxxxxx'	;pasar a -> bss
	tempoo db '??'


SECTION .text
	global _start

	;rdi  y rsi
		;  8, 16, 32nd 64-bit references, respectively:
;
;     AL/AH, CL/CH, DL/DH, BL/BH, SPL, BPL, SIL, DIL, R8B-R15B 
;     AX, CX, DX, BX, SP, BP, SI, DI, R8W-R15W 
;     EAX, ECX, EDX, EBX, ESP, EBP, ESI, EDI, R8D-R15D 
;     RAX, RCX, RDX, RBX, RSP, RBP, RSI, RDI,					

;	mov r10, lenTablero;len = 3879	;lenFill = 143



_start:

	print msjInicial, lenMsjInicial
;	print tablero, lenTablero

	xor	r8, r8
	mov	r8, 'x' ; inician las x

juegoLoop:
	call	llenarDatosJuego

	call 	llenarTablero

	print tablero, lenTablero	

	call	finSinFichas	
	
	;call	verficarGanador

	call	leerPosA

	call	leerPosB

	call  cambioFichas
	
	jmp	juegoLoop

FinDelJuego:
	exit



leerPosA: 
;	push	rax
;	push	rbx
	
	.leerA:
	; guarda en r9 las posicion del arrayJuego
	print	msjMoverDe, lenMsjMoverDe
	leer  buffPosA, lenBuffPos	; len de lectura en rax
			;una letra y un numero mas entet

	cmp	rax, 3	;dos letras y el retorno
	jne	.noPuedeA	;comprobar la lectura
	;je		infoOk
	mov	al, byte [buffPosA]
	mov	bl, byte [buffPosA+1]
	sub	al, 'a'	
	;dec	al
	imul	rax, 8
	sub	bl, '0'	
	dec	bl
	;dec	rax
	add	rax, rbx
	cmp	al, 3	;
	je		infoOk
	xor	rbx, rbx
	mov	bl, byte[arrayJuego+rax]; pos elegida

	mov	r9, rax	; se guarda la pos elegida   !!!!!!!!!!!!!!!!!

	cmp	r8,'o'
	je		.jueganO	
	cmp	r8,'x'
	je		.jueganX
	
.jueganX:	
	;validar que sea una ficha del actual jugador.
	cmp	bl, 'x'
	je		.finLeerA
	cmp	bl, 'X'
	jne	.noPuedeA
	je		.esReina

.jueganO:
	cmp	bl, 'o'
	je		.finLeerA
	cmp	bl, 'O'
	jne	.noPuedeA
	je		.esReina

.noPuedeA:
		print  errFicha, lenErrFicha
		jmp .leerA

.esReina:	
	nop
	;call	moverReina:
	
.finLeerA:
;	pop	rbx
;	pop	rax
	ret

	;aqui tiene en el "bl" la ficha a mover
	;y en r9 la pos en el arrayJuego





leerPosB:
	push	rax
	push	rbx
	xor	rax, rax

.leerB:	
	;guarda en r10 las posicion del arrayJuego
	print	msjMoverA, lenMsjMoverA; mover a x,y
	leer  buffPosB, lenBuffPos	; len de lectura en rax
	cmp	rax, 3	;dos letras y el retorno
	jne	.noPuedeB	;comprobar la lectura
	;val
	mov	al, byte [buffPosB]
	mov	bl, byte [buffPosB+1]
	sub	al, 'a'	
	imul	rax, 8
	sub	bl, '0'	
	dec	bl
	add	rax, rbx
;	cmp	al, 5	;
;	je		infoOk
	xor	rbx, rbx
	mov	bl, byte[arrayJuego+rax]; pos elegida
	cmp	bl, ' '
	jne	.noPuedeB	; 
	.dest:	;q!
	mov	r10, rax	; se guarda la pos elegida	!!!!!!!!!!!!!!!!!!


	mov	dl, byte[arrayJuego+r9]; pos elegida
	cmp 	dl, 'a'
	jnb	.noReina 		;si  es menor, es reina, es mayuscula:;
	call	moverReina		; salte si no es menor
	jmp	.finLeerB
			
	.noReina:


;	;;	validar sí reina!
		;si el deplazamieto es simetrico, igual en 'x' y 'y'
	;  let1 - letb = num1 - num2
	
.validar:
	;r8	= jugador actual:
	;r9  + arrayJuego = 	pos origen, ficha actual
	;r10 + arrayJuego = 	pos destino
	xor 	rax, rax
	xor	rbx, rbx
	xor	rcx, rcx

	mov	al, byte [buffPosA]
	mov	bl, byte [buffPosA+1]
	mov	cl, byte [buffPosB]
	mov	dl, byte [buffPosB+1]

;jmp	.validar_mov_normal
.validar_comer:
	;;;;;;;;;;;;,,,	
	cmp	r8,'o'
	je		.fComer_O
	cmp	r8,'x'
	je		.fComer_X
	;filas
	.fComer_O:					;se mueven para abajo
	add	al, 2		;salto de 2 para comer
	cmp	al, cl
	jne	.validar_mov_normal
	je		.cComer_O
			
	;jmp	.finLeerB
	.fComer_X:					;se mueven para arriba
	mov	al, byte [buffPosA]
	sub	al, 2
	cmp	al, cl
	jne	.validar_mov_normal
	je		.cComer_X

	;columnas
	.cComer_X:	

	inc	al				;al a comer
	add	dl, 2
	cmp	bl, dl
	je		.pos_mas
	mov	dl, byte [buffPosB+1]
	sub	dl, 2
	cmp	bl, dl
	jne	.validar_mov_normal
	je		.pos_menos

	.cComer_O:	

	dec	al				;al a comer
	add	dl, 2
	cmp	bl, dl
	je		.pos_mas
	mov	dl, byte [buffPosB+1]
	sub	dl, 2
	cmp	bl, dl
	jne	.validar_mov_normal
	je		.pos_menos
	
	.pos_mas:	
	dec	dl
	jmp	.aComer

	.pos_menos:
	inc	dl
	jmp	.aComer

	
	.aComer:
;	exit
	;hay que validar ficha enemigo.
	mov	bl, dl
	
	sub	al, 'a'	
	imul	rax, 8
	sub	bl, '0'	
	dec	bl
	add	rax, rbx
	;.info:
	xor	rbx, rbx
	mov	bl, byte[arrayJuego+rax]; pos elegida
	cmp	rbx, r8
	je		.noPuedeB	 
;	cmp	bl, byte[r8]
	cmp	rbx, ' '
	je		.noPuedeB
	mov	byte[arrayJuego+rax], ' '	
	;.finB:
	jmp	.finLeerB

	;;;;;;;;;;;;;,,,,	


;.validar_comer_comer:
;	nop

.validar_mov_normal:
	; Movimieto Normal (simple, diagonal)
	mov	al, byte [buffPosA]
	mov	bl, byte [buffPosA+1]
	mov	cl, byte [buffPosB]
	mov	dl, byte [buffPosB+1]
	;valida en caso 1 y 8	

	cmp 	bl, '1'
	je		.pase1
	cmp	bl, '8'
	je		.pase8	
	mov	bh, bl
	inc	bh
	cmp	bh, dl
	je		.paseN

	mov	bh, bl
	dec	bh
	cmp	bh, dl
	jne	.noPuedeB	

	jmp 	.paseN

	.pase1:	
	;cmp	dl, '3'	;comer salto de 2
	;je		.validarComer
	cmp	dl, '2'	
	jne	.noPuedeB	
	jmp	.paseN	
	.pase8:
	cmp	dl, '7'
	jne	.noPuedeB
	jmp	.paseN
	.paseN:	
	cmp	r8,'o'
	je		.vNormal_O
	cmp	r8,'x'
	je		.vNormal_X

	.vNormal_O:					;se mueven para abajo
	inc	al
	cmp	al, cl
	jne	.noPuedeB
	;validar col
		
	jmp	.finLeerB
	.vNormal_X:					;se mueven para arriba
	dec	al
	cmp	al, cl
	jne	.noPuedeB
	;validar col
	
	jmp	.finLeerB	

.noPuedeB:
	print	 errFicha, lenErrFicha
	jmp	.leerB

.finLeerB:
	pop	rbx
	pop	rax
	ret


moverReina:
	mov	al, byte [buffPosA]
	mov	bl, byte [buffPosA+1]
	mov	cl, byte [buffPosB]
	mov	dl, byte [buffPosB+1]
	sub	al, cl
	sub	bl, dl
	cmp	al, bl
	jne	.no_puede_reina

	cmp	r8,'o'
	je		.comer_RO
	cmp	r8,'x'
	je		.comer_RX

	.comer_RO:

	.comer_RX:	

	.no_puede_reina:
	print errPosReina, lenErrPosReina

	ret

cambioFichas:
	push 	r9
	push	r10
	;r8	= jugador actual
	;r9  + arrayJuego = 	pos origen, ficha actual
	;r10 + arrayJuego = 	pos destino

	mov	al, byte[arrayJuego + r9]
	mov	byte[arrayJuego + r9], ' '
	mov	byte[arrayJuego + r10], al 
	call	validarReina
;	call	llenarTablero
	call	cambioDeJugador
	
	pop	r10
	pop	r9
	ret


validarReina:
	mov	cl, byte [buffPosB]
	cmp	r8,'o'
	je		.llego_abajo
	cmp	r8,'x'
	je		.llego_arriba

	.llego_abajo:
	cmp	cl,'h'
	jne		.no_reina
	mov	byte[arrayJuego + r10], 'O' 

	.llego_arriba:
	cmp	cl, 'a'
	jne		.no_reina
	mov	byte[arrayJuego + r10], 'X' 

	;.fin_val_reina:
	nop
	.no_reina:
	ret

cambioDeJugador:
	cmp	r8,'o'
	je		.cambio_a_X	
	cmp	r8,'x'
	je		.cambio_a_O
.cambio_a_O:
	xor	r8, r8
	mov	r8, 'o'
	ret
.cambio_a_X:
	xor 	r8, r8
	mov	r8, 'x'
	ret


; aquí:
; es una posición valida
; no está ocupada



infoOk:
	print msjOk, lenMsjOk
	exit
	


finSinFichas:
	; verifica si un jugador se quedó sin fichas
	; de ser así finaliza el juego
	push	rax	
	push	rbx
	push	rcx
	xor	rax, rax	
	xor	rbx, rbx
	xor	rcx, rcx

	.hay_o:
		;validar ! -.-
	mov	bl, byte[arrayJuego+rax]
	inc	rax
	cmp	bl, 'o'
	je		.ok_hay
	cmp	bl, 'O'
	je		.ok_hay
	cmp	rax, lenArrayJuego 
	je		.no_hay_o
	jne	.hay_o
		
	
	.hay_x:	
	mov	bl, byte[arrayJuego+rcx]
	inc	rcx
	cmp	bl, 'o'
	je		.ok_hay
	cmp	bl, 'O'
	je		.ok_hay
	cmp	rcx, lenArrayJuego
	je		.no_hay_x
	jne	.hay_x

	.ok_hay:

	pop	rcx
	pop	rbx
	pop	rax
	ret
	.no_hay_x:
	;ganan las o
	print	msjGanaO, lenMsjGana	
	exit
	.no_hay_o:
	;ganan las x
	print	msjGanaX, lenMsjGana	
	exit


llenarDatosJuego:
	push	r8
	push	r9
	push	rax
	xor	r8, r8
	xor	r9, r9
	call llenarDatosJuegoAux
	pop	rax
	pop	r9
	pop	r8
	ret

llenarDatosJuegoAux:
	;datos	db 'xxx...ooo'
	;arrayJuego resb 64
	mov	al, byte[arrayJuego+r8]	
	inc	r8
	cmp	al, '#'
	je		llenarDatosJuegoAux
	mov	byte[datos+r9], al 
	inc	r9
	cmp	r8, lenArrayJuego
	jne	llenarDatosJuegoAux
	ret

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

	mov	al, byte[datos+r12]	; 
	mov	byte[tablero +lenLinea1 + r13], al ; 1
	
;.veros:
;	print tablero, lenTablero

cmp r14, 9
jne	.good
.lleno:
	
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

