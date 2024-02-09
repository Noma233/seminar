#include<math.h>
;
int kernel(int n, double rix[], double riy[], double riz[], double rjx[], double rjy[], double rjz[], double eps[], double fx[], double fy[], double fz[], double p[]){
   int i;
   int j;
   double dx;
   double dy;
   double dz;
   double r2;
   double r2i;
   double r6i;
   double f;
   for (i = 0; i < n; i += 1) {
      ;
      ;
      for (j = 0; j < n; j += 1) {
         ;
         dx = rix[i] - rjx[j];
         dy = riy[i] - rjy[j];
         dz = riz[i] - rjz[j];
         r2 = dz*dz + (dy*dy + (dx*dx + eps[j]));
         r2i = 1.0/r2;
         r6i = r2i*(r2i*r2i);
         f = (r2i*r6i)*(48.0*r6i - 24.0);
         fx[i] += dx*f;
         fy[i] += dy*f;
         fz[i] += dz*f;
         p[i] += (4.0*r6i)*(r6i - 1.0);
      };
      ;
   };
   return 0;
};