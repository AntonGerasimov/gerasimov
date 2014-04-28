#include <stdio.h>
#include "./../drawme.h"
#include <math.h>
double f(double x){
	if (x>=-0.5 && x<=0.5)
		return 1;
	return 0;
	}

void func(double *x, double *u, double *v, double *z, int n){
	float a, b, c, d;
	double last_u = u[0];
	double last_v = v[0];
	int i;
	int cx = 1;
	float k = 0.5;
	float h = 2.0 / (n-1);//т.к. (-1;1)
	float t = k * h / cx;        
	for (i=0;i<n;i++){
		d = u[i];
		c = v[i];
		b = (last_u - d + c*h)/(h*h) + a*h;
		a = (((last_v - c)/h) + 2 * (last_u - d + c*h)/(h*h))/h;
		
                last_u = u[i];
		last_v = v[i];
		u[i] = a * pow((-cx * t), 3) + b * pow((-cx *t), 2) + c *(-cx*t) + d;
		v[i] = 3 * a * pow((-cx*t),2) + 2 * b * (-cx * t) + c;}
	d = u[0];
	c = v[0];
	a = (u[i] - last_u - 0.5 * (x[i]+x[i-1]) * (v[i] - last_v) - c * (x[i] - x[i-1])) / (pow(x[i], 3) - pow(x[i-1], 3) - 3 * pow(x[i],2) + 3 * pow(x[i-1],2));
        b = (v[i] - last_v - 3 * a * (pow(x[i], 2) - pow(x[i-1], 2)) - c) / (2 * (x[i] - x[i-1]));

	
//        a = (u[0] - last_u) / h;
  //      u[0] = a * (h - cx * t) + last_u;


//        for (i=0; i<n; i++){
//              printf("%f ",z[i]);}
//        printf("\n");
      DM_plot_1d_etalon(x, u, z, n, "Test 1", 1);
	
	}


int main(){
	int n;
	scanf("%d", &n);
	int cx = 1;
	float k = 0.5;
        float h = 2.0 / (n-1);//т.к. (-1;1)
        float t = k * h / cx;

	float m = n / (k * cx); //1 полный оборот
	int i;
	double x[16000]; //координаты
	double u[16000];
	double v[16000]; //производная
       	double z[16000];

	for (i=0; i<n; i++){
		x[i] = -1 + (i * h);
		u[i] = 1;
		v[i] = 0;
		z[i] = u[i];
	}
	u[n] = u[0];
	v[n] = v[0];
//	for (i=0;i<n;i++){
//		printf("%f ", y[i]);}
//	printf("\n");

//	for (i=1; i<=m; i++){
	func(x, u, v, z, n);
//	}
        DM_plot_1d_etalon(x, u, z, n, "Test 1", 0);
        DM_plot_1d_etalon(x, u, z, n, "Test 1", 1);

	return 0;}
