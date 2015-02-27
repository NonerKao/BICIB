#include<stdio.h>

#define SS 1024

int main(){
	
	char ch;
	int i;
	char stack[SS];
	for(i = 0; i< SS; i++) stack[i]=0;
	int top = 0;
	i = 0;
	printf("mov %rsp, %rbx\n");
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
				printf("TAG_%d:\n", i);
				top++; i++;
				break;
			case ']':
				printf("cmp $0x0, 0x0(%rbx)\n");
				printf("jnz TAG_%d\n", stack[--top]);
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
	return 0;
}
