#include<math.h>
;
int kernel(int n, double xi[][3], double xj[][3], double mass[], double ai[][3], double eps2, double g){
   int i;
   int j;
   double dr_v0;
   double dr_v1;
   double dr_v2;
   double nor_inv_v0;
   double nor_inv_v1;
   double nor_inv_v2;
   for (i = 0; i < n; i += 1) {
      ;
      ;
      for (j = 0; j < n; j += 1) {
         ;
         dr_v0 = -xi[i][0] + xj[j][0];
         dr_v1 = -xi[i][1] + xj[j][1];
         dr_v2 = -xi[i][2] + xj[j][2];
         nor_inv_v0 = 1.0/(sqrt(eps2 + (dr_v2*dr_v2 + (dr_v0*dr_v0 + dr_v1*dr_v1))));
         nor_inv_v1 = 1.0/(sqrt(eps2 + (dr_v2*dr_v2 + (dr_v0*dr_v0 + dr_v1*dr_v1))));
         nor_inv_v2 = 1.0/(sqrt(eps2 + (dr_v2*dr_v2 + (dr_v0*dr_v0 + dr_v1*dr_v1))));
         ai[i][0] += (g*mass[j])*(dr_v2/nor_inv_v2 + (dr_v0/nor_inv_v0 + dr_v1/nor_inv_v1));
         ai[i][1] += (g*mass[j])*(dr_v2/nor_inv_v2 + (dr_v0/nor_inv_v0 + dr_v1/nor_inv_v1));
         ai[i][2] += (g*mass[j])*(dr_v2/nor_inv_v2 + (dr_v0/nor_inv_v0 + dr_v1/nor_inv_v1));
      };
      ;
   };
   return 0;
};

