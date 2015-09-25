FILE := interpreter compiler

all: ${FILE}
interpreter: interpreter.c
	gcc $< -o $@

compiler: compiler.c
	gcc $< -o $@

clean:
	rm -fr $(FILE)
