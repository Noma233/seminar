from sympy import *
x, y, z = symbols('x y z')
init_printing(use_unicode=True)

#sin(x)**2 + cos(x)**2 の計算
print(simplifiy(sin(x)**2 + cos(x)**2)) #を計算して1を返す

#割り算の簡略化
print(simplify((x**3 + x**2 - x - 1)/(x**2 + 2*x + 1)))# x-1を出力する

#因数分解
print(simplify(x**2 + 2*x + 1)) #この場合、因数分解されずそのままx**2 + 2*x + 1が出力される

print(factor(x**2 + 2*x + 1)) #因数分解をするための関数としてfactor()が用意されてる

#式の展開
print(expand((x + 1)**2)) # x**2 + 2*x + 1

#同類項でまとめる
expr = x*y + x - 3 + 2*x**2 - z*x**2 + x**3
print(expr)
collected_expr = collect(expr, x) #x**n(n 3~0) についてそれぞれまとめる
print(collected_expr)  # x**3 + x**2(2 - z) + x*(y + 1) - 3


#分数の約分等の簡略化
print(cancel((x**2 + 2*x + 1)/(x**2 + x))) #結果(x + 1) / x


