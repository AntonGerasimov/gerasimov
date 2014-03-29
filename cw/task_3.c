#include <stdio.h>
int main(){
	int a,b;
	char c;
	scanf("%d %d %c",&a,&b,&c);
	switch(c){
		case '+': 
			printf("Res:= %d\n", my_sum(a, b));
			break;
		case '-':
			printf("Res:= %d\n", my_rasn(a, b));
			break;
		case '*':
			printf("Res:= %d\n", my_umn(a, b));
			break;
		case '\\':
                        printf("Res:= %d\n", my_del(a, b));
                        break; 
                case 'i':
                        printf("Res:= %d\n", my_i(a, b));
                        break;  
                case 'd':
                        printf("Res:= %d\n", my_d(a, b));
                        break;
 
	}
	return 0;}
