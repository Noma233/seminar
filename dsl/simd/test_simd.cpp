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

double eps = 0.000001;

bool check_vec(vector<double> &aa, double a[]) {
        bool flag = true;
        int n = aa.size();

        for(int i = 0;i < n;i++) {
                if(aa[i] - a[i] > eps) {
                        flag = false;
                        break;
                }
        }
        return flag;
}

int main() {
        int n = 64, i;
        double *a, *b, *c;

        // 32バイト境界にアライメントされたメモリを確保
        a = (double*)_mm_malloc(n * sizeof(double), 32);
        b = (double*)_mm_malloc(n * sizeof(double), 32);
        c = (double*)_mm_malloc(n * sizeof(double), 32);

        std::mt19937 mt;
        std::uniform_real_distribution<double> ud(0.0, 1.0);

        vector<double> aa(n), bb(n);

        for(i = 0;i < n;i++) {
                // a[i] = i;
                double x = ud(mt);
                double y = ud(mt);

                a[i] = x;
                b[i] = y;

                aa[i] = x;
                bb[i] = y;

        }


        for(i = 0;i<n;i++) {
                for(int j = 0;j < n;j++) {
                        if(i == j) continue;
                        aa[i] += bb[j];
                }
        }



        for(i = 0;i < n;i+=4) {
                __m256d va = _mm256_load_pd(&a[i]);

                for(int j = 0;j < n;j++) {
                        __m256d vb = _mm256_set1_pd(b[j]);

                        if(i == j || i + 1 == j || i + 2 == j || i + 3 == j) {
                                vb[j - i] = 0.0;
                        }
                        va += vb;
                }

                _mm256_store_pd(&a[i], va);
        }


        // cout << nan("") + 3 << endl;

        for(i = 0;i < 5;i++) {
                cout << a[i] << " " ;
        }        
        
        cout << endl;

        for(i = 0;i < 5;i++) {
                cout << aa[i] << " " ;
        }
        cout << endl;

        if(check_vec(aa, a)){
                cout << "correct" << endl;
        }else {
                cout << "false" << endl;
        }


}