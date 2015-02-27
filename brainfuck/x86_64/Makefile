all: a.out
a.out: test.o
	ld -dynamic-linker /lib/ld-linux-x86-64.so.2 -L/usr/lib/gcc/x86_64-unknown-linux-gnu/4.9.2/ -L/lib/ test.o -lc
test.o: test.s
	as test.s -o test.o
