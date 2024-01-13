#include<math.h>
;
int kernel(int n, double xi[][3], double xj[][3]){
   int i;
   int j;
   double rij_tmp;
   for (i = 0; i < n; i += 1) {
      ;
      for (j = 0; j < n; j += 1) {
         ;
         rij_tmp = xi_tmp[i][2]*xj_tmp[j][2] + (xi_tmp[i][0]*xj_tmp[j][0] + xi_tmp[i][1]*xj_tmp[j][1]);
      };
      ;
   };
   return 0;
};