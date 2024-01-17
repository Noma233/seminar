#include<math.h>
;
int kernel(int n, double xi[][3], double xj[][3], double eps2, double g){
   int i;
   int j;
   double eps2;
   double rij;
   for (i = 0; i < n; i += 1) {
      ;
      for (j = 0; j < n; j += 1) {
         ;
         rij = g/pow(eps2 + ((xi[i][2] - xj[j][2])*(xi[i][2] - xj[j][2]) + ((xi[i][0] - xj[j][0])*(xi[i][0] - xj[j][0]) + (xi[i][1] - xj[j][1])*(xi[i][1] - xj[j][1]))), 3.0/2.0);
      };
      ;
   };
   return 0;
};