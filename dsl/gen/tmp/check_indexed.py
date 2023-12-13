from sympy import *
init_printing(use_unicode=True)
from sympy.abc import a, e, k, n, r, t, x, y, z, T, Z
from sympy.abc import beta, omega, tau
from sympy.codegen.ast import (CodeBlock, For, Variable, Declaration, FunctionDefinition,
                                Assignment, FunctionCall, String, IntBaseType,
                               FunctionPrototype, integer,Return) 
f, g = symbols('f, g', cls=Function)

len_y = 5
mat_1 = IndexedBase('mat_1', shape=(len_y,))
mat_2 = IndexedBase('mat_2', shape=(len_y,))
Dy = IndexedBase('Dy', shape=(len_y-1,))
i = Idx('i', len_y-1)
eq = Assignment(Dy[i], (mat_1[i+1] - mat_1[i]) / (mat_2[i+1] - mat_2[i]))
print(ccode(eq))