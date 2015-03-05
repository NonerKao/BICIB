FILE := interpreter compiler

all: ${FILE}
../entry/en.o: ../entry/en.c
	gcc -c $< -o $@
interpreter: ../src/interpreter.b ../entry/en.o
	bfc $< -o $@

compiler: ../src/compiler.b ../entry/en.o
	bfc $< -o $@

clean:
	rm -fr $(FILE) ../entry/en.o
