from sympy import *
from sympy.codegen.ast import (CodeBlock, For, Variable, Declaration, FunctionDefinition,
                                Assignment, FunctionCall, String, IntBaseType,
                               FunctionPrototype, integer,Return)
from sympy.core.numbers import Integer
import Var
# SIMD = 'AVX2'
SIMD = None

MUL_FUNCTION_NAME = 'mul_pd'
ADD_FUNCTION_NAME = 'add_pd'
SUB_FUNCTION_NAME = 'sub_pd'
POW_FUNCTION_NAME = 'pow_pd'
DIV_FUNCTION_NAME = 'div_pd'
SQRT_FUNCTION_NAME = 'sqrt_pd'

REGISTER = 'm256'
#テスト用
x, y, z = symbols('x, y, z')

#式をsympyに適応させる
def expr_part(var_col):
    left_exp, right_exp = tuple(map(lambda x: sympify(x, evaluate=False), var_col.split('='))) 
    return Assignment(left_exp, right_exp)

#source code から構文木(sympyのシンボルに変換),変数と型の対応の表を作る
def Parse(file_str):

    file_list = file_str.split('\n')
    expr_list = []
    name_variable_map = {}

    #ファイルから読み取ったコードを一行ずつ
    for col in file_list:
        
        #＝演算子があれば、式なので、その時、sympyの式に変換
        if col.find('=') != -1:
            expr_list.append(expr_part(col))
        
        else:
            #空白等の式や変数宣言でない部分の処理を書く
            
            #変数宣言だった場合型の情報をVariableから取得
            v = Var.Variable(col)
            name_variable_map[v.name] = v

    return expr_list, name_variable_map

def inv_op(arg, func_name, inv_func_name):
    
    if type(arg) is Symbol or arg is Integer(-1):
        return arg, None

    if str(arg.name) == func_name and Integer(-1) in arg.function_args:
        ret = list(filter(lambda x: x is not Integer(-1), arg.function_args))
        return ret[0], inv_func_name
    else:
        return arg, None


def add_pattern(left_arg, right_arg):
    if SIMD:
        #SIMD演算
        left_arg, func_name1 = inv_op(left_arg, MUL_FUNCTION_NAME, SUB_FUNCTION_NAME)
        right_arg, func_name2 = inv_op(right_arg,MUL_FUNCTION_NAME, SUB_FUNCTION_NAME)
        if func_name1 == SUB_FUNCTION_NAME or func_name2 == SUB_FUNCTION_NAME:
            return FunctionCall(SUB_FUNCTION_NAME, [left_arg, right_arg])
        else:
            return FunctionCall(ADD_FUNCTION_NAME, [left_arg, right_arg])
    else:
        return Add(left_arg, right_arg, evaluate=False)

def mul_pattern(left_arg, right_arg):
    if SIMD:
        left_arg, func_name1 = inv_op(left_arg, POW_FUNCTION_NAME, DIV_FUNCTION_NAME)
        right_arg, func_name2 = inv_op(right_arg, POW_FUNCTION_NAME, DIV_FUNCTION_NAME)
        if func_name1 == DIV_FUNCTION_NAME or func_name2 == DIV_FUNCTION_NAME:
            return FunctionCall(DIV_FUNCTION_NAME, [left_arg, right_arg])
        else:
            return FunctionCall(MUL_FUNCTION_NAME, [left_arg, right_arg])
        
    else:
        return Mul(left_arg, right_arg)
    
def sqrt_op(left_arg, right_arg):
    
    if left_arg is Rational(1, 2) or right_arg is Rational(1, 2):
        ret = list(filter(lambda x: x is not Rational(1, 2), [left_arg, right_arg]))
        return ret[0]
    else:
        return None
    
def or_Integer(left_arg, right_arg):
    num = None
    expr = None

    if type(left_arg) is Integer:
        num = left_arg
        expr = right_arg
    elif type(right_arg) is Integer:
        num = right_arg
        expr = left_arg

    if num:
        new_expr = FunctionCall(MUL_FUNCTION_NAME, [expr, expr])
        for i in range(num - 2):
            new_expr = FunctionCall(MUL_FUNCTION_NAME, [expr, new_expr])
        return new_expr
    else:
        return None


def pow_pattern(left_arg, right_arg):

    if SIMD:
        arg = sqrt_op(left_arg, right_arg)
        if arg:
            return FunctionCall(SQRT_FUNCTION_NAME, [arg])
        else:
            #片方だけが整数だった場合
            new_expr = or_Integer(left_arg, right_arg)

            #べき乗の数だけ掛け算に変換
            if new_expr:
                return new_expr
            else:
                #TODO 整数ではなく、変数**変数の場合　とりあえず保留
                return FunctionCall(POW_FUNCTION_NAME, [left_arg, right_arg])
    else:
        return Pow(left_arg, right_arg)

def trans_mid_expr(arg, name_variable_map, i):

    if str(arg) in name_variable_map:

        ret = arg
        v = name_variable_map[str(arg)]
        if v.vec != 1:
            ret = Symbol(f'{str(arg)}.v{i}')
        return ret
    elif arg is Integer(-1) or arg is Rational(1, 2) or type(arg) is Integer:
        return arg
    
    elif type(arg) is Add:
        return add_pattern(trans_mid_expr(arg.args[0], name_variable_map, i), 
                            trans_mid_expr(arg.args[1], name_variable_map, i))
    #TODO 他の演算　掛け算とか割り算とか
    
    elif type(arg) is Mul:
        return mul_pattern(trans_mid_expr(arg.args[0], name_variable_map, i),
                            trans_mid_expr(arg.args[1], name_variable_map, i))
    
    elif type(arg) is Pow:
        return pow_pattern(trans_mid_expr(arg.args[0], name_variable_map, i),
                            trans_mid_expr(arg.args[1], name_variable_map, i))

    elif type(arg) is Assignment:
        return Assignment(trans_mid_expr(arg.lhs, name_variable_map, i),
                            trans_mid_expr(arg.rhs, name_variable_map, i))
    else:
        print('!!!!!! error!!!!! at trans_mid_expr ', arg)
        return

def __m256d(vec):
    return Symbol("__m256d " + vec.name)

def avx2_load(v):
    
    return

def load_part(struct_name, name_variable_map):
    
    load_lst = []
    for v in name_variable_map.values():
        if v.struct_name == struct_name:
            if SIMD == 'AVX2':
                load_lst.append(avx2_load(v))


    return load_lst

def avx2_store(v):

    return 

def store_part(struct_name, name_variable_map):
    store_lst = []
    for v in name_variable_map.values():
        if v.struct_name == struct_name:
            if SIMD == 'AVX2':
                store_lst.append(avx2_store(v))

    return

def loop_wide(name_variable_map):

    for v in name_variable_map.values():
        if v.struct_name == 'EPI':
            if SIMD == 'AVX2':
                if v.bit == 64:
                    return 4
                elif v.bit == 32:
                    return 8
    return None


def CodeGen(expr_list, name_variable_map, prim_map):

    #式を計算する部分のリスト
    assign_list = []
    #カーネル関数の引数を表すためのリスト
    arg_symbol_list = []

    iloop_load_list = []
    jloop_load_list = []
    

    for v in name_variable_map.values():
        if v.name in prim_map:
            continue        

        sym_name = v.name
        if v.struct_name != '':
            sym_name += '[]'
        
        if v.vec != 1:
            sym_name += f'[{v.vec}]'

        if v.type_name == 'F':
            arg_symbol_list.append(Symbol(sym_name, real=True))

    #TODO 一次変数の定義 型がSIMD命令が行えるように変数を定義できるようにする

    for expr in expr_list:
        prim_var = name_variable_map[str(expr.lhs)]
        for i in range(prim_var.vec):
            assign_list.append(trans_mid_expr(expr, name_variable_map, i))

    loop_inner = CodeBlock(*assign_list)
    iwide = loop_wide(name_variable_map)
    iloop_load_list = load_part('EPI', name_variable_map)
    jloop_load_list = load_part('EPJ', name_variable_map)


    i, j, n = symbols('i, j n', integer=True)
    loop_code = For(j, Range(0, n, 1), loop_inner)
    loop_code2 = For(i, Range(0, n, iwide), CodeBlock(loop_code))
 
    int_i = Variable(i, type=IntBaseType(String('integer')))
    int_j = Variable(j, type=IntBaseType(String('integer')))

    func_body = CodeBlock(
            Declaration(int_i),
            Declaration(int_j),
            loop_code2,
            Return(0)
        )
    
    fp = FunctionPrototype(integer, 'kernel', arg_symbol_list)
    fd = FunctionDefinition.from_FunctionPrototype(fp, [func_body])
    print(ccode(fd))
    return

def inv_pattern(expr):

    op_inverse_list = [(Mul, Integer(-1)), (Pow, Integer(-1)), (Pow, Rational(1, 2))]
    
    for op, inverse in op_inverse_list:
        if type(expr) is op and inverse in expr.args:
            return inverse

    return None

#完全二分木に変換
def new_bitree(expr):
    op = type(expr)
    if len(expr.args) >= 3:

        tmp = None
        for a in expr.args:
            if a is Integer(-1) or a is Rational(1, 2):
                continue
            else:
                new_expr = new_bitree(a)
                if tmp == None:
                    tmp = new_expr
                else:
                    tmp = op(tmp, new_expr, evaluate=False)

        # 逆数またはsqrtを行えるようにする
        # ここの処理で、引き算の場合なら、Addの直下にInteger(-1)を持つMulが来るようにする
        inverse = inv_pattern(expr)
        if inverse:
            tmp = op(inverse, tmp, evaluate=False)        
        return tmp
    
    elif len(expr.args) == 2:
        left_expr = new_bitree(expr.args[0])
        right_expr = new_bitree(expr.args[1])
        if op is Assignment:
            return op(left_expr, right_expr)
        else:
            return op(left_expr, right_expr, evaluate=False)
    elif type(expr) is Symbol or type(expr) is Integer or expr is Rational(1, 2) or expr is Integer(-1):
        return expr
    
    else:
        print('!!!!!!error!!!!!!! at new_bitree ', 'arg is ', expr)

#構文木から完全二分木を取得
def expr_binary_tree(expr_list):

    new_expr_list = []
    for expr in expr_list:
        new_expr_list.append(new_bitree(expr))

    return new_expr_list

#一次変数の型推論
def type_inference(expr_list, name_variable_map):

    prim_map = {}

    operator_list = [Add, Mul, Pow]

    for expr in expr_list:
        prim_var = Var.Variable()
        prim_var.name = str(expr.lhs)
        
        # print(name_variable_map)
        for arg in preorder_traversal(expr.rhs):

            if str(arg) in name_variable_map:
                v = name_variable_map[str(arg)]
                if v.type_name == 'F':
                    prim_var.type_name = 'F'

                if prim_var.bit < v.bit:
                    prim_var.bit = v.bit

                if prim_var.vec < v.vec:
                    prim_var.vec = v.vec
            elif type(arg) in operator_list or arg is Integer(-1) or arg is Rational(1, 2) or type(arg) is Integer:
                continue
                
            else:
                #エラー
                print('error', arg)
                return 

        prim_map[str(expr.lhs)] = prim_var
        name_variable_map[str(expr.lhs)] = prim_var

    return prim_map

def main():
    expr_list = []
    name_variable_map = {}


    with open('rij.pykg', 'r', encoding='utf-8') as f:
        s = f.read()
        expr_list, name_variable_map = Parse(s)

    # print('name_variable_map check')
    # for i in name_variable_map:
    #     print(i)

    #構文木を完全2分木にする処理
    biexpr_list = expr_binary_tree(expr_list)
    
    #expr_binary_treeのテスト用
    # check_new_bitree(biexpr_list)

    #型推論　それから一次変数の型を決定
    prim_map = type_inference(biexpr_list, name_variable_map)

    # check_name_table(name_variable_map)
    #type_inferenceのテスト用
    # check_type_infer(prim_map)


    CodeGen(biexpr_list, name_variable_map, prim_map)
    

    #チェック用
    return biexpr_list, name_variable_map

#完全二分木に変換する処理のチェック
def check_new_bitree(expr_list):

    print('this is check bitree')
    for expr in expr_list:
        for arg in expr.rhs.args: 
            if len(arg.args) >= 3:
                print('incorrect', 'expr = ', expr)
                return
                
    print('correct\n')
    return 

def check_name_table(name_table):
    for i in name_table:
        print(i)
    return

#型推論のチェック
def check_type_infer(prim_map):

    # print('prim_map')
    # for i in prim_map:
    #         print(i)
    print(prim_map)

    if 'rij' in prim_map:
        new_var = prim_map['rij']
        print(new_var)
        # print('type inference is correct')
    else:
        print('type inference is incorrect')
    return

if __name__ == "__main__":

    expr_list, type_map = main()

x,y,z = symbols('x y z')

expr = x + (x * y * -z)
