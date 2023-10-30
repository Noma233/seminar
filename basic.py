from sympy import *

x, y, z = symbols('x y z') # symbolを定義する。

expr = x + x - 1 #上で定義した変数は数学の計算の時のように扱える
print(simplify(expr)) # 結果は2x -1


expr = x ** 2 + 1 
print(expr.subs(x, 2)) #x=2を代入

#xをyに代入してyに2を代入することもできる
expr = x ** 2 + y + 1
print(expr.subs(x, y).subs(y, 2)) #結果は7

#因数分解等の複雑な単純化はそれぞれ固有の関数が提供されてる
expr = x ** 2 - 1
print(simplify(expr)) # x**2 - 1 がそのまま出力される
print(factor(expr)) #結果は (x - 1) * (x + 1) 



