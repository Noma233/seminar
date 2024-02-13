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
static_assert(sizeof(EPI) == 48,"check consistency of EPI member variable definition between PIKG source and original source");
static_assert(sizeof(EPJ) == 64,"check consistency of EPJ member variable definition between PIKG source and original source");
static_assert(sizeof(FORCE) == 48,"check consistency of FORCE member variable definition between PIKG source and original source");
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
__m256dx3 ri;
alignas(32) int index_gather_load0[4] = {0,6,12,18};
__m128i vindex_gather_load0 = _mm_load_si128((const __m128i*)index_gather_load0);
ri.v0 = _mm256_i32gather_pd(((double*)&epi[i+0].r.x),vindex_gather_load0,8);
alignas(32) int index_gather_load1[4] = {0,6,12,18};
__m128i vindex_gather_load1 = _mm_load_si128((const __m128i*)index_gather_load1);
ri.v1 = _mm256_i32gather_pd(((double*)&epi[i+0].r.y),vindex_gather_load1,8);
alignas(32) int index_gather_load2[4] = {0,6,12,18};
__m128i vindex_gather_load2 = _mm_load_si128((const __m128i*)index_gather_load2);
ri.v2 = _mm256_i32gather_pd(((double*)&epi[i+0].r.z),vindex_gather_load2,8);
__m256dx3 vi;
alignas(32) int index_gather_load3[4] = {0,6,12,18};
__m128i vindex_gather_load3 = _mm_load_si128((const __m128i*)index_gather_load3);
vi.v0 = _mm256_i32gather_pd(((double*)&epi[i+0].v.x),vindex_gather_load3,8);
alignas(32) int index_gather_load4[4] = {0,6,12,18};
__m128i vindex_gather_load4 = _mm_load_si128((const __m128i*)index_gather_load4);
vi.v1 = _mm256_i32gather_pd(((double*)&epi[i+0].v.y),vindex_gather_load4,8);
alignas(32) int index_gather_load5[4] = {0,6,12,18};
__m128i vindex_gather_load5 = _mm_load_si128((const __m128i*)index_gather_load5);
vi.v2 = _mm256_i32gather_pd(((double*)&epi[i+0].v.z),vindex_gather_load5,8);
__m256dx3 F;
F.v0 = _mm256_set1_pd(0.0);
F.v1 = _mm256_set1_pd(0.0);
F.v2 = _mm256_set1_pd(0.0);
__m256dx3 J;
J.v0 = _mm256_set1_pd(0.0);
J.v1 = _mm256_set1_pd(0.0);
J.v2 = _mm256_set1_pd(0.0);
for(j = 0;j < (nj/1)*1;++j){
__m256d eps2;
eps2 = _mm256_set1_pd(epj[j].eps);
__m256d mj;
mj = _mm256_set1_pd(epj[j].m);

__m256dx3 rj;

rj.v0 = _mm256_set1_pd(epj[j].r.x);

rj.v1 = _mm256_set1_pd(epj[j].r.y);

rj.v2 = _mm256_set1_pd(epj[j].r.z);

__m256dx3 vj;

vj.v0 = _mm256_set1_pd(epj[j].v.x);

vj.v1 = _mm256_set1_pd(epj[j].v.y);

vj.v2 = _mm256_set1_pd(epj[j].v.z);

__m256dx3 dr;

__m256dx3 dv;

__m256d __fkg_tmp1;

__m256d __fkg_tmp0;

__m256d r2;

__m256d r1i;

__m256d r2i;

__m256d r3i;

__m256d r5i;

__m256d __fkg_tmp3;

__m256d __fkg_tmp2;

__m256d rv;

__m256d af;

__m256d __fkg_tmp5;

__m256d __fkg_tmp4;

__m256d jf;

__m256d __fkg_tmp6;

__m256d __fkg_tmp7;

__m256d __fkg_tmp8;

dr.v0 = _mm256_sub_pd(ri.v0,rj.v0);
dr.v1 = _mm256_sub_pd(ri.v1,rj.v1);
dr.v2 = _mm256_sub_pd(ri.v2,rj.v2);
dv.v0 = _mm256_sub_pd(vi.v0,vj.v0);
dv.v1 = _mm256_sub_pd(vi.v1,vj.v1);
dv.v2 = _mm256_sub_pd(vi.v2,vj.v2);
__fkg_tmp1 = _mm256_fmadd_pd(dr.v0,dr.v0,eps2);
__fkg_tmp0 = _mm256_fmadd_pd(dr.v1,dr.v1,__fkg_tmp1);
r2 = _mm256_fmadd_pd(dr.v2,dr.v2,__fkg_tmp0);
r1i = _mm256_div_pd(_mm256_set1_pd(1.0),sqrt(r2));
r2i = _mm256_mul_pd(r1i,r1i);
r3i = _mm256_mul_pd(r2i,r1i);
r5i = _mm256_mul_pd(r3i,r2i);
__fkg_tmp3 = _mm256_mul_pd(dr.v1,dv.v1);
__fkg_tmp2 = _mm256_fmadd_pd(dr.v0,dv.v0,__fkg_tmp3);
rv = _mm256_fmadd_pd(dr.v2,dv.v2,__fkg_tmp2);
af = _mm256_mul_pd(mj,r3i);
__fkg_tmp5 = _mm256_mul_pd(_mm256_set1_pd(3.0),mj);
__fkg_tmp4 = _mm256_mul_pd(__fkg_tmp5,rv);
jf = _mm256_mul_pd(__fkg_tmp4,r5i);
F.v0 = _mm256_fmadd_pd(af,dr.v0,F.v0);
F.v1 = _mm256_fmadd_pd(af,dr.v1,F.v1);
F.v2 = _mm256_fmadd_pd(af,dr.v2,F.v2);
__fkg_tmp6 = _mm256_fmadd_pd(af,dv.v0,J.v0);
J.v0 = _mm256_fnmadd_pd(jf,dr.v0,__fkg_tmp6);
__fkg_tmp7 = _mm256_fmadd_pd(af,dv.v1,J.v1);
J.v1 = _mm256_fnmadd_pd(jf,dr.v1,__fkg_tmp7);
__fkg_tmp8 = _mm256_fmadd_pd(af,dv.v2,J.v2);
J.v2 = _mm256_fnmadd_pd(jf,dr.v2,__fkg_tmp8);
} // loop of j

{
__m256d __fkg_tmp_accum;
alignas(32) int index_gather_load6[4] = {0,6,12,18};
__m128i vindex_gather_load6 = _mm_load_si128((const __m128i*)index_gather_load6);
__fkg_tmp_accum = _mm256_i32gather_pd(((double*)&force[i+0].f.x),vindex_gather_load6,8);
__fkg_tmp_accum = _mm256_add_pd(__fkg_tmp_accum,F.v0);
{
PIKG::F64 __fkg_store_tmp[4];
_mm256_storeu_pd(__fkg_store_tmp,__fkg_tmp_accum);
((double*)&force[i+0].f.x)[0] = __fkg_store_tmp[0];
((double*)&force[i+0].f.x)[6] = __fkg_store_tmp[1];
((double*)&force[i+0].f.x)[12] = __fkg_store_tmp[2];
((double*)&force[i+0].f.x)[18] = __fkg_store_tmp[3];
}
}

{
__m256d __fkg_tmp_accum;
alignas(32) int index_gather_load7[4] = {0,6,12,18};
__m128i vindex_gather_load7 = _mm_load_si128((const __m128i*)index_gather_load7);
__fkg_tmp_accum = _mm256_i32gather_pd(((double*)&force[i+0].f.y),vindex_gather_load7,8);
__fkg_tmp_accum = _mm256_add_pd(__fkg_tmp_accum,F.v1);
{
PIKG::F64 __fkg_store_tmp[4];
_mm256_storeu_pd(__fkg_store_tmp,__fkg_tmp_accum);
((double*)&force[i+0].f.y)[0] = __fkg_store_tmp[0];
((double*)&force[i+0].f.y)[6] = __fkg_store_tmp[1];
((double*)&force[i+0].f.y)[12] = __fkg_store_tmp[2];
((double*)&force[i+0].f.y)[18] = __fkg_store_tmp[3];
}
}

{
__m256d __fkg_tmp_accum;
alignas(32) int index_gather_load8[4] = {0,6,12,18};
__m128i vindex_gather_load8 = _mm_load_si128((const __m128i*)index_gather_load8);
__fkg_tmp_accum = _mm256_i32gather_pd(((double*)&force[i+0].f.z),vindex_gather_load8,8);
__fkg_tmp_accum = _mm256_add_pd(__fkg_tmp_accum,F.v2);
{
PIKG::F64 __fkg_store_tmp[4];
_mm256_storeu_pd(__fkg_store_tmp,__fkg_tmp_accum);
((double*)&force[i+0].f.z)[0] = __fkg_store_tmp[0];
((double*)&force[i+0].f.z)[6] = __fkg_store_tmp[1];
((double*)&force[i+0].f.z)[12] = __fkg_store_tmp[2];
((double*)&force[i+0].f.z)[18] = __fkg_store_tmp[3];
}
}

{
__m256d __fkg_tmp_accum;
alignas(32) int index_gather_load9[4] = {0,6,12,18};
__m128i vindex_gather_load9 = _mm_load_si128((const __m128i*)index_gather_load9);
__fkg_tmp_accum = _mm256_i32gather_pd(((double*)&force[i+0].j.x),vindex_gather_load9,8);
__fkg_tmp_accum = _mm256_add_pd(__fkg_tmp_accum,J.v0);
{
PIKG::F64 __fkg_store_tmp[4];
_mm256_storeu_pd(__fkg_store_tmp,__fkg_tmp_accum);
((double*)&force[i+0].j.x)[0] = __fkg_store_tmp[0];
((double*)&force[i+0].j.x)[6] = __fkg_store_tmp[1];
((double*)&force[i+0].j.x)[12] = __fkg_store_tmp[2];
((double*)&force[i+0].j.x)[18] = __fkg_store_tmp[3];
}
}

{
__m256d __fkg_tmp_accum;
alignas(32) int index_gather_load10[4] = {0,6,12,18};
__m128i vindex_gather_load10 = _mm_load_si128((const __m128i*)index_gather_load10);
__fkg_tmp_accum = _mm256_i32gather_pd(((double*)&force[i+0].j.y),vindex_gather_load10,8);
__fkg_tmp_accum = _mm256_add_pd(__fkg_tmp_accum,J.v1);
{
PIKG::F64 __fkg_store_tmp[4];
_mm256_storeu_pd(__fkg_store_tmp,__fkg_tmp_accum);
((double*)&force[i+0].j.y)[0] = __fkg_store_tmp[0];
((double*)&force[i+0].j.y)[6] = __fkg_store_tmp[1];
((double*)&force[i+0].j.y)[12] = __fkg_store_tmp[2];
((double*)&force[i+0].j.y)[18] = __fkg_store_tmp[3];
}
}

{
__m256d __fkg_tmp_accum;
alignas(32) int index_gather_load11[4] = {0,6,12,18};
__m128i vindex_gather_load11 = _mm_load_si128((const __m128i*)index_gather_load11);
__fkg_tmp_accum = _mm256_i32gather_pd(((double*)&force[i+0].j.z),vindex_gather_load11,8);
__fkg_tmp_accum = _mm256_add_pd(__fkg_tmp_accum,J.v2);
{
PIKG::F64 __fkg_store_tmp[4];
_mm256_storeu_pd(__fkg_store_tmp,__fkg_tmp_accum);
((double*)&force[i+0].j.z)[0] = __fkg_store_tmp[0];
((double*)&force[i+0].j.z)[6] = __fkg_store_tmp[1];
((double*)&force[i+0].j.z)[12] = __fkg_store_tmp[2];
((double*)&force[i+0].j.z)[18] = __fkg_store_tmp[3];
}
}

} // loop of i
{ // tail loop of reference 
for(;i < ni;++i){
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
} // end loop of reference 
} // Kernel_I4_J1 definition 
void Kernel_I1_J4(const EPI* __restrict__ epi,const PIKG::S32 ni,const EPJ* __restrict__ epj,const PIKG::S32 nj,FORCE* __restrict__ force){
PIKG::S32 i;
PIKG::S32 j;
printf("test PIKG\n");
for(i = 0;i < (ni/1)*1;++i){
__m256dx3 ri;

ri.v0 = _mm256_set1_pd(epi[i+0].r.x);

ri.v1 = _mm256_set1_pd(epi[i+0].r.y);

ri.v2 = _mm256_set1_pd(epi[i+0].r.z);

__m256dx3 vi;

vi.v0 = _mm256_set1_pd(epi[i+0].v.x);

vi.v1 = _mm256_set1_pd(epi[i+0].v.y);

vi.v2 = _mm256_set1_pd(epi[i+0].v.z);

__m256dx3 F;

F.v0 = _mm256_set1_pd(0.0);
F.v1 = _mm256_set1_pd(0.0);
F.v2 = _mm256_set1_pd(0.0);
__m256dx3 J;

J.v0 = _mm256_set1_pd(0.0);
J.v1 = _mm256_set1_pd(0.0);
J.v2 = _mm256_set1_pd(0.0);
for(j = 0;j < (nj/4)*4;j += 4){
__m256d eps2;

alignas(32) int index_gather_load12[4] = {0,8,16,24};
__m128i vindex_gather_load12 = _mm_load_si128((const __m128i*)index_gather_load12);
eps2 = _mm256_i32gather_pd(((double*)&epj[j].eps),vindex_gather_load12,8);
__m256d mj;

alignas(32) int index_gather_load13[4] = {0,8,16,24};
__m128i vindex_gather_load13 = _mm_load_si128((const __m128i*)index_gather_load13);
mj = _mm256_i32gather_pd(((double*)&epj[j].m),vindex_gather_load13,8);
__m256dx3 rj;

alignas(32) int index_gather_load14[4] = {0,8,16,24};
__m128i vindex_gather_load14 = _mm_load_si128((const __m128i*)index_gather_load14);
rj.v0 = _mm256_i32gather_pd(((double*)&epj[j].r.x),vindex_gather_load14,8);
alignas(32) int index_gather_load15[4] = {0,8,16,24};
__m128i vindex_gather_load15 = _mm_load_si128((const __m128i*)index_gather_load15);
rj.v1 = _mm256_i32gather_pd(((double*)&epj[j].r.y),vindex_gather_load15,8);
alignas(32) int index_gather_load16[4] = {0,8,16,24};
__m128i vindex_gather_load16 = _mm_load_si128((const __m128i*)index_gather_load16);
rj.v2 = _mm256_i32gather_pd(((double*)&epj[j].r.z),vindex_gather_load16,8);
__m256dx3 vj;

alignas(32) int index_gather_load17[4] = {0,8,16,24};
__m128i vindex_gather_load17 = _mm_load_si128((const __m128i*)index_gather_load17);
vj.v0 = _mm256_i32gather_pd(((double*)&epj[j].v.x),vindex_gather_load17,8);
alignas(32) int index_gather_load18[4] = {0,8,16,24};
__m128i vindex_gather_load18 = _mm_load_si128((const __m128i*)index_gather_load18);
vj.v1 = _mm256_i32gather_pd(((double*)&epj[j].v.y),vindex_gather_load18,8);
alignas(32) int index_gather_load19[4] = {0,8,16,24};
__m128i vindex_gather_load19 = _mm_load_si128((const __m128i*)index_gather_load19);
vj.v2 = _mm256_i32gather_pd(((double*)&epj[j].v.z),vindex_gather_load19,8);
__m256dx3 dr;

__m256dx3 dv;

__m256d __fkg_tmp1;

__m256d __fkg_tmp0;

__m256d r2;

__m256d r1i;

__m256d r2i;

__m256d r3i;

__m256d r5i;

__m256d __fkg_tmp3;

__m256d __fkg_tmp2;

__m256d rv;

__m256d af;

__m256d __fkg_tmp5;

__m256d __fkg_tmp4;

__m256d jf;

__m256d __fkg_tmp6;

__m256d __fkg_tmp7;

__m256d __fkg_tmp8;

dr.v0 = _mm256_sub_pd(ri.v0,rj.v0);
dr.v1 = _mm256_sub_pd(ri.v1,rj.v1);
dr.v2 = _mm256_sub_pd(ri.v2,rj.v2);
dv.v0 = _mm256_sub_pd(vi.v0,vj.v0);
dv.v1 = _mm256_sub_pd(vi.v1,vj.v1);
dv.v2 = _mm256_sub_pd(vi.v2,vj.v2);
__fkg_tmp1 = _mm256_fmadd_pd(dr.v0,dr.v0,eps2);
__fkg_tmp0 = _mm256_fmadd_pd(dr.v1,dr.v1,__fkg_tmp1);
r2 = _mm256_fmadd_pd(dr.v2,dr.v2,__fkg_tmp0);
r1i = _mm256_div_pd(_mm256_set1_pd(1.0),sqrt(r2));
r2i = _mm256_mul_pd(r1i,r1i);
r3i = _mm256_mul_pd(r2i,r1i);
r5i = _mm256_mul_pd(r3i,r2i);
__fkg_tmp3 = _mm256_mul_pd(dr.v1,dv.v1);
__fkg_tmp2 = _mm256_fmadd_pd(dr.v0,dv.v0,__fkg_tmp3);
rv = _mm256_fmadd_pd(dr.v2,dv.v2,__fkg_tmp2);
af = _mm256_mul_pd(mj,r3i);
__fkg_tmp5 = _mm256_mul_pd(_mm256_set1_pd(3.0),mj);
__fkg_tmp4 = _mm256_mul_pd(__fkg_tmp5,rv);
jf = _mm256_mul_pd(__fkg_tmp4,r5i);
F.v0 = _mm256_fmadd_pd(af,dr.v0,F.v0);
F.v1 = _mm256_fmadd_pd(af,dr.v1,F.v1);
F.v2 = _mm256_fmadd_pd(af,dr.v2,F.v2);
__fkg_tmp6 = _mm256_fmadd_pd(af,dv.v0,J.v0);
J.v0 = _mm256_fnmadd_pd(jf,dr.v0,__fkg_tmp6);
__fkg_tmp7 = _mm256_fmadd_pd(af,dv.v1,J.v1);
J.v1 = _mm256_fnmadd_pd(jf,dr.v1,__fkg_tmp7);
__fkg_tmp8 = _mm256_fmadd_pd(af,dv.v2,J.v2);
J.v2 = _mm256_fnmadd_pd(jf,dr.v2,__fkg_tmp8);
} // loop of j

if(j<nj){ // tail j loop
__m256dx3 __fkg_tmp9;

__fkg_tmp9.v0 = F.v0;
__fkg_tmp9.v1 = F.v1;
__fkg_tmp9.v2 = F.v2;
__m256dx3 __fkg_tmp10;

__fkg_tmp10.v0 = J.v0;
__fkg_tmp10.v1 = J.v1;
__fkg_tmp10.v2 = J.v2;
for(;j < nj;++j){
__m256d eps2;

eps2 = _mm256_set1_pd(epj[j].eps);

__m256d mj;

mj = _mm256_set1_pd(epj[j].m);

__m256dx3 rj;

rj.v0 = _mm256_set1_pd(epj[j].r.x);

rj.v1 = _mm256_set1_pd(epj[j].r.y);

rj.v2 = _mm256_set1_pd(epj[j].r.z);

__m256dx3 vj;

vj.v0 = _mm256_set1_pd(epj[j].v.x);

vj.v1 = _mm256_set1_pd(epj[j].v.y);

vj.v2 = _mm256_set1_pd(epj[j].v.z);

__m256dx3 dr;

__m256dx3 dv;

__m256d __fkg_tmp1;

__m256d __fkg_tmp0;

__m256d r2;

__m256d r1i;

__m256d r2i;

__m256d r3i;

__m256d r5i;

__m256d __fkg_tmp3;

__m256d __fkg_tmp2;

__m256d rv;

__m256d af;

__m256d __fkg_tmp5;

__m256d __fkg_tmp4;

__m256d jf;

__m256d __fkg_tmp6;

__m256d __fkg_tmp7;

__m256d __fkg_tmp8;

dr.v0 = _mm256_sub_pd(ri.v0,rj.v0);
dr.v1 = _mm256_sub_pd(ri.v1,rj.v1);
dr.v2 = _mm256_sub_pd(ri.v2,rj.v2);
dv.v0 = _mm256_sub_pd(vi.v0,vj.v0);
dv.v1 = _mm256_sub_pd(vi.v1,vj.v1);
dv.v2 = _mm256_sub_pd(vi.v2,vj.v2);
__fkg_tmp1 = _mm256_fmadd_pd(dr.v0,dr.v0,eps2);
__fkg_tmp0 = _mm256_fmadd_pd(dr.v1,dr.v1,__fkg_tmp1);
r2 = _mm256_fmadd_pd(dr.v2,dr.v2,__fkg_tmp0);
r1i = _mm256_div_pd(_mm256_set1_pd(1.0),sqrt(r2));
r2i = _mm256_mul_pd(r1i,r1i);
r3i = _mm256_mul_pd(r2i,r1i);
r5i = _mm256_mul_pd(r3i,r2i);
__fkg_tmp3 = _mm256_mul_pd(dr.v1,dv.v1);
__fkg_tmp2 = _mm256_fmadd_pd(dr.v0,dv.v0,__fkg_tmp3);
rv = _mm256_fmadd_pd(dr.v2,dv.v2,__fkg_tmp2);
af = _mm256_mul_pd(mj,r3i);
__fkg_tmp5 = _mm256_mul_pd(_mm256_set1_pd(3.0),mj);
__fkg_tmp4 = _mm256_mul_pd(__fkg_tmp5,rv);
jf = _mm256_mul_pd(__fkg_tmp4,r5i);
F.v0 = _mm256_fmadd_pd(af,dr.v0,F.v0);
F.v1 = _mm256_fmadd_pd(af,dr.v1,F.v1);
F.v2 = _mm256_fmadd_pd(af,dr.v2,F.v2);
__fkg_tmp6 = _mm256_fmadd_pd(af,dv.v0,J.v0);
J.v0 = _mm256_fnmadd_pd(jf,dr.v0,__fkg_tmp6);
__fkg_tmp7 = _mm256_fmadd_pd(af,dv.v1,J.v1);
J.v1 = _mm256_fnmadd_pd(jf,dr.v1,__fkg_tmp7);
__fkg_tmp8 = _mm256_fmadd_pd(af,dv.v2,J.v2);
J.v2 = _mm256_fnmadd_pd(jf,dr.v2,__fkg_tmp8);
} // loop of j
F.v0 = _mm256_blend_pd(__fkg_tmp9.v0,F.v0,0b00000001);
F.v1 = _mm256_blend_pd(__fkg_tmp9.v1,F.v1,0b00000001);
F.v2 = _mm256_blend_pd(__fkg_tmp9.v2,F.v2,0b00000001);
J.v0 = _mm256_blend_pd(__fkg_tmp10.v0,J.v0,0b00000001);
J.v1 = _mm256_blend_pd(__fkg_tmp10.v1,J.v1,0b00000001);
J.v2 = _mm256_blend_pd(__fkg_tmp10.v2,J.v2,0b00000001);
} // if of j tail loop

{
F.v0 = _mm256_add_pd(F.v0,_mm256_shuffle_pd(F.v0,F.v0,0b1111));
F.v0 = _mm256_add_pd(F.v0,_mm256_castpd128_pd256(_mm256_extractf128_pd(F.v0,1)));
((double*)&force[i+0].f.x)[0] = (((double*)&force[i+0].f.x)[0]+F.v0[0]);
}

{
F.v1 = _mm256_add_pd(F.v1,_mm256_shuffle_pd(F.v1,F.v1,0b1111));
F.v1 = _mm256_add_pd(F.v1,_mm256_castpd128_pd256(_mm256_extractf128_pd(F.v1,1)));
((double*)&force[i+0].f.y)[0] = (((double*)&force[i+0].f.y)[0]+F.v1[0]);
}

{
F.v2 = _mm256_add_pd(F.v2,_mm256_shuffle_pd(F.v2,F.v2,0b1111));
F.v2 = _mm256_add_pd(F.v2,_mm256_castpd128_pd256(_mm256_extractf128_pd(F.v2,1)));
((double*)&force[i+0].f.z)[0] = (((double*)&force[i+0].f.z)[0]+F.v2[0]);
}

{
J.v0 = _mm256_add_pd(J.v0,_mm256_shuffle_pd(J.v0,J.v0,0b1111));
J.v0 = _mm256_add_pd(J.v0,_mm256_castpd128_pd256(_mm256_extractf128_pd(J.v0,1)));
((double*)&force[i+0].j.x)[0] = (((double*)&force[i+0].j.x)[0]+J.v0[0]);
}

{
J.v1 = _mm256_add_pd(J.v1,_mm256_shuffle_pd(J.v1,J.v1,0b1111));
J.v1 = _mm256_add_pd(J.v1,_mm256_castpd128_pd256(_mm256_extractf128_pd(J.v1,1)));
((double*)&force[i+0].j.y)[0] = (((double*)&force[i+0].j.y)[0]+J.v1[0]);
}

{
J.v2 = _mm256_add_pd(J.v2,_mm256_shuffle_pd(J.v2,J.v2,0b1111));
J.v2 = _mm256_add_pd(J.v2,_mm256_castpd128_pd256(_mm256_extractf128_pd(J.v2,1)));
((double*)&force[i+0].j.z)[0] = (((double*)&force[i+0].j.z)[0]+J.v2[0]);
}

} // loop of i
{ // tail loop of reference 
for(;i < ni;++i){
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
