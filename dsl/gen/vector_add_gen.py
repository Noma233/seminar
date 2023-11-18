#変数がベクトル化されていれば、文と変数定義を生成する．
from sympy import *
init_printing(use_unicode=True)
from sympy.abc import a, e, k, n, r, t, x, y, z, T, Z
from sympy.abc import beta, omega, tau
f, g = symbols('f, g', cls=Function)


len_n = 100
A = IndexedBase('A', shape=(len_n,))
B = IndexedBase('B', shape=(len_n,))
C = IndexedBase('C', shape=(len_n,))
i = Idx('i', len_n)

eq = Eq(A[i], B[i] + C[i])



code_vec = ccode(eq.rhs, assign_to=eq.lhs, contract=True)

print(code_vec)

