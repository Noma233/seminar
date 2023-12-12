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
        double dx = double(posj[j][0] - xi);
        double dy = double(posj[j][1] - yi);
        double dz = double(posj[j][2] - zi);
        double r2 = dx * dx + dy * dy + dz * dz;
        double ri2 = 1.0f / sqrt(r2); // <- 1.0f / r2 となっていて
                                      //evaluate_gravityが速くなっていた
        
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

            __m256d xjv = _mm256_set1_pd(j_element[j][0]); // jのx軸における位置
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

            if(i == j || i + 1 == j || i + 2 == j || i + 3 == j) {
                mr[j - i] = 0.0;
            }
            
            axI = axI + mr * dxv;
            ayI = ayI + mr * dyv;
            azI = azI + mr * dzv;
        }

        _mm256_store_pd(&axi[i], axI);
        _mm256_store_pd(&ayi[i], ayI);
        _mm256_store_pd(&azi[i], azI);
    }
}

void print_vec(vector<vector<double>> a, int n, FILE *fp) {
    int i;

    for(i = 0;i < n;i++) {
        fprintf(fp, "{id=%d, x=%lf, y=%lf, z=%lf}", i, a[i][0], a[i][1], a[i][2]);
    }
    fprintf(fp, "\n");
}

void check_particles(double axi[], double ayi[],
                     double azi[], double acci[][3],
                     int n, vector<double> &ans) {
    bool flag = true;
    double eps = 0.000001;
    double max_relerr = 0.0;
    double min_relerr = 10000000;
    for(int i = 0;i < n;i++) {
        
        double ai0 = acci[i][0];
        double ai1 = acci[i][1];
        double ai2 = acci[i][2];

        //真値が0の時，相対誤差は絶対誤差になるため
        if(ai0 == 0) {
            ai0 = 1;
        }
        if(ai1 == 0) {
            ai1 = 1;
        }
        if(ai2 == 0) {
            ai2 = 1;
        }


        max_relerr = max({max_relerr, abs(acci[i][0] - axi[i]) / abs(ai0),
                                      abs(acci[i][1] - ayi[i]) / abs(ai1),
                                      abs(acci[i][2] - azi[i]) / abs(ai2)});

        min_relerr = min({min_relerr, abs(acci[i][0] - axi[i]) / abs(ai0),
                                      abs(acci[i][1] - ayi[i]) / abs(ai1),
                                      abs(acci[i][2] - azi[i]) / abs(ai2)});
    }


    ans.push_back(max_relerr);
    ans.push_back(min_relerr);

}

int main() {


    std::mt19937 mt;
    std::uniform_real_distribution<double> ud(0.0, 1.0);

    int i, n = 10000;
    int ni = n, nj = n;

    double pos[n][3];
    double mj[n];
    double acci[n][3];
    int id[n];

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
        id[i] = i;

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
    evaluate_gravity(n, n,pos, pos, mj, acci);
    end = clock();
    double non_simd_elapsed = (double)(end - start) / CLOCKS_PER_SEC;
    printf("N = %d\n", n);
    printf("evaluate_gravity of elapsed time = %lfsec\n", non_simd_elapsed);

    start = clock();
    evaluate_gravity_simd(n, n, X, Y, Z, X, Y, Z, j_element, mj, axi, ayi, azi);
    end = clock();
    double simd_elapsed = (double)(end - start) / CLOCKS_PER_SEC;

    printf("evaluate_gravity_simd of elapsed time = %lfsec\n", simd_elapsed);

    printf("%lf times\n", non_simd_elapsed / simd_elapsed);

    FILE *non_simd_fp, *simd_fp;
    non_simd_fp = fopen("non_simd_result.txt", "w");
    simd_fp = fopen("simd_result.txt", "w");

    vector<vector<double>> non_simd_v;
    vector<vector<double>> simd_v;
    for(i = 0;i < n;i++) {
        vector<double> tmp;
        tmp.push_back(acci[i][0]);
        tmp.push_back(acci[i][1]);
        tmp.push_back(acci[i][2]);
        non_simd_v.push_back(tmp);
        tmp.clear();

        tmp.push_back(axi[i]);
        tmp.push_back(ayi[i]);
        tmp.push_back(azi[i]);
        simd_v.push_back(tmp);
    }

    print_vec(non_simd_v, n, non_simd_fp);
    print_vec(simd_v, n, simd_fp);
    fclose(non_simd_fp);
    fclose(simd_fp);

    vector<double> ans;

    check_particles(axi, ayi, azi, acci, n, ans);

    printf("max reldiff = %lf, min reldiff = %lf\n", ans[0], ans[1]);



}