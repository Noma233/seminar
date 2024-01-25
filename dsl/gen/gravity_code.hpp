#include<math.h>
;
int kernel(int n, double xi[][3], double xj[][3], double mass[], double ai[][3], double eps2, double g){
   int i;
   int j;
   double x0_v0;
   double x0_v1;
   double x0_v2;
   for (i = 0; i < n; i += 1) {
      ;
      ;
      for (j = 0; j < n; j += 1) {
         ;
         x0_v0 = -xi[i][0] + xj[j][0];
         x0_v1 = -xi[i][1] + xj[j][1];
         x0_v2 = -xi[i][2] + xj[j][2];
         ai[i][0] += (x0_v0*(g*mass[j]))/pow(eps2 + (x0_v2*x0_v2 + (x0_v0*x0_v0 + x0_v1*x0_v1)), 3.0/2.0);
         ai[i][1] += (x0_v1*(g*mass[j]))/pow(eps2 + (x0_v2*x0_v2 + (x0_v0*x0_v0 + x0_v1*x0_v1)), 3.0/2.0);
         ai[i][2] += (x0_v2*(g*mass[j]))/pow(eps2 + (x0_v2*x0_v2 + (x0_v0*x0_v0 + x0_v1*x0_v1)), 3.0/2.0);
      };
      ;
   };
   return 0;
};