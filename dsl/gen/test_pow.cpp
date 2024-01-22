#include <math.h>
#include <iostream>
#include<time.h>
using namespace std;

double aa = 3.0;

double check_pow(double x){
   return aa / pow(x, 3/2); 
}
double check_op(double x){
    double sx = 1.0 / sqrt(x);
    return sx * sx * sx;
}

int main() {
    int n = 10000;

    double ans_pow[n], ans_sqrt[n];

    for(int i = 0;i < n;i++) {
        ans_pow[i] = i;
        ans_sqrt[i] = i;
    }

    clock_t st, e;
    st = clock();
    for(int i = 0;i < n;i++) {
        ans_pow[i] = check_pow(i * 10);
    }
    e = clock();
    double get_pow_time = (double)(e - st) / CLOCKS_PER_SEC;
    printf("time = %lf\n", get_pow_time);


    st = clock();
    for(int i = 0;i < n;i++) {
        ans_sqrt[i] = check_op(i);
    }
    e = clock();
    double get_op_time = (double)(e - st) / CLOCKS_PER_SEC;
    printf("get op time = %lf\n", get_op_time);

    printf("op_time - pow_time = %lf\n", get_op_time - get_pow_time);

}