/* compiler.c -- bootstrap compiler for brainfuck
   Copyright 2015 Quey-Liang Kao.

   This program is free software; you can redistribute it and/or modify it
   under the terms of the GNU General Public License as published by the
   Free Software Foundation; either version 2, or (at your option) any
   later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, 51 Franklin Street - Fifth Floor, Boston, MA 02110-1301, USA.*/

#include<stdio.h>
#include<string.h>

#define SS 1024
#define TS 0x8000

int main(int argc, char* argv[]){
	char ch;
	int i;
	char stack[SS];
	for(i = 0; i< SS; i++) stack[i]=0;
	int top = 0;
	i = 0;

	if(argc < 2){
		printf("usage: %s <source>\n", argv[0]);
		return 0;
	}
	FILE* fp = fopen(argv[1], "r");

	printf(".section    .text\n_bicib:\n");
	printf("mov %rsp, %rbx\n");
	printf("mov $%d, %rax\n", TS);
	printf("ZERO:\n");
	printf("test $0xFFFF, %rax\n");
	printf("jz EZERO\n");
	printf("movq $0x0, 0x0(%rbx)\n");
	printf("sub $0x8, %rax\n");
	printf("sub $0x8, %rbx\n");
	printf("jmp ZERO\n");
	printf("EZERO:\n");
	printf("add $%d, %rbx\n", TS);
	printf("mov $0x1, %rdx\n");
	while(fscanf(fp, "%c", &ch) == 1){
		switch(ch){
			case '<'://3 bytes 48 ff c3
				printf("inc %rbx\n");
				break;
			case '>'://        48 ff cb
				printf("dec %rbx\n");
				break;
			case ','://19 bytes 48 89 de 48 c7 c7 00 00 00 00 48 c7 c0 00 00 00 00 0f 05
				printf("mov %rbx, %rsi\nmov $0x0, %rdi\nmov $0x0, %rax\nsyscall\n");
				break;
			case '.': //        48 89 de 48 c7 c7 01 00 00 00 48 c7 c0 01 00 00 00 0f 05
				printf("mov %rbx, %rsi\nmov $0x1, %rdi\nmov $0x1, %rax\nsyscall\n");
				break;
			case '[':
				stack[top] = i;
				printf("START_%d:\n", i);
				printf("testb $0xff, 0x0(%rbx)\n");
				printf("jz END_%d\n", i);
				top++; i++;
				break;
			case ']'://2 bytes    eb f6
				top--;
				printf("jmp START_%d\n", stack[top]);
				printf("END_%d:\n", stack[top]);
				break;
			case '+'://2 bytes    fe 03
				printf("incb 0x0(%rbx)\n");
				break;
			case '-'://           fe 0b
				printf("decb 0x0(%rbx)\n");
				break;
			default:
				break;
		}
	}
	//printf("mov $0x0, %rdi\nmov $0x3c, %rax\nsyscall\n");
	printf("retq\n");
	printf(".global        _bicib\n.end\n");
	fclose(fp);
	//system("as temp.s -o temp.o");
	//system("rm temp.s");
	//char command[200];
	//sprintf(command, "ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -L/usr/lib/gcc/x86_64-unknown-linux-gnu/4.9.2/ -L/lib/ temp.o -lc -o %s", output);
	//system(command);
	//system("rm temp.o");

	return 0;
}