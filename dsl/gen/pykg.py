from sympy import *
from sympy.codegen.ast import (CodeBlock, For, Variable, Declaration, FunctionDefinition,
                                Assignment, FunctionCall, String, IntBaseType,
                               FunctionPrototype, integer,Return)
from sympy.core.numbers import Integer
import Var
SIMD = 'AVX2'
# SIMD = None
from sympy.codegen.ast import float64

#TODO 関数名
MUL_FUNCTION_NAME = '_mm256_mul_pd'
ADD_FUNCTION_NAME = '_mm256_add_pd'
SUB_FUNCTION_NAME = '_mm256_sub_pd'
POW_FUNCTION_NAME = '_mm256_pow_pd'
DIV_FUNCTION_NAME = '_mm256_div_pd'
SQRT_FUNCTION_NAME = '_mm256_sqrt_pd'

REGISTER = 'm256'
iwide = 1
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
    try:
        if str(arg.name) == func_name and Integer(-1) in arg.function_args:
            ret = list(filter(lambda x: x is not Integer(-1), arg.function_args))
            return ret[0], inv_func_name
    except AttributeError:
        print(arg)
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
        new_expr = expr
        for i in range(num - 1):
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

        v = name_variable_map[str(arg)]
        ret = Symbol(v.get_tmp_name(i))
        if v.vec != 1:
            ret = Symbol(v.get_tmp_name(i))
        # elif str(arg) in prim_map:
        return ret
    elif arg is Integer(-1) or arg is Rational(1, 2) or type(arg) is Integer:
        return arg
    
    elif type(arg) is Add:
        return add_pattern(trans_mid_expr(arg.args[0], name_variable_map, i), 
                            trans_mid_expr(arg.args[1], name_variable_map, i))
    
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


vindex_count = 0
def col_adr_vindex(vec_size):
    code_list = []
    global vindex_count
    index_name = f'index_gather_{vindex_count}'
    index_type = 'int'
    # print('iwide is ', iwide)
    index_num = '{0'
    for i in range(iwide):
        if i == 0:
            continue
        index_num += f', {i * vec_size}'

    index_num += '}'

    code_list.append(index_type + ' ' + index_name + f'[{iwide}]' + ' = ' + index_num)
    vindex_name = f'vindex_gather_{vindex_count}'
    code_list.append(f'__m128i {vindex_name} = _mm_load_si128((const __m128i*){index_name})')

    vindex_count += 1
    return code_list, vindex_name

def EPI_load(v, i):
    var_name = f'&{v.name}[i]'
    tmp_name = v.get_tmp_name(i)

    if v.bit == 32:
        type_name = 'ps'
        type_byte = 4
    
    elif v.bit == 64:
        type_name = 'pd'
        type_byte = 8
    else:
        pass
    
    if v.vec != 1:
        var_name += f'[{i}]'
        function_name = '_mm256_i32gather_'
        code_list, vindex_name = col_adr_vindex(v.vec)
        
        load_expr = Assignment(Symbol(tmp_name), FunctionCall(function_name + type_name, [Symbol(var_name), Symbol(vindex_name), type_byte]))
        return CodeBlock(*code_list, load_expr)
    else:
        function_name = '_mm256_load_'
        tmp_name = v.name + "_tmp"
        return Assignment(Symbol(tmp_name), FunctionCall(function_name + type_name, [Symbol(var_name)]))


#TODO 単精度少数の場合も
def avx2_load(v, i):
    var_name = v.name
    tmp_name = v.get_tmp_name(i)
    
    if v.struct_name == 'EPI':
        return EPI_load(v, i)

    elif v.struct_name == 'EPJ':
        var_name += '[j]'
        function_name = '_mm256_set1_'
    else:
        function_name = '_mm256_set1_'

    if v.vec != 1:
        var_name += f'[{i}]'

    if v.type_name == 'F':
        if v.bit == 32:
            return
        elif v.bit == 64:
            
            return Assignment(Symbol(tmp_name),
                    FunctionCall(function_name + 'pd', [Symbol(var_name)]))

    return

def load_part(struct_name, name_variable_map):
    
    load_lst = []
    for v in name_variable_map.values():
        for i in range(v.vec):
            if v.struct_name == struct_name:
                if SIMD == 'AVX2':
                    load_lst.append(avx2_load(v, i))
                elif SIMD == 'AVX512':
                    #TODO 
                    print('not imprement')

    return CodeBlock(*load_lst)

#TODO 単精度少数の場合も
def avx2_store(v, i):
    tmp_vec_name = v.get_tmp_name(i)

    if v.type_name == 'F':
        if v.bit == 32:
            type_name = 'ps'
        elif v.bit == 64:
            type_name = 'pd'

    else: 
        type_name = ''

    code_list = []
    
    if v.vec != 1:
        for ii in range(iwide):
            if ii == 0: 
                inc = ''
            else:
                inc = f' + {ii}'
            code_list.append(Assignment(Symbol(f'{v.name}[i{inc}][{i}]'), 
                                        Symbol(tmp_vec_name + f'[{ii}]')))
    else:
        code_list.append(FunctionCall('_mm256_store_' + type_name, 
                            [Symbol(f'&{v.name}[i]'), Symbol(v.tmp_name + tmp_vec_name)]))
 
    return CodeBlock(*code_list)

def store_part(name_variable_map):
    store_lst = []

    for v in name_variable_map.values():
        if v.struct_name == 'FORCE':
            for i in range(v.vec):
                if SIMD == 'AVX2':
                    store_lst.append(avx2_store(v, i))
                elif SIMD == 'AVX512':
                    #TODO 
                    return
                else:
                    pass
            
    return CodeBlock(*store_lst)

def loop_wide(name_variable_map):

    for v in name_variable_map.values():
        if v.struct_name == 'EPI':
            if SIMD == 'AVX2':
                if v.bit == 64:
                    return 4
                elif v.bit == 32:
                    return 8
            elif SIMD == 'AVX512':
                #TODO 
                return 
    return None

def declear_tmp_var(name_variable_map):

    dec_list = []

    for v in name_variable_map.values():
        #TODO 名前のない変数が存在してる
        if v.name == '':
            continue
        for i in range(v.vec):
                
            if SIMD == 'AVX2':
                tmp_var = v.get_tmp_name(i)
                if v.struct_name != '':
                    tmp_var = v.get_tmp_name(i)
                
                type_ = '__m256'
                if v.bit == 64:
                    type_  += 'd'
                elif v.bit == 32:
                    type_ += ''                    
                
                if tmp_var == '':
                    #debag
                    print(v)


                dec_list.append(Declaration(Variable(Symbol(tmp_var), type=type_)))

            elif SIMD == 'AVX512':
                #TODO 
                return
            else:
                
                if v.struct_name == '':
                    tmp_var = v.get_tmp_name(i)
                    tmp_type = v.get_type()
                    dec_list.append(Declaration(Variable(Symbol(tmp_var), type=tmp_type)))

                else:
                    continue
    return CodeBlock(*dec_list)

def get_include_text():
    text = "#include<math.h>\n"
    if SIMD == 'AVX2':
        text += "#include<x86intrin.h>"
    return text


def CodeGen(expr_list, name_variable_map, prim_map):

    file_name = 'check_gravity_code.cpp'

    #式を計算する部分のリスト
    assign_list = []
    #カーネル関数の引数を表すためのリスト
    arg_symbol_list = [Symbol('n', integer=True)]

    iloop_load = None
    jloop_load = None
    tmp_def = None
    result_store = None

    #引数の作成
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


    global iwide
    iwide = loop_wide(name_variable_map)
    tmp_def = declear_tmp_var(name_variable_map)
    iloop_load = load_part('EPI', name_variable_map)
    jloop_load = load_part('EPJ', name_variable_map)
    result_store = store_part(name_variable_map)
    include_text = get_include_text()


    for expr in expr_list:
        prim_var = name_variable_map[str(expr.lhs)]
        for i in range(prim_var.vec):
            assign_list.append(trans_mid_expr(expr, name_variable_map, i))

    loop_inner = CodeBlock(*assign_list)

    i, j, n = symbols('i, j n', integer=True)
    loop_code = For(j, Range(0, n, 1), CodeBlock(jloop_load, loop_inner))
    loop_code2 = For(i, Range(0, n, iwide), CodeBlock(iloop_load,loop_code, result_store))
 
    int_i = Variable(i, type=IntBaseType(String('integer')))
    int_j = Variable(j, type=IntBaseType(String('integer')))

    func_body = CodeBlock(
            Declaration(int_i),
            Declaration(int_j),
            tmp_def,
            loop_code2,
            Return(0)
        )
    
    fp = FunctionPrototype(integer, 'kernel', arg_symbol_list)
    fd = FunctionDefinition.from_FunctionPrototype(fp, [func_body])
    fd_h = CodeBlock(include_text, fd)
    return ccode(fd_h)

def inv_pattern(expr):

    op_inverse_list = [(Mul, Integer(-1)), (Pow, Integer(-1))]

    for op, inverse in op_inverse_list:
        if type(expr) is op and inverse in expr.args:
            return inverse

    return None

def rational_pattern(expr):
    frac, inv = expr.as_content_primitive()
    return inv, Rational(1, 2), frac.p
    
#完全二分木に変換
def new_bitree(expr):
    op = type(expr)
    print("new_bitree expr = ", srepr(expr))
    if len(expr.args) >= 3:

        tmp = None
        for a in expr.args:
            if a is Integer(-1):
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
        
        #TODO 1/x乗 みたいな場合はまだ
        elif op is Pow:
            pow_expr = None
            if type(left_expr) is not Rational and type(right_expr) is not Rational:
                return Pow(left_expr, right_expr)
            
            else:
                if type(right_expr) is Rational:
                    r = right_expr
                    x = left_expr
                elif type(left_expr) is Rational:
                    r = left_expr
                    x = right_expr
                
                
                pow_expr = Pow(x, Rational(1, 2))
                
                frac, inv = r.as_content_primitive()
                if frac.p != 1:
                    print('frac.p is ', frac.p)
                    pow_expr = Pow(pow_expr, frac.p, evaluate=False)
        
                if inv == -1:
                    pow_expr = Pow(pow_expr, Integer(-1), evaluate=False)
                print('pow pattern', srepr(pow_expr))
                return pow_expr
        else:
            return op(left_expr, right_expr, evaluate=False)

    elif type(expr) is Symbol or type(expr) is Integer or type(expr) is Rational or expr is Integer(-1):
        return expr    
    else:
        print('!!!!!!error!!!!!!! at new_bitree ', 'arg is ', expr)

#構文木から完全二分木を取得
def expr_binary_tree(expr_list):
    # if SIMD == None:
    #     return expr_list
    new_expr_list = []
    for expr in expr_list:
        new_expr_list.append(new_bitree(expr))

    return new_expr_list


#一次変数の型推論
def type_inference(expr_list, name_variable_map):

    prim_map = {}

    operator_list = [Add, Mul, Pow]

    for expr in expr_list:
        if str(expr.lhs) in name_variable_map:
            continue
        prim_var = Var.Variable()
        prim_var.name = str(expr.lhs)
        prim_var.tmp_name = str(expr.lhs)
        
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

def apply_cse(expr_list):
    cse_list = cse(expr_list)
    
    pre_culc = cse_list[0]
    new_list = []
    for expr in pre_culc:
        new_list.append(Assignment(expr[0], expr[1]))
    new_list += cse_list[1]
    return new_list


def main():
    expr_list = []
    name_variable_map = {}


    with open('rij.pykg', 'r', encoding='utf-8') as f:
        s = f.read()
        expr_list, name_variable_map = Parse(s)
    
    # print('name_variable_map check')
    # for i in name_variable_map.values():
    #     print(i)

    
    after_cse_expr_list = apply_cse(expr_list)

    #構文木を完全2分木にする処理
    biexpr_list = expr_binary_tree(after_cse_expr_list)


    # expr_binary_treeのテスト用
    # check_new_bitree(biexpr_list)

    #型推論　それから一次変数の型を決定
    prim_map = type_inference(biexpr_list, name_variable_map)

    # check_name_table(name_variable_map)
    #type_inferenceのテスト用
    # check_type_infer(prim_map) 

    # 木構造のチェック
    check_tree(biexpr_list)

    s = CodeGen(biexpr_list, name_variable_map, prim_map)

    file_name = 'gravity_code'
    with open(f'{file_name}.hpp','w', encoding='utf-8') as f:
        f.write(s) 
    f.close()
    #チェック用
    return biexpr_list, name_variable_map


def check_tree(expr_list):
    for expr in expr_list:
        # print(dotprint(expr))
        print(srepr(expr))

    return

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

# x, y, z, a, b, c, d, e, f, g = symbols('x y z a b c d e f g')

# expr1 = Assignment(a, (x + y + z) * (z + y + b))
# expr2 = Assignment(c, (y + z + b) * (z + a + b))

# expr_list = [expr1, expr2]
# new_list = apply_cse(expr_list)
# print(new_list)

