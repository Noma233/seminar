#include<bits/stdc++.h>
using namespace std;
double G = 10;

class  vec3 {
  public:
    double x, y, z;

  vec3() : x(0), y(0), z(0) {}
 
  vec3(double x1, double y1, double z1){
    x = x1;
    y = y1;
    z = z1;
  }

  vec3 operator-(vec3 xj) {
    double dx = this->x - xj.x;
    double dy = this->y - xj.y;
    double dz = this->z - xj.z; 
    vec3 ret(dx, dy, dz);
    return ret;
    
  }

  vec3 operator+(vec3 xj) {
   
   double dx = this->x + xj.x;
   double dy = this->y + xj.y;
   double dz = this->z + xj.z; 
  }

  vec3 operator*(double x) {
    vec3 ret(this->x * x, this->y * x, this->z * x);
    return ret;
  }

  inline double r_2() {
    return this->x * this->x + this->y * this->y + this->z * this->z;
  }

  void ve3_print() {
  cout << "x y z:" << endl;
  cout << this->x << " " << this->y << " " << this->z << endl;
  }
};

class particle {
  public:
  vec3 position;
  vec3 ac;  
  double m;

  particle(){
    vec3 p, a;
    this->position = p;
    this->ac = a;
    this->m = 0.0;
  }

  particle(vec3 posi, vec3 ac1, double m1) {
    this->position = posi;
    this->ac = ac1;
    this->m = m1;
  }

};


inline void pii2(particle &xi, particle &xj) {
  vec3 dis, ad_ac;
  dis = xi.position - xj.position;
  ad_ac = dis * (G*xj.m * (dis.r_2()));   
  xi.ac = xi.ac + ad_ac;
}

//dtにおける力の相互作用の計算
inline void piin(vector<particle> &xis) {
  int i = 0, j = 0;
  int n = xis.size();
  for(i = 0;i < n;i++) {
    for(j = 0;j < n;j++) {
      if(i == j) continue;
      pii2(xis[i], xis[j]);
    }
  }
}

int main() {

  vec3 pos1(2.0, 2.0, 2.0), pos2(1.0, 1.0, 1.0);
  vec3 ac1(2, 2, 2), ac2(2, 2, 2);
  particle xi(pos1, ac1, 1.0), xj(pos2, ac2, 1.0);

  pii2(xi, xj);

  
  xi.ac.ve3_print();

}
