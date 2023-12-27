#include<math.h>
;
int kernel(int n, double xi[][3], double xj[][3], double mass[], double ai[][3], double g, double eps2){
   int i;
   int j;
   double g;
   double eps2;
   double x0_v0;
   double x0_v1;
   double x0_v2;
   for (i = 0; i < n; i += 1) {
      ;
      for (j = 0; j < n; j += 1) {
         ;
         x0_v0 = -xi[i][0] + xj[j][0];
         x0_v1 = -xi[i][1] + xj[j][1];
         x0_v2 = -xi[i][2] + xj[j][2];
         ai[i][0] = g*mass[j]*x0_v0/pow(eps2 + pow(x0_v0, 2), 3.0/2.0);
         ai[i][1] = g*mass[j]*x0_v1/pow(eps2 + pow(x0_v1, 2), 3.0/2.0);
         ai[i][2] = g*mass[j]*x0_v2/pow(eps2 + pow(x0_v2, 2), 3.0/2.0);
      };
      ;
   };
   return 0;
};