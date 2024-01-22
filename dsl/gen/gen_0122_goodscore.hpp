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
      double ax = 0.0;
      double ay = 0.0;
      double az = 0.0;

      for (j = 0; j < n; j += 1) {
         ;
          
         x0_v0 = xj[j][0] - xi[i][0];
         x0_v1 = xj[j][1] - xi[i][1];
         x0_v2 = xj[j][2] - xi[i][2];
         double r = 1.0f / sqrt(eps2 + (x0_v2*x0_v2 + (x0_v0*x0_v0 + x0_v1*x0_v1)));
         double r2 = g*mass[j] * r * r * r;

         ax += x0_v0*r2;
         ay += x0_v1*r2;
         az += x0_v2*r2;
      };
      ai[i][0] = ax;
      ai[i][1] = ay;
      ai[i][2] = az;
      ;
   };
   return 0;
};