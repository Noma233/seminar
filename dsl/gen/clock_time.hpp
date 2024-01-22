#include <math.h>
#include <iostream>
#include<time.h>
using namespace std;

template<class funcp>
double get_sec_func(funcp f){
    
    clock_t st, e;
    st = clock();
    for(int i = 0;i < n;i++) {
        ans_pow[i] = check_pow(i);
    }
    e = clock();
    double get_pow_time = (double)(e - st) / CLOCKS_PER_SEC;
    printf("time = %lf\n", get_pow_time);

}