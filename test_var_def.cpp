#include <stdio.h>
#include <time.h>

// ここに計測したい関数を定義します。
int yourFunction(long long int n) {
    // 何か時間がかかる処理を行う
    int ans = 0;
    for(long i = 0; i < n; i++) {
         ans += i;
    }
    return ans;
}

int func_vardef(long long int n){
   int ans = 0;
   for (long i = 0; i < n; i++ ){
      int j;
         j = i;
      ans += (i + j);
   }
   return ans;
}


int main() {
    clock_t start, end;
    double cpu_time_used;

   long long int n = 10000000;
    // 関数の実行前の時間を記録

    start = clock();

    // 計測したい関数を実行
    yourFunction(n);

    // 関数の実行後の時間を記録
    end = clock();

    // CPU時間を計算（秒単位）
    cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;

    printf("関数の実行時間: %f 秒\n", cpu_time_used);

   start = clock();
   func_vardef(n);
   end = clock();

    cpu_time_used = cpu_time_used-  ((double) (end - start)) / CLOCKS_PER_SEC;
    printf("vardef - 関数の時間: %fsec\n", cpu_time_used);


    return 0;
}
