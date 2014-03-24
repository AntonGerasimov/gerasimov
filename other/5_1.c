#include <stdio.h>
int a[5];
int main(){
	int min, i;
	for (i=0;i<=4;i++){
		scanf("%d",&a[i]);}

	min = a[0];
	for (i=1;i<=4;i++){
		if (a[i]<min)
			min = a[i];}
	printf("%d", min);
	return 0;}
