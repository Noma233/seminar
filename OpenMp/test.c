#include <stdio.h>

int main(void){

  #pragma omp parallel  
  {
    printf("Hello OpenM Spec %d!\n", _OPENMP);
  }

  
}
