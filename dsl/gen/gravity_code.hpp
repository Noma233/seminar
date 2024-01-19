#include<math.h>
;
int kernel(int n, double xi[][3], double xj[][3], double eps2, double g){
   int i;
   int j;
   double eps2;
   double g;
   double x0_v0;
   double x0_v1;
   double x0_v2;
   double rij;
   for (i = 0; i < n; i += 1) {
      ;
      for (j = 0; j < n; j += 1) {
         ;
         x0_v0 = xi[i][0] - xj[j][0];
         x0_v1 = xi[i][1] - xj[j][1];
         x0_v2 = xi[i][2] - xj[j][2];
         rij = (g*x0_v0)/pow(eps2 + pow(x0_v0, 2), 3.0/2.0);
      };
      ;
   };
   return 0;
};