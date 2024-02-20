#include<pikg_vector.hpp>
#include<cmath>
#include<limits>
#include<chrono>

#include <pikg_avx2.hpp>
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
{ // test Kernel_I4_J1
for(int i=0;i<ni;i++) force_tmp[i] = force[i];
start = std::chrono::system_clock::now();
Kernel_I4_J1(epi,ni,epj,nj,force_tmp);
end = std::chrono::system_clock::now();
double elapsed = std::chrono::duration_cast<std::chrono::nanoseconds>(end-start).count();
std::cerr << "kerel 1: " << elapsed << " ns" << std::endl;
if(min_time > elapsed){
min_time = elapsed;
kernel_id = 1;
}
}
{ // test Kernel_I1_J4
for(int i=0;i<ni;i++) force_tmp[i] = force[i];
start = std::chrono::system_clock::now();
Kernel_I1_J4(epi,ni,epj,nj,force_tmp);
end = std::chrono::system_clock::now();
double elapsed = std::chrono::duration_cast<std::chrono::nanoseconds>(end-start).count();
std::cerr << "kerel 2: " << elapsed << " ns" << std::endl;
if(min_time > elapsed){
min_time = elapsed;
kernel_id = 2;
}
}
delete[] force_tmp;
} // if(kernel_id == 0)
if(kernel_id == 1) Kernel_I4_J1(epi,ni,epj,nj,force);
if(kernel_id == 2) Kernel_I1_J4(epi,ni,epj,nj,force);
} // operator() definition 
void Kernel_I4_J1(const EPI* __restrict__ epi,const PIKG::S32 ni,const EPJ* __restrict__ epj,const PIKG::S32 nj,FORCE* __restrict__ force){
PIKG::S32 i;
PIKG::S32 j;
for(i = 0;i < (ni/4)*4;i += 4){
__m256d rix;

alignas(32) int index_gather_load0[4] = {0,3,6,9};
__m128i vindex_gather_load0 = _mm_load_si128((const __m128i*)index_gather_load0);
rix = _mm256_i32gather_pd(((double*)&epi[i+0].rx),vindex_gather_load0,8);
__m256d riy;

alignas(32) int index_gather_load1[4] = {0,3,6,9};
__m128i vindex_gather_load1 = _mm_load_si128((const __m128i*)index_gather_load1);
riy = _mm256_i32gather_pd(((double*)&epi[i+0].ry),vindex_gather_load1,8);
__m256d riz;

alignas(32) int index_gather_load2[4] = {0,3,6,9};
__m128i vindex_gather_load2 = _mm_load_si128((const __m128i*)index_gather_load2);
riz = _mm256_i32gather_pd(((double*)&epi[i+0].rz),vindex_gather_load2,8);
__m256d fx;

fx = _mm256_set1_pd(0.0);
__m256d fy;

fy = _mm256_set1_pd(0.0);
__m256d fz;

fz = _mm256_set1_pd(0.0);
__m256d p;

p = _mm256_set1_pd(0.0);
for(j = 0;j < (nj/1)*1;++j){
__m256d eps2;

eps2 = _mm256_set1_pd(epj[j].eps);

__m256d rjx;

rjx = _mm256_set1_pd(epj[j].rx);

__m256d rjy;

rjy = _mm256_set1_pd(epj[j].ry);

__m256d rjz;

rjz = _mm256_set1_pd(epj[j].rz);

__m256d dx;

__m256d dy;

__m256d dz;

__m256d __fkg_tmp1;

__m256d __fkg_tmp0;

__m256d r2;

__m256d r2_inv;

__m256d __fkg_tmp2;

__m256d r2_inv3;

__m256d r2_inv6;

__m256d __fkg_tmp5;

__m256d __fkg_tmp4;

__m256d __fkg_tmp3;

__m256d f;

__m256d __fkg_tmp6;

__m256d __fkg_tmp7;

dx = _mm256_sub_pd(rix,rjx);
dy = _mm256_sub_pd(riy,rjy);
dz = _mm256_sub_pd(riz,rjz);
__fkg_tmp1 = _mm256_fmadd_pd(dx,dx,eps2);
__fkg_tmp0 = _mm256_fmadd_pd(dy,dy,__fkg_tmp1);
r2 = _mm256_fmadd_pd(dz,dz,__fkg_tmp0);
r2_inv = _mm256_div_pd(_mm256_set1_pd(1.0),sqrt(r2));
__fkg_tmp2 = _mm256_mul_pd(r2_inv,r2_inv);
r2_inv3 = _mm256_mul_pd(__fkg_tmp2,r2_inv);
r2_inv6 = _mm256_mul_pd(r2_inv3,r2_inv3);
__fkg_tmp5 = _mm256_fmsub_pd(_mm256_set1_pd(48.0),r2_inv6,_mm256_set1_pd(24.0));
__fkg_tmp4 = _mm256_mul_pd(__fkg_tmp5,r2_inv3);
__fkg_tmp3 = _mm256_mul_pd(__fkg_tmp4,r2_inv);
f = _mm256_mul_pd(__fkg_tmp3,r2_inv);
fx = _mm256_fmadd_pd(f,dx,fx);
fy = _mm256_fmadd_pd(f,dy,fy);
fz = _mm256_fmadd_pd(f,dz,fz);
__fkg_tmp6 = _mm256_mul_pd(_mm256_set1_pd(4.0),r2_inv6);
__fkg_tmp7 = _mm256_sub_pd(r2_inv6,_mm256_set1_pd(1.0));
p = _mm256_fmadd_pd(__fkg_tmp6,__fkg_tmp7,p);
} // loop of j

{
__m256d __fkg_tmp_accum;
alignas(32) int index_gather_load3[4] = {0,4,8,12};
__m128i vindex_gather_load3 = _mm_load_si128((const __m128i*)index_gather_load3);
__fkg_tmp_accum = _mm256_i32gather_pd(((double*)&force[i+0].fx),vindex_gather_load3,8);
__fkg_tmp_accum = _mm256_add_pd(__fkg_tmp_accum,fx);
{
PIKG::F64 __fkg_store_tmp[4];
_mm256_storeu_pd(__fkg_store_tmp,__fkg_tmp_accum);
((double*)&force[i+0].fx)[0] = __fkg_store_tmp[0];
((double*)&force[i+0].fx)[4] = __fkg_store_tmp[1];
((double*)&force[i+0].fx)[8] = __fkg_store_tmp[2];
((double*)&force[i+0].fx)[12] = __fkg_store_tmp[3];
}
}

{
__m256d __fkg_tmp_accum;
alignas(32) int index_gather_load4[4] = {0,4,8,12};
__m128i vindex_gather_load4 = _mm_load_si128((const __m128i*)index_gather_load4);
__fkg_tmp_accum = _mm256_i32gather_pd(((double*)&force[i+0].fy),vindex_gather_load4,8);
__fkg_tmp_accum = _mm256_add_pd(__fkg_tmp_accum,fy);
{
PIKG::F64 __fkg_store_tmp[4];
_mm256_storeu_pd(__fkg_store_tmp,__fkg_tmp_accum);
((double*)&force[i+0].fy)[0] = __fkg_store_tmp[0];
((double*)&force[i+0].fy)[4] = __fkg_store_tmp[1];
((double*)&force[i+0].fy)[8] = __fkg_store_tmp[2];
((double*)&force[i+0].fy)[12] = __fkg_store_tmp[3];
}
}

{
__m256d __fkg_tmp_accum;
alignas(32) int index_gather_load5[4] = {0,4,8,12};
__m128i vindex_gather_load5 = _mm_load_si128((const __m128i*)index_gather_load5);
__fkg_tmp_accum = _mm256_i32gather_pd(((double*)&force[i+0].fz),vindex_gather_load5,8);
__fkg_tmp_accum = _mm256_add_pd(__fkg_tmp_accum,fz);
{
PIKG::F64 __fkg_store_tmp[4];
_mm256_storeu_pd(__fkg_store_tmp,__fkg_tmp_accum);
((double*)&force[i+0].fz)[0] = __fkg_store_tmp[0];
((double*)&force[i+0].fz)[4] = __fkg_store_tmp[1];
((double*)&force[i+0].fz)[8] = __fkg_store_tmp[2];
((double*)&force[i+0].fz)[12] = __fkg_store_tmp[3];
}
}

{
__m256d __fkg_tmp_accum;
alignas(32) int index_gather_load6[4] = {0,4,8,12};
__m128i vindex_gather_load6 = _mm_load_si128((const __m128i*)index_gather_load6);
__fkg_tmp_accum = _mm256_i32gather_pd(((double*)&force[i+0].p),vindex_gather_load6,8);
__fkg_tmp_accum = _mm256_add_pd(__fkg_tmp_accum,p);
{
PIKG::F64 __fkg_store_tmp[4];
_mm256_storeu_pd(__fkg_store_tmp,__fkg_tmp_accum);
((double*)&force[i+0].p)[0] = __fkg_store_tmp[0];
((double*)&force[i+0].p)[4] = __fkg_store_tmp[1];
((double*)&force[i+0].p)[8] = __fkg_store_tmp[2];
((double*)&force[i+0].p)[12] = __fkg_store_tmp[3];
}
}

} // loop of i
{ // tail loop of reference 
for(;i < ni;++i){
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

PIKG::F64 r2_inv;

PIKG::F64 __fkg_tmp2;

PIKG::F64 r2_inv3;

PIKG::F64 r2_inv6;

PIKG::F64 __fkg_tmp5;

PIKG::F64 __fkg_tmp4;

PIKG::F64 __fkg_tmp3;

PIKG::F64 f;

PIKG::F64 __fkg_tmp6;

PIKG::F64 __fkg_tmp7;

dx = (rix-rjx);
dy = (riy-rjy);
dz = (riz-rjz);
__fkg_tmp1 = (dx*dx+eps2);
__fkg_tmp0 = (dy*dy+__fkg_tmp1);
r2 = (dz*dz+__fkg_tmp0);
r2_inv = (1.0/sqrt(r2));
__fkg_tmp2 = (r2_inv*r2_inv);
r2_inv3 = (__fkg_tmp2*r2_inv);
r2_inv6 = (r2_inv3*r2_inv3);
__fkg_tmp5 = (48.0*r2_inv6-24.0);
__fkg_tmp4 = (__fkg_tmp5*r2_inv3);
__fkg_tmp3 = (__fkg_tmp4*r2_inv);
f = (__fkg_tmp3*r2_inv);
fx = (f*dx+fx);
fy = (f*dy+fy);
fz = (f*dz+fz);
__fkg_tmp6 = (4.0*r2_inv6);
__fkg_tmp7 = (r2_inv6-1.0);
p = (__fkg_tmp6*__fkg_tmp7+p);
} // loop of j

force[i+0].fx = (force[i+0].fx+fx);
force[i+0].fy = (force[i+0].fy+fy);
force[i+0].fz = (force[i+0].fz+fz);
force[i+0].p = (force[i+0].p+p);
} // loop of i
} // end loop of reference 
} // Kernel_I4_J1 definition 
void Kernel_I1_J4(const EPI* __restrict__ epi,const PIKG::S32 ni,const EPJ* __restrict__ epj,const PIKG::S32 nj,FORCE* __restrict__ force){
PIKG::S32 i;
PIKG::S32 j;
for(i = 0;i < (ni/1)*1;++i){
__m256d rix;

rix = _mm256_set1_pd(epi[i+0].rx);

__m256d riy;

riy = _mm256_set1_pd(epi[i+0].ry);

__m256d riz;

riz = _mm256_set1_pd(epi[i+0].rz);

__m256d fx;

fx = _mm256_set1_pd(0.0);
__m256d fy;

fy = _mm256_set1_pd(0.0);
__m256d fz;

fz = _mm256_set1_pd(0.0);
__m256d p;

p = _mm256_set1_pd(0.0);
for(j = 0;j < (nj/4)*4;j += 4){
__m256d eps2;

alignas(32) int index_gather_load7[4] = {0,4,8,12};
__m128i vindex_gather_load7 = _mm_load_si128((const __m128i*)index_gather_load7);
eps2 = _mm256_i32gather_pd(((double*)&epj[j].eps),vindex_gather_load7,8);
__m256d rjx;

alignas(32) int index_gather_load8[4] = {0,4,8,12};
__m128i vindex_gather_load8 = _mm_load_si128((const __m128i*)index_gather_load8);
rjx = _mm256_i32gather_pd(((double*)&epj[j].rx),vindex_gather_load8,8);
__m256d rjy;

alignas(32) int index_gather_load9[4] = {0,4,8,12};
__m128i vindex_gather_load9 = _mm_load_si128((const __m128i*)index_gather_load9);
rjy = _mm256_i32gather_pd(((double*)&epj[j].ry),vindex_gather_load9,8);
__m256d rjz;

alignas(32) int index_gather_load10[4] = {0,4,8,12};
__m128i vindex_gather_load10 = _mm_load_si128((const __m128i*)index_gather_load10);
rjz = _mm256_i32gather_pd(((double*)&epj[j].rz),vindex_gather_load10,8);
__m256d dx;

__m256d dy;

__m256d dz;

__m256d __fkg_tmp1;

__m256d __fkg_tmp0;

__m256d r2;

__m256d r2_inv;

__m256d __fkg_tmp2;

__m256d r2_inv3;

__m256d r2_inv6;

__m256d __fkg_tmp5;

__m256d __fkg_tmp4;

__m256d __fkg_tmp3;

__m256d f;

__m256d __fkg_tmp6;

__m256d __fkg_tmp7;

dx = _mm256_sub_pd(rix,rjx);
dy = _mm256_sub_pd(riy,rjy);
dz = _mm256_sub_pd(riz,rjz);
__fkg_tmp1 = _mm256_fmadd_pd(dx,dx,eps2);
__fkg_tmp0 = _mm256_fmadd_pd(dy,dy,__fkg_tmp1);
r2 = _mm256_fmadd_pd(dz,dz,__fkg_tmp0);
r2_inv = _mm256_div_pd(_mm256_set1_pd(1.0),sqrt(r2));
__fkg_tmp2 = _mm256_mul_pd(r2_inv,r2_inv);
r2_inv3 = _mm256_mul_pd(__fkg_tmp2,r2_inv);
r2_inv6 = _mm256_mul_pd(r2_inv3,r2_inv3);
__fkg_tmp5 = _mm256_fmsub_pd(_mm256_set1_pd(48.0),r2_inv6,_mm256_set1_pd(24.0));
__fkg_tmp4 = _mm256_mul_pd(__fkg_tmp5,r2_inv3);
__fkg_tmp3 = _mm256_mul_pd(__fkg_tmp4,r2_inv);
f = _mm256_mul_pd(__fkg_tmp3,r2_inv);
fx = _mm256_fmadd_pd(f,dx,fx);
fy = _mm256_fmadd_pd(f,dy,fy);
fz = _mm256_fmadd_pd(f,dz,fz);
__fkg_tmp6 = _mm256_mul_pd(_mm256_set1_pd(4.0),r2_inv6);
__fkg_tmp7 = _mm256_sub_pd(r2_inv6,_mm256_set1_pd(1.0));
p = _mm256_fmadd_pd(__fkg_tmp6,__fkg_tmp7,p);
} // loop of j

if(j<nj){ // tail j loop
__m256d __fkg_tmp8;

__fkg_tmp8 = fx;
__m256d __fkg_tmp9;

__fkg_tmp9 = fy;
__m256d __fkg_tmp10;

__fkg_tmp10 = fz;
__m256d __fkg_tmp11;

__fkg_tmp11 = p;
for(;j < nj;++j){
__m256d eps2;

eps2 = _mm256_set1_pd(epj[j].eps);

__m256d rjx;

rjx = _mm256_set1_pd(epj[j].rx);

__m256d rjy;

rjy = _mm256_set1_pd(epj[j].ry);

__m256d rjz;

rjz = _mm256_set1_pd(epj[j].rz);

__m256d dx;

__m256d dy;

__m256d dz;

__m256d __fkg_tmp1;

__m256d __fkg_tmp0;

__m256d r2;

__m256d r2_inv;

__m256d __fkg_tmp2;

__m256d r2_inv3;

__m256d r2_inv6;

__m256d __fkg_tmp5;

__m256d __fkg_tmp4;

__m256d __fkg_tmp3;

__m256d f;

__m256d __fkg_tmp6;

__m256d __fkg_tmp7;

dx = _mm256_sub_pd(rix,rjx);
dy = _mm256_sub_pd(riy,rjy);
dz = _mm256_sub_pd(riz,rjz);
__fkg_tmp1 = _mm256_fmadd_pd(dx,dx,eps2);
__fkg_tmp0 = _mm256_fmadd_pd(dy,dy,__fkg_tmp1);
r2 = _mm256_fmadd_pd(dz,dz,__fkg_tmp0);
r2_inv = _mm256_div_pd(_mm256_set1_pd(1.0),sqrt(r2));
__fkg_tmp2 = _mm256_mul_pd(r2_inv,r2_inv);
r2_inv3 = _mm256_mul_pd(__fkg_tmp2,r2_inv);
r2_inv6 = _mm256_mul_pd(r2_inv3,r2_inv3);
__fkg_tmp5 = _mm256_fmsub_pd(_mm256_set1_pd(48.0),r2_inv6,_mm256_set1_pd(24.0));
__fkg_tmp4 = _mm256_mul_pd(__fkg_tmp5,r2_inv3);
__fkg_tmp3 = _mm256_mul_pd(__fkg_tmp4,r2_inv);
f = _mm256_mul_pd(__fkg_tmp3,r2_inv);
fx = _mm256_fmadd_pd(f,dx,fx);
fy = _mm256_fmadd_pd(f,dy,fy);
fz = _mm256_fmadd_pd(f,dz,fz);
__fkg_tmp6 = _mm256_mul_pd(_mm256_set1_pd(4.0),r2_inv6);
__fkg_tmp7 = _mm256_sub_pd(r2_inv6,_mm256_set1_pd(1.0));
p = _mm256_fmadd_pd(__fkg_tmp6,__fkg_tmp7,p);
} // loop of j
fx = _mm256_blend_pd(__fkg_tmp8,fx,0b00000001);
fy = _mm256_blend_pd(__fkg_tmp9,fy,0b00000001);
fz = _mm256_blend_pd(__fkg_tmp10,fz,0b00000001);
p = _mm256_blend_pd(__fkg_tmp11,p,0b00000001);
} // if of j tail loop

{
fx = _mm256_add_pd(fx,_mm256_shuffle_pd(fx,fx,0b1111));
fx = _mm256_add_pd(fx,_mm256_castpd128_pd256(_mm256_extractf128_pd(fx,1)));
((double*)&force[i+0].fx)[0] = (((double*)&force[i+0].fx)[0]+fx[0]);
}

{
fy = _mm256_add_pd(fy,_mm256_shuffle_pd(fy,fy,0b1111));
fy = _mm256_add_pd(fy,_mm256_castpd128_pd256(_mm256_extractf128_pd(fy,1)));
((double*)&force[i+0].fy)[0] = (((double*)&force[i+0].fy)[0]+fy[0]);
}

{
fz = _mm256_add_pd(fz,_mm256_shuffle_pd(fz,fz,0b1111));
fz = _mm256_add_pd(fz,_mm256_castpd128_pd256(_mm256_extractf128_pd(fz,1)));
((double*)&force[i+0].fz)[0] = (((double*)&force[i+0].fz)[0]+fz[0]);
}

{
p = _mm256_add_pd(p,_mm256_shuffle_pd(p,p,0b1111));
p = _mm256_add_pd(p,_mm256_castpd128_pd256(_mm256_extractf128_pd(p,1)));
((double*)&force[i+0].p)[0] = (((double*)&force[i+0].p)[0]+p[0]);
}

} // loop of i
{ // tail loop of reference 
for(;i < ni;++i){
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

PIKG::F64 r2_inv;

PIKG::F64 __fkg_tmp2;

PIKG::F64 r2_inv3;

PIKG::F64 r2_inv6;

PIKG::F64 __fkg_tmp5;

PIKG::F64 __fkg_tmp4;

PIKG::F64 __fkg_tmp3;

PIKG::F64 f;

PIKG::F64 __fkg_tmp6;

PIKG::F64 __fkg_tmp7;

dx = (rix-rjx);
dy = (riy-rjy);
dz = (riz-rjz);
__fkg_tmp1 = (dx*dx+eps2);
__fkg_tmp0 = (dy*dy+__fkg_tmp1);
r2 = (dz*dz+__fkg_tmp0);
r2_inv = (1.0/sqrt(r2));
__fkg_tmp2 = (r2_inv*r2_inv);
r2_inv3 = (__fkg_tmp2*r2_inv);
r2_inv6 = (r2_inv3*r2_inv3);
__fkg_tmp5 = (48.0*r2_inv6-24.0);
__fkg_tmp4 = (__fkg_tmp5*r2_inv3);
__fkg_tmp3 = (__fkg_tmp4*r2_inv);
f = (__fkg_tmp3*r2_inv);
fx = (f*dx+fx);
fy = (f*dy+fy);
fz = (f*dz+fz);
__fkg_tmp6 = (4.0*r2_inv6);
__fkg_tmp7 = (r2_inv6-1.0);
p = (__fkg_tmp6*__fkg_tmp7+p);
} // loop of j

force[i+0].fx = (force[i+0].fx+fx);
force[i+0].fy = (force[i+0].fy+fy);
force[i+0].fz = (force[i+0].fz+fz);
force[i+0].p = (force[i+0].p+p);
} // loop of i
} // end loop of reference 
} // Kernel_I1_J4 definition 
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
__m256 rsqrt(__m256 op){
  return _mm256_rsqrt_ps(op);
}
__m256 sqrt(__m256 op){ return _mm256_sqrt_ps(op); }
__m256 inv(__m256 op){
return _mm256_rcp_ps(op);
}
__m256d rsqrt(__m256d op){
  __m256d y = _mm256_castsi256_pd(_mm256_sub_epi64(_mm256_set1_epi64x(0x5fe6eb50c7b537a9LL),_mm256_srlv_epi64(_mm256_castpd_si256(op),_mm256_set1_epi64x(1))));
  __m256d h = _mm256_mul_pd(op,y);
  h = _mm256_fnmadd_pd(h,y,_mm256_set1_pd(1.0));
  __m256d poly = _mm256_fmadd_pd(h,_mm256_set1_pd(0.375),_mm256_set1_pd(0.5));
  poly = _mm256_mul_pd(poly,h);
  y = _mm256_fmadd_pd(y,poly,y);
  return y;
}__m256d sqrt(__m256d op){
  return _mm256_sqrt_pd(op);
}__m256d inv(__m256d op){
  __m256 x = _mm256_castps128_ps256(_mm256_cvtpd_ps(op));
  x = inv(x);
  return _mm256_cvtps_pd(_mm256_castps256_ps128(x));
}__m256d max(__m256d a,__m256d b){ return _mm256_max_pd(a,b);}
__m256d min(__m256d a,__m256d b){ return _mm256_min_pd(a,b);}
__m256  max(__m256  a,__m256  b){ return _mm256_max_ps(a,b);}
__m256  min(__m256  a,__m256  b){ return _mm256_min_ps(a,b);}
__m256i max(__m256i a,__m256i b){ return _mm256_max_epi32(a,b);}
__m256i min(__m256i a,__m256i b){ return _mm256_min_epi32(a,b);}
__m256d table(__m256d tab,__m256i index){ return _mm256_permutexvar_pd(index,tab);}
__m256  table(__m256  tab,__m256i index){ return _mm256_permutexvar_ps(index,tab);}
__m256  to_float(__m256i op){ return _mm256_cvtepi32_ps(op);}
__m256i  to_int(__m256  op){ return _mm256_cvtps_epi32(op);}
void transpose2x2_pd(__m256d& a, __m256d& b){
  __m256d tmp = _mm256_unpacklo_pd(a,b);
  b = _mm256_unpackhi_pd(a,b);
  a = tmp;
}
void transpose4x4_pd(__m256d& a, __m256d& b,__m256d& c,__m256d& d){
  __m256d tmp0 = _mm256_unpacklo_pd(a, b);
  __m256d tmp1 = _mm256_unpackhi_pd(a, b);
  __m256d tmp2 = _mm256_unpacklo_pd(c, d);
  __m256d tmp3 = _mm256_unpackhi_pd(c, d);
  a = _mm256_permute2f128_pd(tmp0, tmp2, 0|(2<<4));
  b = _mm256_permute2f128_pd(tmp1, tmp3, 0|(2<<4));
  c = _mm256_permute2f128_pd(tmp0, tmp2, 1|(3<<4));
  d = _mm256_permute2f128_pd(tmp1, tmp3, 1|(3<<4));
}
void unpack2x2_pd(__m256d& a,__m256d& b){
  transpose2x2_pd(a,b);
}
void pack2x2_pd(__m256d& a,__m256d& b){
  transpose2x2_pd(a,b);
}
void unpack4x4_pd(__m256d& a,__m256d& b,__m256d& c,__m256d& d){
  transpose4x4_pd(a,b,c,d);
}
void pack4x4_pd(__m256d& a,__m256d& b,__m256d& c,__m256d& d){
  transpose4x4_pd(a,b,c,d);
}
void unpack2x2_ps(__m256& a, __m256& b){
  __m256 tmp = _mm256_shuffle_ps(a,b,0xdd);
  b = _mm256_shuffle_ps(a,b,0x88);
  a = tmp;
}
void pack2x2_ps(__m256& a, __m256& b){
  __m256 tmp = _mm256_unpackhi_ps(a,b);
  b = _mm256_unpacklo_ps(a,b);
  a = tmp;
}
void gather4_ps(__m256& a, __m256& b,__m256& c,__m256& d){
  __m256 src0 = _mm256_permute2f128_ps(a,c,0x20); // x0 y0 z0 w0 x4 y4 z4 w4
  __m256 src1 = _mm256_permute2f128_ps(a,c,0x31); // x1 y1 z1 w1 x5 y5 z5 w5
  __m256 src2 = _mm256_permute2f128_ps(b,d,0x20);
  __m256 src3 = _mm256_permute2f128_ps(b,d,0x31);
  __m256d tmp0 = _mm256_castps_pd(_mm256_unpacklo_ps(src0, src1)); // x0 x2 y0 y2 x1 y1 x3 y3
  __m256d tmp1 = _mm256_castps_pd(_mm256_unpackhi_ps(src0, src1)); // z0 z2 w0 w2 z1 w1 z3 w3
  __m256d tmp2 = _mm256_castps_pd(_mm256_unpacklo_ps(src2, src3)); // x4 x6 y4 y6 x5 x7 y5 y7
  __m256d tmp3 = _mm256_castps_pd(_mm256_unpackhi_ps(src2, src3)); // z4 z6 w4 w6 z5 z7 w5 w7
  a = _mm256_castpd_ps(_mm256_unpacklo_pd(tmp0, tmp2)); // x0 x2 x4 x6 x1 x3 x5 x7
  b = _mm256_castpd_ps(_mm256_unpackhi_pd(tmp0, tmp2)); // y0 y2 y4 y6 y1 y3 y5 y7
  c = _mm256_castpd_ps(_mm256_unpacklo_pd(tmp1, tmp3)); // z0 z2 z4 z6 z1 z3 z5 z7
  d = _mm256_castpd_ps(_mm256_unpackhi_pd(tmp1, tmp3)); // w0 w2 w4 w6 w1 w3 w5 w7
}
void scatter4_ps(__m256& a, __m256& b,__m256& c,__m256& d){
  __m256d tmp0 = _mm256_castps_pd(_mm256_unpacklo_ps(a, b)); // x0 x2 y0 y2 x1 y1 x3 y3
  __m256d tmp1 = _mm256_castps_pd(_mm256_unpackhi_ps(a, b)); // z0 z2 w0 w2 z1 w1 z3 w3
  __m256d tmp2 = _mm256_castps_pd(_mm256_unpacklo_ps(c, d)); // x4 x6 y4 y6 x5 x7 y5 y7
  __m256d tmp3 = _mm256_castps_pd(_mm256_unpackhi_ps(c, d)); // z4 z6 w4 w6 z5 z7 w5 w7
  __m256 dst0 = _mm256_castpd_ps(_mm256_unpacklo_pd(tmp0, tmp2)); // x0 x2 x4 x6 x1 x3 x5 x7
  __m256 dst1 = _mm256_castpd_ps(_mm256_unpackhi_pd(tmp0, tmp2)); // y0 y2 y4 y6 y1 y3 y5 y7
  __m256 dst2 = _mm256_castpd_ps(_mm256_unpacklo_pd(tmp1, tmp3)); // z0 z2 z4 z6 z1 z3 z5 z7
  __m256 dst3 = _mm256_castpd_ps(_mm256_unpackhi_pd(tmp1, tmp3)); // w0 w2 w4 w6 w1 w3 w5 w7
  a = _mm256_permute2f128_ps(dst0,dst1,0x20);
  b = _mm256_permute2f128_ps(dst2,dst3,0x20);
  c = _mm256_permute2f128_ps(dst0,dst1,0x31);
  d = _mm256_permute2f128_ps(dst2,dst3,0x31);
}
void unpack4x4_ps(__m256& a, __m256& b,__m256& c,__m256& d){
  gather4_ps(a,b,c,d);
}
void pack4x4_ps(__m256& a, __m256& b,__m256& c,__m256& d){
  scatter4_ps(a,b,c,d);
}
void unpack4x4_ps(__m256x4& v){
  unpack4x4_ps(v.v0,v.v1,v.v2,v.v3);
}
void pack4x4_ps(__m256x4& v){
  unpack4x4_ps(v.v0,v.v1,v.v2,v.v3);
}
void unpack4x4_pd(__m256dx4& v){
  unpack4x4_pd(v.v0,v.v1,v.v2,v.v3);
}
void pack4x4_pd(__m256dx4& v){
  unpack4x4_pd(v.v0,v.v1,v.v2,v.v3);
}
void print_ps(const __m256 v){ for(int i=0;i<8;i++) printf(" %f",v[i]); printf("\n");}
void print_ps(const __m256x4 v){
  print_ps(v.v0);
  print_ps(v.v1);
  print_ps(v.v2);
  print_ps(v.v3);
}
};// kernel functor definition 
