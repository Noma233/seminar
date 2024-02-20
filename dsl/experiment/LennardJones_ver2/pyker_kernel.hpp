#include<math.h>
;
int kernel(int n, double rix[], double riy[], double riz[], double rjx[], double rjy[], double rjz[], double eps2[], double fx[], double fy[], double fz[], double p[]){
   int i;
   int j;
   double dx;
   double dy;
   double dz;
   double r2;
   double r2_inv;
   double r2_inv3;
   double r2_inv6;
   double f;
   for (i = 0; i < n; i += 1) {
      ;
      ;
      for (j = 0; j < n; j += 1) {
         ;
         dx = rix[i] - rjx[j];
         dy = riy[i] - rjy[j];
         dz = riz[i] - rjz[j];
         r2 = dz*dz + (dy*dy + (dx*dx + eps2[j]));
         r2_inv = 1.0/sqrt(r2);
         r2_inv3 = r2_inv*(r2_inv*r2_inv);
         r2_inv6 = r2_inv3*r2_inv3;
         f = (r2_inv3*(r2_inv*r2_inv))*(48.0*r2_inv6 - 24.0);
         fx[i] += dx*f;
         fy[i] += dy*f;
         fz[i] += dz*f;
         p[i] += (4.0*r2_inv6)*(r2_inv6 - 1.0);
      };
      ;
   };
   return 0;
};