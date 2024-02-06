#include<stdio.h>
#include<pikg_vector.h>
#include<pikg_vector.hpp>
#include<cstdlib> // 乱数生成のために必要
#include<ctime> // 乱数のシード設定のために必要

struct EPI {
   pikg_f64vec3 r;
   pikg_f64vec3 v;
};

struct EPJ{
   pikg_f64vec3 r;
   pikg_f64vec3 v;
   double m;
   double eps;
};

struct FORCE {
   pikg_f64vec3 f;
   pikg_f64vec3 j;
};

#include "sample1_kernel.hpp"
#include "harp_pyker_code.hpp"

// 乱数を生成するための関数
double rand_double(double min, double max) {
   return min + (double)rand() / ((double)RAND_MAX / (max - min));
}

// double calculate_difference(double a[][3], double b[][3], int n) {
//     double diff = 0;
//     for (int i = 0; i < n; i++) {
//         for (int j = 0; j < 3; j++) {
//             diff += fabs(a[i][j] - b[i][j]);
//         }
//     }
//     return diff / (n * 3); // 全要素の差異の平均を返す
// }
double calculate_difference(double a, double b) {
   double diff = 0.0;
   diff += fabs(a - b);   
   return diff;
}

int main() {
   srand((unsigned)time(NULL)); // 乱数のシードを設定

   int n = 100;

   //PIKG用のコード
   const int nepi = n; 
   const int nepj = n; 
   EPI *epi = new EPI[nepi];
   EPJ *epj = new EPJ[nepj];
   FORCE *force = new FORCE[n];
   Kernel pikg_kernel;

   //pyker用のコード
   double ri[n][3], vi[n][3], rj[n][3], vj[n][3], mj[n], eps2[n], F[n][3], J[n][3];


   // epiとepjの変数を乱数で初期化
   for(int i = 0; i < nepi; ++i) {
      epi[i].r = {rand_double(-1.0, 1.0), rand_double(-1.0, 1.0), rand_double(-1.0, 1.0)};
      epi[i].v = {rand_double(-1.0, 1.0), rand_double(-1.0, 1.0), rand_double(-1.0, 1.0)};
      epj[i].r = {rand_double(-1.0, 1.0), rand_double(-1.0, 1.0), rand_double(-1.0, 1.0)};
      epj[i].v = {rand_double(-1.0, 1.0), rand_double(-1.0, 1.0), rand_double(-1.0, 1.0)};
      epj[i].m = rand_double(0.5, 2.0);
      epj[i].eps = rand_double(0.01, 0.1);
      ri[i][0] = epi[i].r.x;
      ri[i][1] = epi[i].r.y;
      ri[i][2] = epi[i].r.z;
      vi[i][0] = epi[i].v.x;
      vi[i][1] = epi[i].v.y;
      vi[i][2] = epi[i].v.z;

      rj[i][0] = epj[i].r.x;
      rj[i][1] = epj[i].r.y;
      rj[i][2] = epj[i].r.z;
      vj[i][0] = epj[i].v.x;
      vj[i][1] = epj[i].v.y;
      vj[i][2] = epj[i].v.z;

      mj[i] = epj[i].m;
      eps2[i] = epj[i].eps;


   }

   //PIKG
   pikg_kernel(epi, nepi, epj, nepj, force); // ここで計算

   kernel(n, ri, vi, rj, vj, mj, eps2, F, J);


   double total_diff_F = 0.0;
    double total_diff_J = 0.0;
    for (int i = 0; i < n; i++) {
        total_diff_F += calculate_difference(force[i].f.x, F[i][0]) / force[i].f.x;
        total_diff_F += calculate_difference(force[i].f.y, F[i][1]) / force[i].f.y;
        total_diff_F += calculate_difference(force[i].f.z, F[i][2]) / force[i].f.z;
        total_diff_J += calculate_difference(force[i].j.x, J[i][0]) / force[i].j.x;
        total_diff_J += calculate_difference(force[i].j.y, J[i][1]) / force[i].j.y;
        total_diff_J += calculate_difference(force[i].j.z, J[i][2]) / force[i].j.z;
    }

   printf("Total difference in F: %f\n", total_diff_F / n);
   printf("Total difference in J: %f\n", total_diff_J / n);
}
