#include <stdio.h>
int main(){
	int x = 0;
	int y = 1;
	printf("Initial Y = %d\n",y);
	__asm__ __volatile__(
		"movl %1, %0"
		:"=m" (y) 
		:"r" (x)
		:"%eax"
		);
	printf("Changed Y = %d\n",y);
	return 0;
}
