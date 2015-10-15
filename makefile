#programa para ensamblar
ASSEMBLER = nasm
# programa para enlazar
LINKER = ld
# banderas
FORMAT = elf64
CODE = damas.asm
OBJECT = damas.o
EXECUTABLE = damas

$(EXECUTABLE):$(OBJECT)
	$(LINKER) -o $(EXECUTABLE) $(OBJECT)

$(OBJECT):$(CODE)
	$(ASSEMBLER) -f $(FORMAT) -o $(OBJECT) $(CODE)

clear:
	rm *.o damas -r
