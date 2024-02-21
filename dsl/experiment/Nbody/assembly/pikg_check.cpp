#include<stdio.h>
#include<pikg_vector.h>
#include<pikg_vector.hpp>
#include<cstdlib> // 乱数生成のために必要
#include<ctime> // 乱数のシード設定のために必要
// #include<algorithm>
#include<cmath>
#include<time.h>
#include<iostream>

struct EPI {
   pikg_f64vec3 r;
};

struct EPJ{
   pikg_f64vec3 r;
   double m;
   double eps;
};

struct FORCE {
   pikg_f64vec3 acc;
};

#include "pikg_kernel_AVX2.hpp"
// #include "pyker_kernel_AVX2.hpp"

int main() {
   srand((unsigned)time(NULL)); // 乱数のシードを設定

   int n = 0;
   std::cin >>  n;
   //PIKG用のコード
   const int nepi = n; 
   const int nepj = n; 
   EPI *epi = new EPI[nepi];
   EPJ *epj = new EPJ[nepj];
   FORCE *force = new FORCE[n];
   Kernel pikg_kernel;
   pikg_kernel(epi, nepi, epj, nepj, force);
}