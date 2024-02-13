#include<math.h>
;
int kernel(int n, double ri[][3], double vi[][3], double rj[][3], double vj[][3], double mj[], double eps2[], double F[][3], double J[][3]){
   int i;
   int j;
   double dr_v0;
   double dr_v1;
   double dr_v2;
   double dv_v0;
   double dv_v1;
   double dv_v2;
   double r2;
   double r1i;
   double r2i;
   double r3i;
   double r5i;
   double rv;
   double af;
   double jf;
   for (i = 0; i < n; i += 1) {
      ;
      ;
      for (j = 0; j < n; j += 1) {
         ;
         dr_v0 = ri[i][0] - rj[j][0];
         dr_v1 = ri[i][1] - rj[j][1];
         dr_v2 = ri[i][2] - rj[j][2];
         dv_v0 = vi[i][0] - vj[j][0];
         dv_v1 = vi[i][1] - vj[j][1];
         dv_v2 = vi[i][2] - vj[j][2];
         r2 = eps2[j] + (dr_v2*dr_v2 + (dr_v0*dr_v0 + dr_v1*dr_v1));
         r1i = 1.0/sqrt(r2);
         r2i = r1i*r1i;
         r3i = r1i*r2i;
         r5i = r2i*r3i;
         rv = dr_v2*dv_v2 + (dr_v0*dv_v0 + dr_v1*dv_v1);
         af = mj[j]*r3i;
         jf = rv*((3.0*mj[j])*r5i);
         F[i][0] += af*dr_v0;
         F[i][1] += af*dr_v1;
         F[i][2] += af*dr_v2;
         J[i][0] += af*dv_v0 - dr_v0*jf;
         J[i][1] += af*dv_v1 - dr_v1*jf;
         J[i][2] += af*dv_v2 - dr_v2*jf;
      };
      ;
   };
   return 0;
};