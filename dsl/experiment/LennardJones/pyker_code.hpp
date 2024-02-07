#include<math.h>
;
int kernel(int n, double ri[][3], double rj[][3], double fr[][3], double p[], double eps){
   int i;
   int j;
   double dr_v0;
   double dr_v1;
   double dr_v2;
   double r2;
   double r2i;
   double f;
   double x0;
   for (i = 0; i < n; i += 1) {
      ;
      ;
      for (j = 0; j < n; j += 1) {
         ;
         dr_v0 = ri[i][0] - rj[j][0];
         dr_v1 = ri[i][1] - rj[j][1];
         dr_v2 = ri[i][2] - rj[j][2];
         r2 = eps + (dr_v2*dr_v2 + (dr_v0*dr_v0 + dr_v1*dr_v1));
         r2i = 1.0/r2;
         x0 = r2i*(r2i*r2i);
         f = (r2i*(r2i*(r2i*r2i)))*(48.0*x0 - 24.0);
         fr[i][0] += dr_v0*f;
         fr[i][1] += dr_v1*f;
         fr[i][2] += dr_v2*f;
         p[i] += (4.0*x0)*(x0 - 1.0);
      };
      ;
   };
   return 0;
};