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
static_assert(sizeof(EPI) == 48,"check consistency of EPI member variable definition between PIKG source and original source");
static_assert(sizeof(EPJ) == 64,"check consistency of EPJ member variable definition between PIKG source and original source");
static_assert(sizeof(FORCE) == 48,"check consistency of FORCE member variable definition between PIKG source and original source");
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
PIKG::F64vec ri;

ri.x = epi[i+0].r.x;
ri.y = epi[i+0].r.y;
ri.z = epi[i+0].r.z;
PIKG::F64vec vi;

vi.x = epi[i+0].v.x;
vi.y = epi[i+0].v.y;
vi.z = epi[i+0].v.z;
PIKG::F64vec F;

F.x = 0.0;
F.y = 0.0;
F.z = 0.0;
PIKG::F64vec J;

J.x = 0.0;
J.y = 0.0;
J.z = 0.0;
for(j = 0;j < nj;++j){
PIKG::F64 eps2;

eps2 = epj[j].eps;
PIKG::F64 mj;

mj = epj[j].m;
PIKG::F64vec rj;

rj.x = epj[j].r.x;
rj.y = epj[j].r.y;
rj.z = epj[j].r.z;
PIKG::F64vec vj;

vj.x = epj[j].v.x;
vj.y = epj[j].v.y;
vj.z = epj[j].v.z;
PIKG::F64vec dr;

PIKG::F64vec dv;

PIKG::F64 __fkg_tmp1;

PIKG::F64 __fkg_tmp0;

PIKG::F64 r2;

PIKG::F64 r1i;

PIKG::F64 r2i;

PIKG::F64 r3i;

PIKG::F64 r5i;

PIKG::F64 __fkg_tmp3;

PIKG::F64 __fkg_tmp2;

PIKG::F64 rv;

PIKG::F64 af;

PIKG::F64 __fkg_tmp5;

PIKG::F64 __fkg_tmp4;

PIKG::F64 jf;

PIKG::F64 __fkg_tmp6;

PIKG::F64 __fkg_tmp7;

PIKG::F64 __fkg_tmp8;

dr.x = (ri.x-rj.x);
dr.y = (ri.y-rj.y);
dr.z = (ri.z-rj.z);
dv.x = (vi.x-vj.x);
dv.y = (vi.y-vj.y);
dv.z = (vi.z-vj.z);
__fkg_tmp1 = (dr.x*dr.x+eps2);
__fkg_tmp0 = (dr.y*dr.y+__fkg_tmp1);
r2 = (dr.z*dr.z+__fkg_tmp0);
r1i = (1.0/sqrt(r2));
r2i = (r1i*r1i);
r3i = (r2i*r1i);
r5i = (r3i*r2i);
__fkg_tmp3 = (dr.y*dv.y);
__fkg_tmp2 = (dr.x*dv.x+__fkg_tmp3);
rv = (dr.z*dv.z+__fkg_tmp2);
af = (mj*r3i);
__fkg_tmp5 = (3.0*mj);
__fkg_tmp4 = (__fkg_tmp5*rv);
jf = (__fkg_tmp4*r5i);
F.x = (af*dr.x+F.x);
F.y = (af*dr.y+F.y);
F.z = (af*dr.z+F.z);
__fkg_tmp6 = (af*dv.x+J.x);
J.x = (__fkg_tmp6 - jf*dr.x);
__fkg_tmp7 = (af*dv.y+J.y);
J.y = (__fkg_tmp7 - jf*dr.y);
__fkg_tmp8 = (af*dv.z+J.z);
J.z = (__fkg_tmp8 - jf*dr.z);
} // loop of j

force[i+0].f.x = (force[i+0].f.x+F.x);
force[i+0].f.y = (force[i+0].f.y+F.y);
force[i+0].f.z = (force[i+0].f.z+F.z);
force[i+0].j.x = (force[i+0].j.x+J.x);
force[i+0].j.y = (force[i+0].j.y+J.y);
force[i+0].j.z = (force[i+0].j.z+J.z);
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
