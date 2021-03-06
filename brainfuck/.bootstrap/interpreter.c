/* interpreter.c -- bootstrap interpreter for brainfuck
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
#include<stdlib.h>
#include<unistd.h>

/*
 * "<", 0x3c, move left
 * ">", 0x3e, move right
 * ",", 0x2c, read from stdin
 * ".", 0x2e, write to tap(buffered stdout)
 * "[", 0x5b, loop until current position goes zero
 * "]", 0x5d, end loop
 * "+", 0x2b, add current position by 1
 * "-", 0x2d, substract current position by 1
 */

#define SS 1024
#define TS 32768
char tape[TS];
int head = 0;
void process(char ch);

void startwhile(char* stack, int index, char* jmp){
	char ch;
	int j = 0;
	int i;
	while(1){
		ch = stack[j];
		if(ch == '['){
			if(!tape[head]){
				j = jmp[j];
				if(j >= index-1) return;
			}
		}
		else if(ch == ']'){
			j = jmp[j];
		}
		else{
			process(ch);
		}
		j++;
	}
}

void Esys(void){
	printf("syntax error!");
	exit(0);
}

FILE* fp;

void process(char ch){
	char stack[SS];
	int index = 0;
	int diff = 0;
	char starts[SS];
	char jmps[SS];
	int top = 0;
	char temp;
	switch(ch){
		case '<':
			head = (head+TS-1)%TS;
			break;
		case '>':
			head = (head+1)%TS;
			break;
		case ',':
			tape[head] = getchar();
			break;
		case '.':
			printf("%c", tape[head]);
			break;
		case '[':
			index = 0;
			top = 0;
			starts[top++] = index;
			stack[index++] = '[';
			diff = 1;
			while(fscanf(fp, "%c", &temp) == 1){
				stack[index++] = temp;
				if(temp == '['){
					starts[top++] = index-1;
					diff++;
				}
				else if(temp == ']'){
					jmps[starts[top-1]] = index-1;
					jmps[index-1] = starts[top-1]-1;
					top--;
					diff--;
				}
				if(!diff) break;
			}
			if(temp != ']'){
				Esys();
			}
			startwhile(stack, index, jmps);
			break;
		case ']':
			Esys();
			break;
		case '+':
			tape[head]++;
			break;
		case '-':
			tape[head]--;
			break;
		default:
			break;
	}
}

int main(int argc, char* argv[]){
	char ch;
	if(argc != 2){
		printf("usage: %s <source>\n", argv[0]);
		return 0;
	}
	fp = fopen(argv[1], "r");
	while(fscanf(fp, "%c", &ch) == 1){
		process(ch);
	}
	fflush(0);
	fclose(fp);
	return 0;
}
