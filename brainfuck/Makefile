FILE := interpreter compiler

all: ${FILE}
interpreter: interpreter.c ./entry/en.c
	make -C ./entry
	bfc interpreter.b -o interpreter

compiler: compiler.c ./entry/en.c
	make -C ./entry
	bfc compiler.b -o compiler

clean:
	rm -fr $(FILE)
