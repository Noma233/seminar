#include<math.h>
#include<x86intrin.h>;
#include<vector>
int main() {
   int n;
   double xi[n][3], yi[n][3];
   __m256d x_v0;
   __m256d x_v1;
   __m256d x_v2;
   __m256d y_v0;
   __m256d y_v1;
   __m256d y_v2;

   int a, b,c;
   int ans = a * b;

   std::vector<int> x(n), y(n);

   ans = x[0] * y[0] + x[1] * y[1] + x[2] * y[2];


   __m256d v0 = _mm256_mul_pd(x_v0, y_v0);
   __m256d v1 = _mm256_mul_pd(x_v1, y_v1);
   __m256d v2 = _mm256_mul_pd(x_v2, y_v2);
   __m256d ansv = _mm256_add_pd(v0, _mm256_add_pd(v1, v2));
   


}