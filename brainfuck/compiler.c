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

#define SS 1024
#define TS 0x8000

int main(){
	
	char ch;
	int i;
	char stack[SS];
	for(i = 0; i< SS; i++) stack[i]=0;
	int top = 0;
	i = 0;

	printf(".section    .text\n_start:\n");

	printf("mov %rsp, %rbx\n");
	//printf("sub $0x4, %rbx\n"); // the tail of stack is not stable, why?
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
	while(scanf("%c", &ch) == 1){
		switch(ch){
			case '<'://3 bytes
				printf("inc %rbx\n");
				break;
			case '>':
				printf("dec %rbx\n");
				break;
			case ','://19 bytes
				printf("mov %rbx, %rsi\nmov $0x0, %rdi\nmov $0x0, %rax\nsyscall\n");
				break;
			case '.':
				printf("mov %rbx, %rsi\nmov $0x1, %rdi\nmov $0x1, %rax\nsyscall\n");
				break;
			case '[':
				stack[top] = i;
				printf("START_%d:\n", i);
				printf("testb $0xff, 0x0(%rbx)\n");
				printf("jz END_%d\n", i);
				top++; i++;
				break;
			case ']':
				top--;
				printf("jmp START_%d\n", stack[top]);
				printf("END_%d:\n", stack[top]);
				break;
			case '+'://2 bytes
				printf("incb 0x0(%rbx)\n");
				break;
			case '-':
				printf("decb 0x0(%rbx)\n");
				break;
			default:
				break;
		}
	}
	//the exit code is not correct, FIXME
        printf("mov $0x3c, %rax\nsyscall\n.global        _start\n.end\n");
	
	return 0;
}
