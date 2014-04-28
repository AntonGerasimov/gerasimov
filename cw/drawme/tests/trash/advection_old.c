#include <stdio.h>
#include "./../drawme.h"
double f(double x){
	if (x>=-0.5 && x<=0.5)
		return 1;
	return 0;
	}

void func(){
	float a, b;
        for (i=0;i<n;i++){
                a = (y[i] - y[i-1]) / h;
                b = y[i] - a * x[i];
                z[i] = a * (x[i] - cx * t) + b;}
        a = (y[0] - y[n-1]) / h;
        b = y[0] - a * x[0];
        z[0] = a * (h - cx * t) + b;


        for (i=0; i<n; i++){
                printf("%f ",z[i]);}
        printf("\n");
        DM_plot_1d_etalon(x, y, n, "Test 1", 0);
        DM_plot_1d_etalon(x, y, n, "Test 1", 1);

	}

int main(){
	int n;
	float k = 0.6;
	int cx = 1;
	scanf("%d", &n);
	float h = 2.0 / (n-1);//т.к. (-1;1)
//	scanf("%f", &k);
	float t = k * h / cx;
	float m = 2.0 / (t * cx); //1 полный оборот
	int i;
	double x[16000]; //координаты
	double y[16000];
	double z[16000];                       

	for (i=0; i<n; i++){
		x[i] = -1 + (i * h);
		y[i] = f(x[i]);
	}
//	y[n] = y[0];
	for (i=0;i<n;i++){
		printf("%f ", y[i]);}
	printf("\n");

/*	float a, b;
	for (i=0;i<n;i++){
		a = (y[i] - y[i-1]) / h;
		b = y[i] - a * x[i];
		z[i] = a * (x[i] - cx * t) + b;}
	a = (y[0] - y[n-1]) / h;
	b = y[0] - a * x[0];
	z[0] = a * (h - cx * t) + b;


	for (i=0; i<n; i++){
		printf("%f ",z[i]);}
	printf("\n");
	DM_plot_1d_etalon(x, y, n, "Test 1", 0);
	DM_plot_1d_etalon(x, y, n, "Test 1", 1);*/
	return 0;}
