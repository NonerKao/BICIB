FILE := interpreter compiler preprocessor

all: ${FILE}
../entry/en.o: ../entry
	make -C ../entry
preprocessor: ../src/preprocessor.b ../entry/en.o
	bfc $< -o $@
interpreter: ../src/interpreter.b ../entry/en.o
	bfc $< -o $@
compiler: ../src/compiler.b ../entry/en.o
	bfc $< -o $@

clean:
	rm -fr $(FILE) ../entry/en.o
