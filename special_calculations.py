from sympy import *
x, y, z = symbols('x y z')
init_printing(use_unicode=True)

#微分
#数式とその数式の変数を渡す
print(diff(cos(x), x)) #-sin(x) が出力される

print(diff(x**4, x, x, x)) #24xが出力される
print(diff(x**4, x, 3)) #3回微分


#積分
#使い方は微分と同様ただ、積分定数は含まれない
#必要な場合は自分で加える等する
print(integrate(cos(x), x))

#定積分の場合は
#(integration_variable, lower_limit, upper_limit) のタプルで第二引数に渡す
print(integrate(exp(-x), (x, 0, oo))) 

#式を評価する前の状態を持てる
expr = Integral(log(x)**2, x) 
print(expr)
expr.doit() #式を評価　結果 


#極限
#xを0に近づける極限の結果が出力される
print(limit(sin(x)/x, x, 0)) #結果　1 

#積分と同様評価前の状態を持てる
expr = Limit((cos(x) - 1)/x, x, 0)
print(expr)
expr.doit()

print(limit(1/x, x, 0, '+')) #+側から近づける 結果はoo\


