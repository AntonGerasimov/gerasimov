#include <stdio.h>
	int a[2];
	float b[2];
	int sum1(int *a);
	float	sum2(float *b);
int main(){
	int i;
	for (i=0;i<=2;i++){
		scanf("%d", &a[i]);}
	int sum_d = sum1(a);	//сумма массива целых чисел
	for (i=0;i<=2;i++){
		scanf("%f", &b[i]);}
	printf("%d\n",	sum_d);
	printf("%f\n",	sum2(b));	
	return 0;}
