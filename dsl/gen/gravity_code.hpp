#include<math.h>
;
int kernel(int n, double xi[][3], double xj[][3], double mass[], double ai[][3], double g, double eps2){
   int i;
   int j;
   // double g;
   // double eps2;
   double x0_v0;
   double x0_v1;
   double x0_v2;
   for (i = 0; i < n; i += 1) {
      ;
      double xi0 = xi[i][0];
      double xi1 = xi[i][1];
      double xi2 = xi[i][2];
      for (j = 0; j < n; j += 1) {
         x0_v0 = -xi0 + xj[j][0];
         x0_v1 = -xi1 + xj[j][1];
         x0_v2 = -xi2 + xj[j][2];
         double s_tmp0 = sqrt(eps2 + x0_v0 * x0_v0);
         double s_tmp1 = sqrt(eps2 + x0_v1 * x0_v1);
         double s_tmp2 = sqrt(eps2 + x0_v2 * x0_v2);
         ai[i][0] = g*mass[j]*x0_v0/(s_tmp0 * s_tmp0 * s_tmp0);
         ai[i][1] = g*mass[j]*x0_v1/(s_tmp1 * s_tmp1 * s_tmp1);
         ai[i][2] = g*mass[j]*x0_v2/(s_tmp2 * s_tmp2 * s_tmp2);
      };
      ;
   };
   return 0;
};