#include<stdio.h>
#include<string.h>

char* process(const char* str, int* len){
	int i = 0;
	char* prog = malloc(16384);
	FILE *f = fopen(str, "rb");
	while(fscanf(f, "%c", &prog[i++]) != EOF);
	*len = i;
	fclose(f);
	return prog;
}

struct info{
	int val;
	int type;
};

int main(){
	int l1, l2;
	char* p1 = process("b1", &l1);
	char* p2 = process("b2", &l2);

	struct info* matrix = malloc(sizeof(struct info)*l1*l2);
	int i, j;
	for(i = 0; i< l1; i++){
		for(j = 0; j< l2; j++){
			int t[3];
			t[0] = (i > 0) ? matrix[i*l2+j-l2].val : 0;
			t[1] = (i > 0 && j > 0) ? (p1[i] == p2[j]) + matrix[i*l2+j-l2-1].val : 0;
			t[2] = (j > 0) ? matrix[i*l2+j-1].val : 0;
			if(t[1] >= t[2] && t[1] >= t[0]){
				matrix[i*l2+j].val = t[1];
				matrix[i*l2+j].type = 1;
			}
			else if(t[2] >= t[1] && t[2] >= t[0]){
				matrix[i*l2+j].val = t[2];
				matrix[i*l2+j].type = 2;
			}
			else if(t[0] >= t[1] && t[0] >= t[2]){
				matrix[i*l2+j].val = t[0];
				matrix[i*l2+j].type = 0;
			}
		}
	}

	i = l1 - 1;
	j = l2 - 1;
	while(i >= 0 && j >= 0){
		switch(matrix[i*l2+j].type){
			case 0:
				i--;
				//printf("(%c %c)%4x %4x", p1[i], p2[j], i, j);
				printf("|");
				break;
			case 1: 
				printf(".");
				i--; j--;
				break;
			case 2:
				//printf("(%c %c)%4x %4x", p1[i], p2[j], i, j);
				j--;
				printf("-");
				break;
		}
	}
	free(p1);
	free(p2);
	return 0;
}