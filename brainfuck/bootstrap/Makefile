FILE := interpreter compiler

all: ${FILE}
interpreter: interpreter.c
	gcc interpreter.c -o interpreter

compiler: compiler.c
	gcc compiler.c -o compiler

clean:
	rm -fr $(FILE)
