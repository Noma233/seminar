#include<math.h>
;
int kernel(int n, double ri[][3], double vi[][3], double rj[][3], double vj[][3], double mj[], double eps2[], double F[][3], double J[][3]){
   int i;
   int j;
   ;
   for (i = 0; i < n; i += 1) {
      ;
      ;
      for (j = 0; j < n; j += 1) {
         ;
         F[i][0] += af_v0*dr_v0;
         F[i][1] += af_v1*dr_v1;
         F[i][2] += af_v2*dr_v2;
         J[i][0] += af_v0*dv_v0 - dr_v0*jf_v0;
         J[i][1] += af_v1*dv_v1 - dr_v1*jf_v1;
         J[i][2] += af_v2*dv_v2 - dr_v2*jf_v2;
      };
      ;
   };
   return 0;
};