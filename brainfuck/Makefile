FILE := interpreter compiler

all: ${FILE}
interpreter: interpreter.c
	gcc interpreter.c -o interpreter
# in the future it should become
#       bc interpreter.b -o bc

compiler: compiler.c
	gcc compiler.c -o compiler
# in the future it should be
#       bc compiler.b -o bc

int: interpreter
	./interpreter examples/hw.b

com: compiler
	./compiler examples/hw.b
	./examples/hw
clean:
	rm -fr $(FILE)
