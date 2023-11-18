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


void evaluate_gravity(
    int ni,
    int nj,
    double posi[][3],
    double posj[][3],
    double mj[],
    double acci[][3]) {

    for (int i = 0; i < ni; i++) {
        double xi = posi[i][0];
        double yi = posi[i][1];
        double zi = posi[i][2];
        double ax = 0.0;
        double ay = 0.0;
        double az = 0.0;
        
        for (int j = 0; j < nj; j++) {
            if(i == j) continue;
            double dx = float(posj[j][0] - xi);
            double dy = float(posj[j][1] - yi);
            double dz = float(posj[j][2] - zi);
            double r2 = dx * dx + dy * dy + dz * dz;
            double ri2 = 1.0f / sqrt(r2);
            double mr = mj[j] * ri2 * ri2 * ri2;

            ax += double(mr * dx);
            ay += double(mr * dy);
            az += double(mr * dz);
        }
        
        acci[i][0] = ax;
        acci[i][1] = ay;
        acci[i][2] = az;
    }
}
void evaluate_gravity_simd(
    int ni,
    int nj,
    double xi[],
    double yi[],
    double zi[],
    double xj[],
    double yj[],
    double zj[],
    double j_element[][4], //及ぼす粒子jの要素{x, y, z, m}
    double mj[],
    double axi[],
    double ayi[],
    double azi[]
    ) {

    __m256d init_a =  _mm256_set1_pd(0.0);
    __m256d onev =  _mm256_set1_pd(1.0);
    int i, j;
    for (i = 0; i < ni; i+=4) {

        //及ぼされる粒子をベクトル化
        __m256d xI = _mm256_load_pd(&xi[i]);
        __m256d yI = _mm256_load_pd(&yi[i]);
        __m256d zI = _mm256_load_pd(&zi[i]);
        
        __m256d axI = init_a;
        __m256d ayI = init_a;
        __m256d azI = init_a;

        for (j = 0; j < nj; j++) {
        
            __m256d xjv = _mm256_set1_pd(j_element[j][0]);
            __m256d yjv = _mm256_set1_pd(j_element[j][1]);
            __m256d zjv = _mm256_set1_pd(j_element[j][2]);
            __m256d mjv = _mm256_set1_pd(j_element[j][3]);

            __m256d dxv = xjv - xI;
            __m256d dyv = yjv - yI;
            __m256d dzv = zjv - zI;

            __m256d rv = dxv * dxv + dyv * dyv + dzv * dzv;
            __m256d rv_sq = _mm256_sqrt_pd(rv);
            __m256d rv_inv = _mm256_div_pd(onev, rv_sq);
            __m256d r3v_inv = rv_inv * rv_inv * rv_inv;
            __m256d mr = mjv * r3v_inv;

            axI = axI + mr * dxv;
            ayI = ayI + mr * dyv;
            azI = azI + mr * dzv;
        }

        _mm256_store_pd(&axi[i], axI);
        _mm256_store_pd(&ayi[i], ayI);
        _mm256_store_pd(&azi[i], azI);
    }
}

int main() {

    std::mt19937 mt;
    std::uniform_real_distribution<double> ud(0.0, 1.0);

    int i, n = 10000;
    int ni = n, nj = n;

    double pos[n][3];
    double mj[n];
    double acci[n][3];

    __attribute__((aligned(32))) double X[n];
    __attribute__((aligned(32))) double Y[n];
    __attribute__((aligned(32))) double Z[n];
    __attribute__((aligned(32))) double axi[n];
    __attribute__((aligned(32))) double ayi[n];
    __attribute__((aligned(32))) double azi[n];
    __attribute__((aligned(32))) double j_element[n][4]; //及ぼす粒子jの要素{x, y, z, m}
    for(i = 0;i < n;i++) {
        double x = ud(mt);
        double y = ud(mt);
        double z = ud(mt);
        double m = ud(mt);

        pos[i][0] = x;
        pos[i][1] = y;
        pos[i][2] = z;
        mj[i] = m;

        X[i] = x;
        Y[i] = y;
        Z[i] = z;
        j_element[i][0] = x;
        j_element[i][1] = y;
        j_element[i][2] = z;
        j_element[i][3] = m;

    }

    clock_t start, end;
    start = clock();
    evaluate_gravity(n, n, pos, pos, mj, acci);
    end = clock();
    double non_simd_elapsed = (double)(end - start) / CLOCKS_PER_SEC;
    printf("N = %d\n", n);
    printf("evaluate_gravity of elapsed time = %lfsec\n", non_simd_elapsed);
    // double elapsed = (double)(end - start) / CLOCKS_PER_SEC;
    // printf("N = %d\n", n);
    // printf("evaluate_gravity of elapsed time = %lfsec\n", elapsed);
    start = clock();
    evaluate_gravity_simd(n, n, X, Y, Z, X, Y, Z, j_element, mj, axi, ayi, azi);
    end = clock();
    double simd_elapsed = (double)(end - start) / CLOCKS_PER_SEC;

    printf("evaluate_gravity_simd of elapsed time = %lfsec\n", simd_elapsed);

    printf("%lf times\n", non_simd_elapsed / simd_elapsed);
    // start = clock();
    // evaluate_gravity_simd(n, n, X, Y, Z, X, Y, Z, j_element, mj, axi, ayi, azi);
    // end = clock();
    // elapsed = (double)(end - start) / CLOCKS_PER_SEC;

    // printf("evaluate_gravity_simd of elapsed time = %lfsec\n", elapsed);

    bool flag = true;

    set<vector<double>> acc_non_simd, acc_simd;

    for(i = 0;i < n;i++) {
        vector<double> acciv, accv;
        acciv.push_back(acci[i][0]);
        acciv.push_back(acci[i][1]);
        acciv.push_back(acci[i][2]);

        accv.push_back(axi[i]);
        accv.push_back(ayi[i]);
        accv.push_back(azi[i]);

        acc_non_simd.insert(acciv);
        acc_simd.insert(accv);
    }

    if(acc_non_simd != acc_non_simd) {
        flag = false;
    }

    if(flag) {
        cout << "correct" << endl;
    } else {
        cout << "false" << endl;
    }
}