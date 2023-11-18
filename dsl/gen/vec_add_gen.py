from sympy import *
from sympy.codegen.ast import (CodeBlock, For, Variable, Declaration, FunctionDefinition,
                                Assignment, FunctionCall, String, IntBaseType,
                               FunctionPrototype, integer,Return) 

def __m256d(vec):
    return Symbol("__m256d " + vec.name)

def load_m256d(vec, array_name):
    return Assignment(Symbol("__m256d " + vec.name), Symbol(f"_mm256_load_pd(&{array_name})"))

def __mm256_store_pd(point_name, vec):
    return FunctionCall('_mm256_store_pd', [String(f"&{point_name}"), vec.name])

i, n = symbols('i n', integer=True)

va, vb, vc= symbols('va vb vc')

loop_inner = CodeBlock(
    load_m256d(va, 'a[i]'),
    load_m256d(vb, 'b[i]'),
    Assignment(__m256d(vc), va + vb),
    __mm256_store_pd('c[i]', vc)
)

loop_code = For(i, Range(0, n, 4), loop_inner)

int_i = Variable(i, type=IntBaseType(String('integer')))

func_body = CodeBlock(
        Declaration(int_i),
        loop_code,
        Return(0)
)
a, b, c = symbols('a[] b[] c[]', real=True)
fp = FunctionPrototype(integer, 'vec_add', [a, b, c])
ccode(fp)
body = [func_body]
fd = FunctionDefinition.from_FunctionPrototype(fp, body)
print(ccode(fd))