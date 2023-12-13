#include<math.h>
#include<stdio.h>
int kernel(double xi[], double xj[], double eps, int n){
   int i;
   int j;
   for (i = 0; i < n; i += 1) {
      for (j = 0; j < n; j += 1) {
        double check_sub = eps + pow(xi[i], xj[i]);
      };
   };
   return 0;
}