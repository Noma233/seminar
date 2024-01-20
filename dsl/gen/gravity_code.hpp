#include<math.h>
;
int kernel(int n, double xi[][3], double xj[][3], double eps2, double g, double x0[3]){
   int i;
   int j;
   double rij_v0;
   double rij_v1;
   double rij_v2;
   for (i = 0; i < n; i += 1) {
      ;
      for (j = 0; j < n; j += 1) {
         ;
         x0_v0 = xi[i][0] - xj[j][0];
         x0_v1 = xi[i][1] - xj[j][1];
         x0_v2 = xi[i][2] - xj[j][2];
         rij_v0 = (g*x0_v0)/pow(eps2 + (x0_v2*x0_v2 + (x0_v0*x0_v0 + x0_v1*x0_v1)), 3.0/2.0);
         rij_v1 = (g*x0_v1)/pow(eps2 + (x0_v2*x0_v2 + (x0_v0*x0_v0 + x0_v1*x0_v1)), 3.0/2.0);
         rij_v2 = (g*x0_v2)/pow(eps2 + (x0_v2*x0_v2 + (x0_v0*x0_v0 + x0_v1*x0_v1)), 3.0/2.0);
      };
      ;
   };
   return 0;
};