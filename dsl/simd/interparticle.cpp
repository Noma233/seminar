#include<stdio.h>
// #include <x86intrin.h> これは全部のint命令が使えるようになる奴
#include<algorithm>
#include<math.h>
#include <immintrin.h>
#include <random>
#include<time.h>
#include<iostream>
#include<set>
using namespace std;

#include "../gen/gravity_code.hpp"
// #include "../gen/gen_0122_goodscore.hpp"
// #include "../gen/gen_0122_simd_correctans.hpp"

void evaluate_gravity(
int ni,
int nj,
double posi[][3],
double posj[][3],
double mj[],
double acci[][3],
double eps2) {
                  
for (int i = 0; i < ni; i++) {
    double xi = posi[i][0];
    double yi = posi[i][1];
    double zi = posi[i][2];
    double ax = 0.0;
    double ay = 0.0;
    double az = 0.0;

    for (int j = 0; j < nj; j++) {
        double dx = double(posj[j][0] - xi);
        double dy = double(posj[j][1] - yi);
        double dz = double(posj[j][2] - zi);
        double r2 = dx * dx + dy * dy + dz * dz + eps2;
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
void evaluate_gravity_simd(int ni, int nj, double xi[], double yi[], double zi[],
    double xj[],
    double yj[],
    double zj[],
    double j_element[][4], //及ぼす粒子jの要素{x, y, z, m}
    double mj[],
    double axi[],
    double ayi[],
    double azi[],
    double eps2
) {
    __m256d init_a =  _mm256_set1_pd(0.0);
    __m256d onev =  _mm256_set1_pd(1.0);
    __m256d eps2v = _mm256_set1_pd(eps2);
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

            __m256d rv = dxv * dxv + dyv * dyv + dzv * dzv + eps2v;
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

void print_vec(vector<vector<double>> a, int n, FILE *fp) {
    int i;

    for(i = 0;i < n;i++) {
        fprintf(fp, "{id=%d, x=%lf, y=%lf, z=%lf}", i, a[i][0], a[i][1], a[i][2]);
    }
    fprintf(fp, "\n");
}

//aiy が確かめたいデータの配列
vector<double> check_particles_v3_v3(double aix[][3], double aiy[][3], int n){
    bool flag = true;
    double eps = 0.000001;
    double max_relerr = 0.0;
    double min_relerr = 1000000.0;
    vector<double> ans = {0, 0};
    for(int i = 0;i < n;i++) {

        
        double ai0 = aiy[i][0];
        double ai1 = aiy[i][1];
        double ai2 = aiy[i][2];

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


        max_relerr = max({max_relerr, abs(aiy[i][0] - aix[i][0]) / abs(ai0),
                                      abs(aiy[i][1] - aix[i][1]) / abs(ai1),
                                      abs(aiy[i][2] - aix[i][2]) / abs(ai2)});

        min_relerr = min({min_relerr, abs(aiy[i][0] - aix[i][0]) / abs(ai0),
                                      abs(aiy[i][1] - aix[i][1]) / abs(ai1),
                                      abs(aiy[i][2] - aix[i][2]) / abs(ai2)});
        if(i % 1000 == 0){
            cout << "max is " << max_relerr << endl;
            cout << "min is " << min_relerr << endl;
            cout << aix[i][0] << endl;
            cout << aiy[i][0] << endl;
        }
    }


    ans[0] = max_relerr;
    ans[1] = min_relerr;
    return ans;
}

vector<double> check_particles(double axi[], double ayi[],
                     double azi[], double acci[][3],
                     int n) {
    bool flag = true;
    double eps = 0.000001;
    double max_relerr = 0.0;
    double min_relerr = 10000000.0;
    vector<double> ans = {0, 0};
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
        if(i % 100 == 0){
            cout << "max is " << max_relerr << endl;
            cout << "min is " << min_relerr << endl;
            cout << acci[i][0] << endl;
            cout << axi[i] << endl;
        }
    }


    ans[0] = max_relerr;
    ans[1] = min_relerr;
    return ans;
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

    //__attribute__((aligned(32))) 
    //pykg用のデータ
    __attribute__((aligned(32))) double xij[n][3];
    __attribute__((aligned(32))) double pyker_m[n];
    __attribute__((aligned(32))) double ai[n][3];
    __attribute__((aligned(32))) double g = 1;
    __attribute__((aligned(32))) double eps2 = pow(2, -5);


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

        xij[i][0] = x;
        xij[i][1] = y;
        xij[i][2] = z;
        pyker_m[i] = m;

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
    evaluate_gravity(n, n,pos, pos, mj, acci, eps2);
    end = clock();
    double non_simd_elapsed = (double)(end - start) / CLOCKS_PER_SEC;
    printf("N = %d\n", n);
    printf("evaluate_gravity of elapsed time = %lfsec\n", non_simd_elapsed);

    start = clock();
    kernel(n, xij, xij, pyker_m, ai, eps2, g);
    end = clock();
    double gen_code_time = (double)(end - start) / CLOCKS_PER_SEC;
    printf("genarate code time = %lfsec\n", gen_code_time);

    start = clock();
    evaluate_gravity_simd(n, n, X, Y, Z, X, Y, Z, j_element, mj, axi, ayi, azi, eps2);
    end = clock();
    double simd_elapsed = (double)(end - start) / CLOCKS_PER_SEC;

    printf("evaluate_gravity_simd of elapsed time = %lfsec\n", simd_elapsed);

    // printf("%lf times\n", non_simd_elapsed / simd_elapsed);

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

    // check_particles(axi, ayi, azi, acci, n, ans);
    // ans = check_particles(axi, ayi, azi, ai, n);
    // ans = check_particles(pos[0], pos[1], pos[2], ai, n);
    ans = check_particles_v3_v3(acci, ai, n);

    printf("max reldiff = %lf, min reldiff = %lf\n", ans[1], ans[0]);

}
