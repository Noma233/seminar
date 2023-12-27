#include<math.h>
;
int kernel(int n, double xi[][3], double xj[][3], double mass[], double ai[][3], double g, double eps){
   int i;
   int j;
   double g;
   double eps;
   for (i = 0; i < n; i += 1) {
      ;
      for (j = 0; j < n; j += 1) {
         ;
         ai[i][0] = g*mass[j]*(-xi[i][0] + xj[j][0])/pow(pow(eps, 2) + (-xi[i][0] + xj[j][0]), 3);
         ai[i][1] = g*mass[j]*(-xi[i][1] + xj[j][1])/pow(pow(eps, 2) + (-xi[i][1] + xj[j][1]), 3);
         ai[i][2] = g*mass[j]*(-xi[i][2] + xj[j][2])/pow(pow(eps, 2) + (-xi[i][2] + xj[j][2]), 3);
      };
      ;
   };
   return 0;
};
