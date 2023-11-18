#include<stdio.h>
#include <x86intrin.h>
#include<algorithm>
#include<math.h>
#include <immintrin.h>
#include <random>
#include<time.h>
#include<iostream>
#include<set>
using namespace std;

template<class T>
struct vec3 {
    T v0;
    T v1;
    T v2;
};

void evaluate_gravity(
int ni,
int nj,
double posi[][3],
double posj[][3]) {

    for(int i = 0;i < ni;i++) {
        vec3<double> xi;
        
        xi.v0 = posi[i][0];
        xi.v1 = posi[i][1];
        xi.v2 = posi[i][2];

        for(int j = 0;j < nj;j++){
                if(i == j) continue;

        }
    }


}
int main() {

}

