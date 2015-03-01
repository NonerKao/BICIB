FILE := interpreter compiler

all: ${FILE}
interpreter: interpreter.c
	gcc interpreter.c -o interpreter
compiler: compiler.c
	gcc compiler.c -o compiler

int: interpreter
	cat examples/hw.b | ./interpreter

com: compiler
	cat examples/hw.b | ./compiler > x86_64/test.s
	make -C x86_64
clean:
	rm -fr $(FILE)
run: 
	./x86_64/a.out
