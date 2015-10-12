Damas:

Consiste en la implementación de un software para jugar «Damas»
utilizando lenguaje ensamblador. El objetivo es afianzar algunos de los conceptos y técnicas de
programación estudiados durante el curso, por ejemplo: “estructuras de control”, uso de la pila, manejo
de la memoria de forma indirecta (a través de índices, como se hace en los arreglos en lenguajes de alto
nivel); así como invitar al estudiante a investigar con más detalle otras herramientas, servicios y
técnicas para resolver adecuadamente el proyecto.

Descripción del Damas

El origen de este juego es incierto, pero su popularidad es muy grande lo cual es claro por la cantidad
de variaciones que existen. En términos generales este es un juego de tablero para dos personas donde
los jugadores se enfrentan utilizando 12 fichas cada uno; dispuestas en dos extremos del tablero y solo
sobre casillas de un mismo color. Alternando en los turnos de juego y moviendo las fichas solo en
diagonal, los jugadores deben eliminar del tablero las piezas del contrario.


El tablero del juego es como se muestra en la figura 1. Consiste de una matriz de 8 filas e igual número
de columnas, con colores claros y oscuros intercalados. El juego finaliza cuando un jugador se queda
sin fichas o sin movimientos por realizar.
Dada la gran variedad de versiones del juego, para efectos de este proyecto se utilizará como referencia
el estilo tradicional según como se explica en el sitio wikipedia 1 y con las modificaciones mínimas que
se detallan acá:

• Se juega por turnos alternos.

• Empieza a jugar quien tiene las fichas oscuras.

• En su turno cada jugador mueve una pieza propia.

• Las piezas se mueven (cuando no comen) una posición adelante (nunca hacia atrás) en diagonal
   a la derecha o a la izquierda, a una posición adyacente vacía.

•Comer: Para comer una pieza contraria debe estar justo en diagonal delante de una de sus
piezas. Se realiza siempre en dirección de ataque y en diagonal saltando sobre la pieza que se
quiere «comer», y cayendo en la casilla inmediatamente detrás de ella siguiendo la dirección del
movimiento de nuestra pieza. Este movimiento se puede realizar siempre y cuando la casilla
final esté libre. Las capturas se pueden encadenar. Esto es, si saltamos una pieza y desde esa
posición podemos saltar una y otra, lo hacemos. Si podemos, estamos obligados a comer (todas
las piezas posibles). Delante de varias opciones, estamos obligados a comer el máximo de
piezas posibles, siempre y cuando alguna de sus piezas no esté en riesgo.

•La reina (Corona): Cuando una pieza alcanza la última fila, se convierte en reina. Para mostrar
su nueva categoría, se suele colocar otra pieza encima de la que ha accedido a reina o dama. Las
reinas se mueven, al igual que las piezas normales, siguiendo las diagonales, pero a diferencia
de éstas, se puede mover adelante y hacia atrás en la casilla que quiera siempre que este libre.
Del mismo modo, la reina come una pieza del contrario, deberá caer inmediatamente en la
casilla siguiente a la que el jugador pueda acceder. La reina o dama puede comer más de dos
piezas seguidas, en todas las direcciones.

•Final de partida: Pierde quien se queda sin piezas sobre el tablero. Si cuando llega el turno de
un jugador no puede mover, puesto que todas las piezas que le restan en juego están bloqueadas
pierde a quien le corresponde el movimiento.

•Deben dar la posibilidad a los jugadores de guardar el estado actual del tablero en un archivo,
como sería de esperar si un jugador quiere reanudar el juego la aplicación debe permitirle
cargar desde un archivo el estado del juego.


