from sympy import *
init_printing(use_unicode=True)
from sympy.abc import a, e, k, n, r, t, x, y, z, T, Z
from sympy.abc import beta, omega, tau
f, g = symbols('f, g', cls=Function)

len_y = 5
mat_1 = IndexedBase('mat_1', shape=(len_y,))
mat_2 = IndexedBase('mat_2', shape=(len_y,))
Dy = IndexedBase('Dy', shape=(len_y-1,))
i = Idx('i', len_y-1)
eq = Eq(Dy[i], (mat_1[i+1] - mat_1[i]) / (mat_2[i+1] - mat_2[i]))
print(jscode(eq.rhs, assign_to=eq.lhs, contract=False))
Res = IndexedBase('Res', shape=(len_y,))
j = Idx('j', len_y)
eq = Eq(Res[j], mat_1[j]*mat_2[j])
print(jscode(eq.rhs, assign_to=eq.lhs, contract=True))
print(jscode(eq.rhs, assign_to=eq.lhs, contract=False))
