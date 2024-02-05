#include<math.h>
;
int kernel(int n, double xi[][3], double xj[][3], double mass[], double ai[][3], double eps2, double g){
   int i;
   int j;
   double dr_v0;
   double dr_v1;
   double dr_v2;
   for (i = 0; i < n; i += 1) {
      ;
      ;
      for (j = 0; j < n; j += 1) {
         ;
         dr_v0 = -xi[i][0] + xj[j][0];
         dr_v1 = -xi[i][1] + xj[j][1];
         dr_v2 = -xi[i][2] + xj[j][2];
         ai[i][0] += (mass[j]*(dr_v0*g))/(((sqrt(eps2 + (dr_v2*dr_v2 + (dr_v0*dr_v0 + dr_v1*dr_v1)))*sqrt(eps2 + (dr_v2*dr_v2 + (dr_v0*dr_v0 + dr_v1*dr_v1))))*sqrt(eps2 + (dr_v2*dr_v2 + (dr_v0*dr_v0 + dr_v1*dr_v1)))));
         ai[i][1] += (mass[j]*(dr_v1*g))/(((sqrt(eps2 + (dr_v2*dr_v2 + (dr_v0*dr_v0 + dr_v1*dr_v1)))*sqrt(eps2 + (dr_v2*dr_v2 + (dr_v0*dr_v0 + dr_v1*dr_v1))))*sqrt(eps2 + (dr_v2*dr_v2 + (dr_v0*dr_v0 + dr_v1*dr_v1)))));
         ai[i][2] += (mass[j]*(dr_v2*g))/(((sqrt(eps2 + (dr_v2*dr_v2 + (dr_v0*dr_v0 + dr_v1*dr_v1)))*sqrt(eps2 + (dr_v2*dr_v2 + (dr_v0*dr_v0 + dr_v1*dr_v1))))*sqrt(eps2 + (dr_v2*dr_v2 + (dr_v0*dr_v0 + dr_v1*dr_v1)))));
      };
      ;
   };
   return 0;
};