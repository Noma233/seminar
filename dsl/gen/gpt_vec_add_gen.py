from sympy import *
from sympy.codegen.ast import (Variable, Pointer, real, CodeBlock, Declaration,
                               FunctionDefinition,
                               For, FunctionCall)

i, n = symbols('i n', integer=True)
a, b, c = map(lambda x: Pointer(x, real), 'abc')
a = Pointer('a', )

va, vb, vc = map(lambda x: Variable(x, real, aligned=32), 'va vb vc'.split())
mm256_load_pd = FunctionCall('_mm256_load_pd', [])
mm256_store_pd = FunctionCall('_mm256_store_pd', [])

func_body = CodeBlock(
    Declaration(Variable(i, integer=True)),
    For(Eq(i, 0), i < n, i + 4, CodeBlock(
        Declaration(va, mm256_load_pd(FunctionCall('PointerAddress', [a, i]))),
        Declaration(vb, mm256_load_pd(FunctionCall('PointerAddress', [b, i]))),
        Declaration(vc, va +vb),
        mm256_store_pd(FunctionCall('PointerAddress', [c, i]), vc),
    ))
)

vec_add = FunctionDefinition(
    return_type=Variable('void'),
    name='vec_add',
    arguments=[Declaration(a, value=Variable('double[]')),
               Declaration(b, value=Variable('double[]')),
               Declaration(c, value=Variable('double[]')),
               Declaration(n, value=Variable('int'))],
    body=func_body
)

print(ccode(vec_add, standard='C99'))
