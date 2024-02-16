#include<math.h>
;
int kernel(int n, double ri[][3], double rj[][3], double mj[], double eps2[], double ai[][3]){
   int i;
   int j;
   double rij_v0;
   double rij_v1;
   double rij_v2;
   double r2;
   double r_inv;
   double r2_inv;
   double mr_inv;
   double mr3_inv;
   for (i = 0; i < n; i += 1) {
      ;
      ;
      for (j = 0; j < n; j += 1) {
         ;
      
         rij_v0 = ri[i][0] - rj[j][0];
         rij_v1 = ri[i][1] - rj[j][1];
         rij_v2 = ri[i][2] - rj[j][2];
         r2 = eps2[j] + (rij_v2*rij_v2 + (rij_v0*rij_v0 + rij_v1*rij_v1));
         r_inv = 1.0/sqrt(r2);
         r2_inv = r_inv*r_inv;
         mr_inv = mj[j]*r_inv;
         mr3_inv = mr_inv*r2_inv;
         ai[i][0] += mr3_inv*rij_v0;
         ai[i][1] += mr3_inv*rij_v1;
         ai[i][2] += mr3_inv*rij_v2;
      };
      ;
   };
   return 0;
};