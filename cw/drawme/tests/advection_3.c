#include <stdio.h>
#include "./../drawme.h"

double f(double x){
	if (x >= -0.5 && x <= 0.5) 
		return 1;
	return 0;
	}

void func(double *u, double *v, int n)
	{
	double last_u[16000];
	int i;
	for (i=1; i<n;i++){
		last_u[i] = u[i];}
	double last_v[16000];
	for (i=1; i<n;i++){
		last_v[i] = v[i];}
        int j;
	int cx = 1;
        float k = 0.5;
        float h = 2.0 / (n-1);//т.к. (-1;1)
        float t = k * h / cx;
	double q;
        float m = n / (k * cx); //1 полный оборот
	double a, b, c, d;
        for (j=0; j<m; j++)
		{
        	for (i = 1; i < n; i++) 
			{
        		d = u[i];
       	 		c = v[i];
        		a = (((last_v[i-1] - c)/h) + 2 * (last_u[i-1] - d + c * h)/(h*h))/h;
        		b = (last_u[i-1] - d + c * h)/(h*h) + a*h;
			q = -cx * t;
      	  		u[i] = a * q * q * q + b * q * q  + c * q + d;
        		v[i] = 3 * a * q * q + 2 * b * q + c;
        		}
		d = u[0];
        	c = v[0];
        	a = (((last_v[n - 1] - c)/h) + 2 * (last_u[n-1] - d + c * h)/(h*h))/h;
        	b = (last_u[n-1] - d + c * h)/(h*h) + a*h;
		q = -cx * t;
        	u[0] = a * q * q * q + b * q * q + c * q + d;
        	v[0] = 3 * a * q * q + 2 * b * q + c;
        	for (i = 0; i < n; i++)
			{
                	last_u[i] = u[i];
        		last_v[i] = v[i];
        		}
		}
	}

int main(){

        int n;
        scanf("%d", &n);
        int cx = 1;
        float k = 0.5;
        float h = 2.0 / (n-1);//т.к. (-1;1)
        float t = k * h / cx;

        int i;
       	double x[16000]; //координаты
        double u[16000];
        double v[16000]; //производная
        double z[16000];

	for (i = 0; i < n; i++) 
		{
  		x[i] = (i * h) - 1;
		u[i] = f (x[i]);
		z[i] = u[i];
		v[i] = 0;
   		}

	func(u, v, n);     

        DM_plot_1d_etalon(x, u, z, n, "Test 1", 0);
        DM_plot_1d_etalon(x, u, z, n, "Test 1", 1);

        float e; //ошибка
        e = 0;
        for (i=0; i<n;i++){
                if (u[i]-z[i] > e)
                        e = u[i] - z[i];
                if (z[i] - u[i] > e)
                        e = u[i] - z[i];}
        printf("%lf\n", e);
	

	return 0;}
