FILE := interpreter compiler preprocessor

all: ${FILE}
../src/entry/en.o: ../src/entry
	make -C ../src/entry
preprocessor: ../src/preprocessor.b ../src/entry/en.o
	bfc $< -o $@
interpreter: ../src/interpreter.b ../src/entry/en.o
	bfc $< -o $@
compiler: ../src/compiler.b ../src/entry/en.o
	bfc $< -o $@
#	mv a.out compiler

clean:
	rm -fr $(FILE) ../src/entry/en.o
