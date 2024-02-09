#include<pikg_vector.hpp>
#include<cmath>
#include<limits>
#include<chrono>

struct Kernel{
Kernel(){}
void initialize(){
}
int kernel_id = 0;
void operator()(const EPI* __restrict__ epi,const int ni,const EPJ* __restrict__ epj,const int nj,FORCE* __restrict__ force,const int kernel_select = 1){
static_assert(sizeof(EPI) == 24,"check consistency of EPI member variable definition between PIKG source and original source");
static_assert(sizeof(EPJ) == 32,"check consistency of EPJ member variable definition between PIKG source and original source");
static_assert(sizeof(FORCE) == 32,"check consistency of FORCE member variable definition between PIKG source and original source");
if(kernel_select>=0) kernel_id = kernel_select;
if(kernel_id == 0){
std::cout << "ni: " << ni << " nj:" << nj << std::endl;
FORCE* force_tmp = new FORCE[ni];
std::chrono::system_clock::time_point  start, end;
double min_time = std::numeric_limits<double>::max();
{ // test Kernel_I1_J1
for(int i=0;i<ni;i++) force_tmp[i] = force[i];
start = std::chrono::system_clock::now();
Kernel_I1_J1(epi,ni,epj,nj,force_tmp);
end = std::chrono::system_clock::now();
double elapsed = std::chrono::duration_cast<std::chrono::nanoseconds>(end-start).count();
std::cerr << "kerel 1: " << elapsed << " ns" << std::endl;
if(min_time > elapsed){
min_time = elapsed;
kernel_id = 1;
}
}
delete[] force_tmp;
} // if(kernel_id == 0)
if(kernel_id == 1) Kernel_I1_J1(epi,ni,epj,nj,force);
} // operator() definition 
void Kernel_I1_J1(const EPI* __restrict__ epi,const PIKG::S32 ni,const EPJ* __restrict__ epj,const PIKG::S32 nj,FORCE* __restrict__ force){
PIKG::S32 i;
PIKG::S32 j;
for(i = 0;i < ni;++i){
PIKG::F64 rix;

rix = epi[i+0].rx;
PIKG::F64 riy;

riy = epi[i+0].ry;
PIKG::F64 riz;

riz = epi[i+0].rz;
PIKG::F64 fx;

fx = 0.0;
PIKG::F64 fy;

fy = 0.0;
PIKG::F64 fz;

fz = 0.0;
PIKG::F64 p;

p = 0.0;
for(j = 0;j < nj;++j){
PIKG::F64 eps2;

eps2 = epj[j].eps;
PIKG::F64 rjx;

rjx = epj[j].rx;
PIKG::F64 rjy;

rjy = epj[j].ry;
PIKG::F64 rjz;

rjz = epj[j].rz;
PIKG::F64 dx;

PIKG::F64 dy;

PIKG::F64 dz;

PIKG::F64 __fkg_tmp1;

PIKG::F64 __fkg_tmp0;

PIKG::F64 r2;

PIKG::F64 r2i;

PIKG::F64 __fkg_tmp2;

PIKG::F64 r6i;

PIKG::F64 __fkg_tmp4;

PIKG::F64 __fkg_tmp3;

PIKG::F64 f;

PIKG::F64 __fkg_tmp5;

PIKG::F64 __fkg_tmp6;

dx = (rix-rjx);
dy = (riy-rjy);
dz = (riz-rjz);
__fkg_tmp1 = (dx*dx+eps2);
__fkg_tmp0 = (dy*dy+__fkg_tmp1);
r2 = (dz*dz+__fkg_tmp0);
r2i = (1.0/r2);
__fkg_tmp2 = (r2i*r2i);
r6i = (__fkg_tmp2*r2i);
__fkg_tmp4 = (48.0*r6i-24.0);
__fkg_tmp3 = (__fkg_tmp4*r6i);
f = (__fkg_tmp3*r2i);
fx = (f*dx+fx);
fy = (f*dy+fy);
fz = (f*dz+fz);
__fkg_tmp5 = (4.0*r6i);
__fkg_tmp6 = (r6i-1.0);
p = (__fkg_tmp5*__fkg_tmp6+p);
} // loop of j

force[i+0].fx = (force[i+0].fx+fx);
force[i+0].fy = (force[i+0].fy+fy);
force[i+0].fz = (force[i+0].fz+fz);
force[i+0].p = (force[i+0].p+p);
} // loop of i
} // Kernel_I1_J1 definition 
PIKG::F64 rsqrt(PIKG::F64 op){ return 1.0/std::sqrt(op); }
PIKG::F64 sqrt(PIKG::F64 op){ return std::sqrt(op); }
PIKG::F64 inv(PIKG::F64 op){ return 1.0/op; }
PIKG::F64 max(PIKG::F64 a,PIKG::F64 b){ return std::max(a,b);}
PIKG::F64 min(PIKG::F64 a,PIKG::F64 b){ return std::min(a,b);}
PIKG::F32 rsqrt(PIKG::F32 op){ return 1.f/std::sqrt(op); }
PIKG::F32 sqrt(PIKG::F32 op){ return std::sqrt(op); }
PIKG::F32 inv(PIKG::F32 op){ return 1.f/op; }
PIKG::S64 max(PIKG::S64 a,PIKG::S64 b){ return std::max(a,b);}
PIKG::S64 min(PIKG::S64 a,PIKG::S64 b){ return std::min(a,b);}
PIKG::S32 max(PIKG::S32 a,PIKG::S32 b){ return std::max(a,b);}
PIKG::S32 min(PIKG::S32 a,PIKG::S32 b){ return std::min(a,b);}
PIKG::F64 table(PIKG::F64 tab[],PIKG::S64 i){ return tab[i]; }
PIKG::F32 table(PIKG::F32 tab[],PIKG::S32 i){ return tab[i]; }
PIKG::F64 to_float(PIKG::U64 op){return (PIKG::F64)op;}
PIKG::F32 to_float(PIKG::U32 op){return (PIKG::F32)op;}
PIKG::F64 to_float(PIKG::S64 op){return (PIKG::F64)op;}
PIKG::F32 to_float(PIKG::S32 op){return (PIKG::F32)op;}
PIKG::S64   to_int(PIKG::F64 op){return (PIKG::S64)op;}
PIKG::S32   to_int(PIKG::F32 op){return (PIKG::S32)op;}
PIKG::U64  to_uint(PIKG::F64 op){return (PIKG::U64)op;}
PIKG::U32  to_uint(PIKG::F32 op){return (PIKG::U32)op;}
template<typename T> PIKG::F64 to_f64(const T& op){return (PIKG::F64)op;}
template<typename T> PIKG::F32 to_f32(const T& op){return (PIKG::F32)op;}
template<typename T> PIKG::S64 to_s64(const T& op){return (PIKG::S64)op;}
template<typename T> PIKG::S32 to_s32(const T& op){return (PIKG::S32)op;}
template<typename T> PIKG::U64 to_u64(const T& op){return (PIKG::U64)op;}
template<typename T> PIKG::U32 to_u32(const T& op){return (PIKG::U32)op;}
};// kernel functor definition 
