from sympy import *
from sympy.codegen.ast import (CodeBlock, For, Variable, Declaration, FunctionDefinition,
                                Assignment, FunctionCall, String, IntBaseType,
                               FunctionPrototype, integer,Return) 

def __m256d(vec):
    return Symbol("__m256d " + vec.name)

def load_m256d(vec, array_name):
    return Assignment(__m256d(vec.name), Symbol(f"_mm256_load_pd(&{array_name})"))

def _mm256_set1_pd(vec, point_name):
    return Assignment(__m256d(vec.name), FunctionCall('_mm256_set1_pd', [String(f'&{point_name}')]))

def __mm256_store_pd(point_name, vec):
    return FunctionCall('_mm256_store_pd', [String(f"&{point_name}"), vec.name])

def __mm256_sqrt_pd(vec):
    return FunctionCall("_mm256_sqrt_pd", [vec.name])


i, n = symbols('i n', integer=True)

j_element = symbols('j_element')
xjv, yjv, zjv, mjv= symbols('xjv yjv, zjv, mjv')
dxv, dyv, dzv = symbols('dxv')
xI, yI, zI = symbols('xI yI zI')
rv, rv_sq = symbols('rv rv_sq')

loop2_inner = CodeBlock(
    _mm256_set1_pd(xjv, 'j_element[j][0]'),
    _mm256_set1_pd(yjv, 'j_element[j][1]'),
    _mm256_set1_pd(zjv, 'j_element[j][2]'),
    _mm256_set1_pd(mjv, 'j_element[j][3]'),
    
    Assignment(__m256d(dxv), xjv - xI),
    Assignment(__m256d(dxv), xjv - yI),
    Assignment(__m256d(dxv), xjv - zI),
    Assignment(__m256d(rv), dxv * dxv + dyv * dyv + dzv * dzv),
    Assignment(__m256d(rv_sq), __mm256_sqrt_pd(rv)),
    Assignment(__m256d(rv_sq), __mm256_sqrt_pd(rv))

)



