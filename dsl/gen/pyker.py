from sympy import *
from sympy.codegen.ast import (CodeBlock, For, Variable, Declaration, FunctionDefinition,
                                Assignment, FunctionCall, String, IntBaseType,
                               FunctionPrototype, integer,Return)
from sympy.codegen.ast import aug_assign
from sympy.core.numbers import Integer

import Var
# SIMD = 'AVX2'
SIMD = None
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
            v = Var.Var(col)
            name_variable_map[v.name] = v

    return expr_list, name_variable_map

def inv_op(arg, func_name, inv_func_name):
    
    if type(arg) is Symbol or arg is Integer(-1) or type(arg) is Float:
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
        if func_name1 == SUB_FUNCTION_NAME:
            return FunctionCall(SUB_FUNCTION_NAME, [right_arg, left_arg])
        elif func_name2 == SUB_FUNCTION_NAME:
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
        # print(left_arg, right_arg)
        return Mul(left_arg, right_arg, evaluate=False)
    
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

def pow_to_mul(expr, num):
    new_expr = expr

    div_ = False
    if num < 0:
        div_ = True
    for i in range(num - 1):
        new_expr = Mul(new_expr, expr, evaluate=False)
    
    if div_:
        new_expr = Pow(new_expr, Integer(-1), evaluate=False)

    return new_expr

def pow_pattern(base_arg, exp_arg):
    arg = sqrt_op(base_arg, exp_arg)
    
    if SIMD:
        if arg:
            return FunctionCall(SQRT_FUNCTION_NAME, [arg])
        else:
            #片方だけが整数だった場合
            new_expr = or_Integer(base_arg, exp_arg)

            #べき乗の数だけ掛け算に変換
            if new_expr:
                return new_expr
            else:
                #TODO 整数ではなく、変数**変数の場合　とりあえず保留
                return FunctionCall(POW_FUNCTION_NAME, [base_arg, exp_arg])
    else:
        if type(exp_arg) is Integer: 
            new_expr = pow_to_mul(base_arg, int(exp_arg))
            print(f'in pow_pattern {base_arg}, {exp_arg}')
        elif type(exp_arg) is Rational:
            num = exp_arg.numerator
            deno = exp_arg.denominator
            if num == 1:
                new_expr = Pow(base_arg, exp_arg, evaluate=False)
            else:
                new_expr = pow_to_mul(base_arg, num)
                new_exp_arg = Rational(Integer(1), deno)
                new_expr = Pow(new_expr, new_exp_arg, evaluate=False)
            
            print(new_expr)
            
        else:
            new_expr = Pow(base_arg, exp_arg, evaluate=False)
        return new_expr

def get_func_name(expr):
    return str(expr.name)

def dot_pattern(left_args, right_args):

    mul_list = []
    for i in range(len(left_args)):
        mul_list.append(mul_pattern(left_args[i], right_args[i]))
    
    dot_expr = mul_list[0]
    for i in range(len(mul_list)):
        if i == 0:
            continue
        dot_expr = add_pattern(dot_expr, mul_list[i])
    
    return dot_expr

def sub_pattern(left_arg, right_arg):
    if SIMD:
        return FunctionCall(SUB_FUNCTION_NAME, [left_arg, right_arg])
    else:
        return Add(left_arg, Mul(Integer(-1), right_arg))


def trans_mid_expr(arg, name_variable_map, i):
    if str(arg) in name_variable_map:
        # v = name_variable_map[str(arg)]
        # return Symbol(v.name)
        v = name_variable_map[str(arg)]
        ret = Symbol(v.get_tmp_name(i))
        if v.vec != 1:
            ret = Symbol(v.get_tmp_name(i))
        # new_v = Var.Var(init_v=v)
        # new_v.vec_index = i
        # name_variable_map[str(ret)] = new_v
        # elif str(arg) in prim_map:
        return ret
    elif arg is Integer(-1) or arg is Rational(1, 2) or type(arg) is Integer or type(arg) is Float or type(arg) is Rational:
        return arg
    # elif type(arg) is Float:
    #     if SIMD:
    #         v = name_variable_map[str(arg)]
            
    #         return v
    
    elif type(arg) is Add:
        return add_pattern(trans_mid_expr(arg.args[0], name_variable_map, i), 
                            trans_mid_expr(arg.args[1], name_variable_map, i))

    elif type(arg) is Mul:
        return mul_pattern(trans_mid_expr(arg.args[0], name_variable_map, i),
                            trans_mid_expr(arg.args[1], name_variable_map, i))
    
    elif type(arg) is Pow:
        exp = arg.exp
        ba = arg.base
        base_expr = trans_mid_expr(ba, name_variable_map, i)
        new_exp_expr = trans_mid_expr(exp, name_variable_map, i)
        new_expr = pow_pattern(base_expr, new_exp_expr) 
        return new_expr

    elif type(arg) is Assignment:
        left_arg = arg.lhs
        left_v = get_name_variable(left_arg, name_variable_map)
        left_mid_expr = trans_mid_expr(arg.lhs, name_variable_map, i)
        right_mid_expr = trans_mid_expr(arg.rhs, name_variable_map, i)
        if left_v.struct_name == 'FORCE':
            mid_expr = aug_assign(left_mid_expr, '+', right_mid_expr)
        else:
            mid_expr = Assignment(left_mid_expr, right_mid_expr)
        return mid_expr
    elif type(arg) is FunctionCall:
        func_name = get_func_name(arg)
        if func_name == 'dot':
            args = get_expr_args(arg)
            left_exprs = []
            right_exprs = []
            for i in range(3):
                left_exprs.append(trans_mid_expr(args[0], name_variable_map, i))
                right_exprs.append(trans_mid_expr(args[1], name_variable_map, i))
            
            return dot_pattern(left_exprs, right_exprs)
            # return dot_pattern(trans_mid_expr())
        elif func_name == 'sub':
            left_arg = trans_mid_expr(arg.args[0], name_variable_map, i)
            right_arg = trans_mid_expr(arg.args[1], name_variable_map, i)
            return sub_pattern(left_arg, right_arg)
    else:
        print('!!!!!! error!!!!! at trans_mid_expr ', arg)
        print(type(arg))
        return


vindex_count = 0
def col_adr_vindex(vec_size):
    code_list = []
    global vindex_count
    index_name = f'index_gather_{vindex_count}'
    index_type = 'int'
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

def init_(tmp):
    return Assignment(Symbol(tmp), 
            FunctionCall('_mm256_set1_pd', [Symbol('0.0')]))

#TODO 単精度少数の場合も
def avx2_load(v, i):
    var_name = v.name
    tmp_name = v.get_tmp_name(i)
    
    if v.struct_name == 'EPI':
        return EPI_load(v, i)

    elif v.struct_name == 'EPJ':
        var_name += '[j]'
        function_name = '_mm256_set1_'
    elif v.struct_name == 'FORCE':
        return init_(tmp_name)
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

def nonsimd_load(v, i):
    
    return 

def load_part(struct_name, name_variable_map):
    
    load_lst = []
    for v in name_variable_map.values():
        # index = v.vec_index
        # if v.struct_name == struct_name:
            # if SIMD:
            #     load_lst.append(avx2_load(v, index))
        for i in range(v.vec):
            if v.struct_name == struct_name:
                if SIMD == 'AVX2':
                    load_lst.append(avx2_load(v, i))
                
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
            # index = v.vec_index
            # if SIMD:
            #     store_lst.append(avx2_store(v, index))
            for i in range(v.vec):
                # print(f'store {v.vec}')
                if SIMD == 'AVX2':
                    store_lst.append(avx2_store(v, i))
            
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

def in_prim_map(v, prim_map):
    if v.name in prim_map:
        return True
    else:
        return False


def declear_tmp_var(name_variable_map, prim_map):

    dec_list = []

    for v in name_variable_map.values():
        #TODO 名前のない変数が存在してる
        if v.name == '':
            continue
        # i = v.vec_index
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
                
                # if tmp_var == '':
                    #debag
                tmp = Variable(Symbol(tmp_var), type=type_)

                tmp_dec = Declaration(Variable(Symbol(tmp_var), type=type_))
                dec_list.append(tmp_dec)
                if type(v.symbol) is Float:
                    set_method = FunctionCall('_mm256_set1_pd', [v.symbol])
                    tmp_assi = Assignment(Symbol(tmp_var), set_method)
                    dec_list.append(tmp_assi)
                    # print(f'declear_tmp_var {tmp_assi}')
                
                if v.argument and v.struct_name == '':
                    tmp_dec = avx2_load(v,i)
                    dec_list.append(tmp_dec)
            elif SIMD == 'AVX512':
                #TODO 
                return
            else:
                
                if v.struct_name == '' and v.prime == True:
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


def assign_exprs(assign_list, name_variable_map, need_prim_map=False):
    cse_list = apply_cse(assign_list, name_variable_map)
    # print(cse_list)
    # cse_list = trans_pow_list(cse_list)
    # print(cse_list)
    prim_map = type_inference(cse_list, name_variable_map)
    if need_prim_map == True:
        return (cse_list, prim_map)
    else:
        return cse_list

def CodeGen(mid_code_list, name_variable_map, prim_map):



    # mid_code_list = []
    assign_list = []
    #カーネル関数の引数を表すためのリスト
    arg_symbol_list = [Symbol('n', integer=True)]

    iloop_load = None
    jloop_load = None
    tmp_def = None
    result_store = None

    #引数の作成
    for v in name_variable_map.values():
        # if v.prime == True or v.vec_index != 1:
        #     continue        
        if v.prime == True:
            continue

        sym_name = v.name
        if v.struct_name != '':
            sym_name += '[]'
        
        if v.vec != 1:
            sym_name += f'[{v.vec}]'

        if v.type_name == 'F':
            arg_symbol_list.append(Symbol(sym_name, real=True))

    # for expr in expr_list:
    #     prim_var = name_variable_map[str(expr.lhs)]
    #     for i in range(prim_var.vec):
    #         mid_expr = trans_mid_expr(expr, name_variable_map, i)
    #         mid_code_list.append(mid_expr)
    # if SIMD:
    #     mid_code_list, prim_map = assign_exprs(mid_code_list, name_variable_map, need_prim_map=True)
    assign_list = CodeBlock(*mid_code_list) 
    global iwide
    iwide = loop_wide(name_variable_map)
    tmp_def = declear_tmp_var(name_variable_map, prim_map)
    iloop_load = load_part('EPI', name_variable_map)
    force_init = load_part('FORCE', name_variable_map)
    jloop_load = load_part('EPJ', name_variable_map)
    result_store = store_part(name_variable_map)
    include_text = get_include_text()

    loop_inner = CodeBlock(*assign_list)
    # loop_inner = CodeBlock()
    i, j, n = symbols('i, j n', integer=True)
    loop_code = For(j, Range(0, n, 1), CodeBlock(jloop_load, loop_inner))
    loop_code2 = For(i, Range(0, n, iwide), CodeBlock(iloop_load,force_init,loop_code, result_store))
 
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
    
def expr_args_len(expr):
    if type(expr) is FunctionCall:
        return len(expr.function_args)
    elif not_op(expr) == False:
        return len(expr.args)
    else:
        print(f'!!error!! expr_args_len {expr}')
        return 0
    
def eval_func(op, left_expr, right_expr):
    if type(op) is FunctionCall:
        return op(left_expr, right_expr)

    
    
#完全二分木に変換
def new_bitree(expr):
    op = type(expr)

    if not_op(expr):
        return expr    
    elif expr_args_len(expr) >= 3:
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
    
    elif expr_args_len(expr) == 2:
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
                    pow_expr = Pow(pow_expr, frac.p, evaluate=False)
        
                if inv == -1:
                    pow_expr = Pow(pow_expr, Integer(-1), evaluate=False)
                return pow_expr
        elif type(expr) is FunctionCall:
            #関数名に合う式にする
            func_name = get_func_name(expr)
            func_arg_list = []
            for arg in get_expr_args(expr):
                func_arg_list.append(new_bitree(arg))
            return FunctionCall(func_name, func_arg_list)
        else:
            return op(left_expr, right_expr, evaluate=False)

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

def get_expr_args(expr):
    if type(expr) is FunctionCall:
        return expr.function_args
    elif not_op(expr) is False:
        return expr.args
    else:
        print(f'!! error !! at get_expr_args {expr}')
        return 0

def prim_vec(expr, arg_ret_map_list):
    arg_ret_map = arg_ret_map_list[expr.lhs] 
    return arg_ret_map[expr.rhs]


#一次変数の型推論
def type_inference(expr_list, name_variable_map,  get_arg_map=False):

    prim_map = {}
    new_arg_ret_map_list = {}
    

    operator_list = [Add, Mul, Pow, ADD_FUNCTION_NAME, SUB_FUNCTION_NAME, MUL_FUNCTION_NAME, SQRT_FUNCTION_NAME, POW_FUNCTION_NAME, FunctionCall]
    # function_name = []

    for expr in expr_list:
        if in_name_variable(expr.lhs, name_variable_map):
            v = get_name_variable(expr.lhs, name_variable_map)
            if v.prime == True:
                prim_map[str(expr.lhs)] = v
            continue

        prim_var = Var.Var()
        prim_var.name = str(expr.lhs)
        prim_var.tmp_name = str(expr.lhs)
        #TODO とりあえず全部浮動小数
        prim_var.type_name = 'F'
        #TODO とりあえず全部倍精度
        prim_var.bit = 64
        prim_var.prime = True
        
        arg_ret_map = get_arg_ret_map(expr.rhs, {}, name_variable_map)
        prim_var.vec = arg_ret_map[expr.rhs]
        new_arg_ret_map_list[expr.lhs] = arg_ret_map
            # for arg in preorder_traversal(expr.rhs):

            #     if str(arg) in name_variable_map:
            #         v = name_variable_map[str(arg)]
            #         if v.type_name == 'F':
            #             prim_var.type_name = 'F'

            #         if prim_var.bit < v.bit:
            #             prim_var.bit = v.bit

            #         if prim_var.vec < v.vec:
            #             prim_var.vec = v.vec
                
            #     else:
            #         continue
                # elif type(arg) in operator_list or arg is Integer(-1) or arg is Rational(1, 2) or type(arg) is Integer or type(arg) is Rational or type(arg) is Float:
                #     continue
                # elif str(arg) in operator_list:
                #     continue
                    
                # else:
                #     #エラー
                #     print('error!! in type_interference', arg)
                #     print(type(arg))
                #     # print(arg_ret_map_list)
                #     # print(expr_list)
                #     return 
        # if str(expr.lhs) == 'dr_v0':
        #     print(prim_var)
            
        prim_map[str(expr.lhs)] = prim_var
        name_variable_map[str(expr.lhs)] = prim_var

    if get_arg_map:
        return prim_map, new_arg_ret_map_list
    else:
        return prim_map

def find_arg(arg, expr):
    if arg == expr:
        return True
    elif not_op(expr) is False or type(expr) is FunctionCall:
        args = get_expr_args(expr)
        for e in args:
            if find_arg(arg, e):
                return True
        return False
    elif not_op(expr):
        return False
    else:
        print('error at find_arg')
        return False
    
def insert_new_cse_expr(new_cse_list, after_expr_list):
    new_expr_list = after_expr_list
    n = len(new_cse_list)
    for i in range(n):
        expr = new_cse_list[n - i - 1]
        new_v = expr.lhs
        flag = False
        print(f'insert_new_cse {expr}, new_v = {new_v}')
        for j in range(len(after_expr_list)):
            after_expr = after_expr_list[j]
            print(f'after_expr = {after_expr}') 
            if find_arg(new_v, after_expr.rhs):
                new_expr_list.insert(j, expr)
                flag = True
                break
        if flag:
            print('check') 
    return new_expr_list

def trans_pow_(arg):
    if not_op(arg):
        return arg
    elif type(arg) is Pow:
        new_arg_base = trans_pow_(arg.base)
        new_arg = pow_pattern(new_arg_base, arg.exp)
        return new_arg   
    elif type(arg) is Assignment:
        right_arg = trans_pow_(arg.rhs)
        return Assignment(arg.lhs, arg.rhs)
    else:
        new_expr = []
        if type(arg) is Add:
            return Add(*new_expr, evaluate=False)
        elif type(arg) is Mul:
            return Mul(*new_expr, evaluate=False)
        elif type(arg) is FunctionCall:
            func_name = get_func_name(arg)
            return FunctionCall(func_name, new_expr)

        else:
            print(f'!!eerorro!! in trans pow {arg}')
            return

def trans_pow_list(expr_list):
    new_expr_list = []
    for expr in expr_list:
        new_arg = trans_pow_(expr)
        new_expr_list.append(new_arg)
    return new_expr_list

def apply_cse(expr_list, name_variable_map):
    cse_list = cse(expr_list)
    pre_culc = cse_list[0]
    # print(f'in cse lst {cse_list}')
    new_list = []
    for expr in pre_culc:
        new_list.append(Assignment(expr[0], expr[1]))
        # tmp_v = expr[0]
        # for pre_expr in pre_culc:
        #     rhs_expr = pre_expr.rhs
        #     if tmp_v in rhs_expr.args:
                
        #ここに、pre_culcのなかに初めて一時変数が出てきたら、その直前に数式を挿入する処理を入れる
    new_cse_list = insert_new_cse_expr(new_list, cse_list[1])
    
    # print(new_cse_list)
    # new_list += cse_list[1]
    prim_map = type_inference(new_cse_list, name_variable_map, None)
    return new_cse_list

def op_type(expr):
    if type(expr) is type:
        return expr
    else:
        return type(expr) 

def not_op(expr):
    if op_type(expr) is Add or op_type(expr) is Mul or op_type(expr) is Pow or op_type(expr) is Assignment:
        return False
    elif op_type(expr) is type(aug_assign(Symbol('x'), '+', Symbol('y'))):
        return False
    else:
        return True

def ret_add(expr, arg_ret_map):
    vec = 0
    for arg in expr.args:

        arg_ret = arg_ret_map[arg]
        if vec < arg_ret:
            vec = arg_ret    
    return vec 

def ret_mul(expr, arg_ret_map):
    vec = 0
    vec_count = 0
    for arg in expr.args:
        arg_v = arg_ret_map[arg]
        if arg_v != 1:
            vec_count += 1
            vec = arg_v

    if vec_count == 1:
        return vec
    elif vec_count == 2:
        return 1
    elif vec_count == 0:
        return 1
    else:
        print('!!error!! at ret_mul')
        return 0    
    

def ret_pow(expr, arg_ret_map):
    vec = 0
    for arg in expr.args:
        arg_ret = arg_ret_map[arg]
        if vec < arg_ret:
            vec = arg_ret    
    return vec 

def name_key(key, name_variable_map):
    key_v = None
    if type(key) is not str:
        key_v = str(key)
    else:
        key_v = key
    
    import re
    pat = r'\[.*?\]|(\[.*?\]\[\.*?\])|(_tmp)|(_v\d+)'
    key_v = re.sub(pat, '', key_v)    
    return key_v

def get_name_variable(key, name_variable_map):
    tmp_key = name_key(key, name_variable_map)

    return name_variable_map[tmp_key]

def in_name_variable(key, name_variable_map):
    tmp_key = name_key(key, name_variable_map)
    return tmp_key in name_variable_map
    

#構文木の演算子の戻り値のmapを生成する。
def get_arg_ret_map(expr, arg_ret_map, name_variable_map):
    
    if not_op(expr):
        vec = 0
        if in_name_variable(expr, name_variable_map):
            v = get_name_variable(expr, name_variable_map)
            arg_ret_map[expr] = v.vec
        else:
            # print('in get_arg_ret_map  expr =',expr)
            arg_ret_map[expr] = 1
        return arg_ret_map
    
    new_args = []
    for arg in expr.args:
        arg_ret_map = get_arg_ret_map(arg, arg_ret_map, name_variable_map)

    expr_ret = 0
    if type(expr) is Add:
        expr_ret = ret_add(expr, arg_ret_map)
    elif type(expr) is Mul:
        expr_ret = ret_mul(expr, arg_ret_map)
    elif type(expr) is Pow:
        expr_ret = ret_pow(expr, arg_ret_map)
    
    arg_ret_map[expr] = expr_ret

    return arg_ret_map

def get_arg_ret_map_list(expr_list, name_variable_map):
    arg_ret_map_list = {}
    for expr in expr_list:
        arg_ret_map = {}
        arg_ret_map = get_arg_ret_map(expr, arg_ret_map, name_variable_map)
        arg_ret_map_list[expr.lhs] = arg_ret_map

    return arg_ret_map_list


def get_dot(arg1, arg2):
    return FunctionCall('dot', [arg1, arg2])


#powをdot演算に置き換える(項が整数の場合)
#項に整数を持たないとき、とりあえず、Powとして返す。
def pow_dot_int(expr, arg_ret_map):
    
    int_arg = expr.exp
    new_arg = trans_dot(expr.base, arg_ret_map)
    vec = arg_ret_map[new_arg]
    # print('in pow_dot_int', new_arg, vec)
    new_expr = None
    
    if int(int_arg) == 2 and vec == 3:
        vec = 1
        new_expr = get_dot(new_arg, new_arg)
    else:
        vec = arg_ret_map[new_arg]
        new_expr = Pow(new_arg, int_arg)
        
    arg_ret_map[new_expr] = vec
    # print('pow_dot_int')
    # print(f'new_expr={new_expr}\n vec={vec}')
    return new_expr

#Powのdot演算に置き換える(項が分数の場合)
#どんなパターンでなるかわからないのでとりあえず、そのままPowで返すようにする．
#戻り値はnew_argの次元数とする
def pow_dot_rat(expr, arg_ret_map):
    new_expr = None
    rat_arg = expr.exp
    new_arg = trans_dot(expr.base, arg_ret_map)
    new_expr = Pow(new_arg, rat_arg)
    vec = arg_ret_map[new_arg]
    arg_ret_map[new_expr] = vec
    return new_expr

#pow演算の場合の内積への変換
def pow_dot(expr, arg_ret_map):

    if type(expr.exp) is Integer:
        new_expr = pow_dot_int(expr, arg_ret_map)
    elif type(expr.exp) is Rational:
        new_expr = pow_dot_rat(expr, arg_ret_map)
    else:
        base_arg = trans_dot(expr.base, arg_ret_map)
        exp_arg = trans_dot(expr.exp, arg_ret_map)
        vec = arg_ret_map[base_arg]
        new_expr = Pow(base_arg, exp_arg)
        arg_ret_map[new_expr] = vec

    return new_expr

#dot演算子に置き換える
#
def trans_dot(expr, arg_ret_map):
    new_ret = 0
    if not_op(expr):
        # print(f' trans_dot in not_op {expr}')
        return expr
    elif type(expr) is Pow:
        new_expr = pow_dot(expr, arg_ret_map)
        return new_expr
    elif type(expr) is Mul:
        new_args = []
        vec3_args = []
        new_expr = None
        for arg in expr.args:
            new_arg = trans_dot(arg, arg_ret_map)
            new_arg_vec = arg_ret_map[new_arg]
            # print(f'trans_dot {new_arg} vec = {new_arg_vec}')
            if new_arg_vec == 3:
                vec3_args.append(new_arg)
            else:
                new_args.append(new_arg)
            new_ret = max(new_ret, new_arg_vec)
        new_expr = Mul(*new_args)

        # 複数次元の要素数は1または偶数
        # スカラー倍のパターンがある。だけど，内積の計算を複数
        #する場合、順番が分からなくなるからしない．
        n = len(vec3_args)
        # print(f'trans_dot {vec3_args}')
        
        if n > 2:
            print('error')
            return
        elif n == 1:
            new_expr = Mul(new_expr, *vec3_args)
            new_ret = 3
        elif n == 0:
            new_ret = 1
        else:

            arg1 = vec3_args[0]
            arg2 = vec3_args[1]
            dot_op = FunctionCall('dot', [arg1, arg2])
            new_expr = Mul(new_expr, dot_op)
            new_ret = 1

    elif not_op(expr) == False:
        new_expr_list = []
        
        
        for arg in expr.args:
            new_expr = trans_dot(arg, arg_ret_map)
            new_expr_list.append(new_expr)
            arg_ret = arg_ret_map[new_expr]
            # print('in trans_dot op')
            # print(f'new_expr={new_expr}\n, arg_ret={arg_ret}')
            new_ret = max(new_ret, arg_ret)
        
        op = type(expr)
        # if op is Add:
        #     print(f'trans_dot add {expr}')
        
        new_expr = op(*new_expr_list)

    else:
        print("!!error!! at trans_dot()", new_expr)
        return 0

    arg_ret_map[new_expr] = new_ret    
    # print('in trans_dot() memo hash')
    # print(f'new_expr ={new_expr}\n new_ret={new_ret}')
    return new_expr

#trans_dot()テスト用データ
# test_x, test_y = symbols('test_x, test_y')
# trans_dot_test_expr = test_x * test_y
# test_arg_ret_map = {}

def trans_sub(expr):
    if not_op(expr):
        return expr

    elif type(expr) is Add:
        args_for_add = []
        new_expr = None
        for arg in expr.args:
            new_expr = trans_sub(arg)
            if type(arg) is Mul and Integer(-1) in get_expr_args(arg):
                new_args = []
                
                for x in arg.args:
                    new_arg = trans_sub(x)
                    if new_arg == Integer(-1):
                        continue
                    new_args.append(new_arg)
                new_expr = Mul(*new_args)


            args_for_add.append(new_expr)

        else:
            return expr
    else:
        return expr


def sqrt_pat(expr):
    if type(expr) is Pow and type(expr.exp) is Rational:
        r = expr.exp
        if r.denominator == 2:
            return True
        
    return False



#sqrtであるような要素を探し、変換する. 
#Rationalの分母が2だったらsqrtに変換する。
def trans_sqrt(expr, arg_ret_map):
    if sqrt_pat(expr):
        r = expr.exp
        pow_num = r.numerator
        b = expr.base
        new_expr = trans_sqrt(b, arg_ret_map)
        if pow_num == 2:
             return Mul(new_expr, new_expr)
        return 
    elif not_op(expr):
        return expr
    return
    

#構文木(expr)を自分で定義した演算子に変換する。
def trans_new_op(expr_list, arg_ret_map_list):
    new_expr_list = []
    for expr in expr_list:
        arg_ret_map = arg_ret_map_list[expr.lhs]
        # new_expr = trans_sub(expr.rhs)

        new_expr = trans_dot(expr.rhs, arg_ret_map)
        new_expr_list.append(Assignment(expr.lhs, new_expr))
         
    return new_expr_list

    
def trans_mid_expr_list(expr_list, name_variable_map):
    mid_code_list = []
    for expr in expr_list:
        prim_var = name_variable_map[str(expr.lhs)]
        for i in range(prim_var.vec):
            # print(f'trans_mid_expr = {expr}')
            mid_expr = trans_mid_expr(expr, name_variable_map, i)
            mid_code_list.append(mid_expr)
    # if SIMD:
    #     mid_code_list, prim_map = assign_exprs(mid_code_list, name_variable_map, need_prim_map=True)
    # new_mid_code_list = []
    # for expr in mid_code_list:
    #     prim_var = name_variable_map[str(expr.lhs)]
    #     for i in range(prim_var.vec):
    #         mid_expr = trans_mid_expr(expr, name_variable_map, i)
    #         new_mid_code_list.append(mid_expr)
    return mid_code_list

def add_mul_num(arg, name_variable_map, int_num, float_num):
    if type(arg) is Mul:
        for e in arg.args:
            if type(e) is Integer and e is not Integer(-1):
                int_v = Var.Var()
                int_v.name = f'int_{int_num}'
                int_v.vec = 1 
                int_v.type_name = 'F'
                int_v.prime = True
                int_v.bit = 64
                int_v.symbol = e
                name_variable_map[str(e)] = int_v
                int_num += 1
            elif type(e) is Float:
                float_v = Var.Var()
                float_v.name = f'float_{float_num}'
                float_v.vec = 1
                float_v.type_name = 'F'
                float_v.prime = True
                float_v.bit = 64
                float_v.symbol = e
                name_variable_map[str(e)] = float_v 
                float_num += 1
            else:
                add_mul_num(e, name_variable_map, int_num, float_num)
    elif not_op(arg):
        return
    else:
        for e in arg.args:
            add_mul_num(e, name_variable_map, int_num, float_num)
    return

def num_var_def(expr_list, name_variable_map):
    for expr in expr_list:
        int_num = 0
        float_num = 0
        add_mul_num(expr.rhs, name_variable_map, int_num, float_num)      
    return

def expr_op(expr, args):
    if type(expr) is FunctionCall:
        return FunctionCall(get_func_name(expr), args) 
    else:
        if len(args) == 2:
            return type(expr)(args[0], args[1])
        else:
            return type(expr)(args[0])
    return

def trans_var(arg, name_variable_map, i):
    if str(arg) in name_variable_map:  
        v = name_variable_map[str(arg)]
        
        ret = Symbol(v.get_tmp_name(i))
        if v.vec != 1:
            ret = Symbol(v.get_tmp_name(i))
        return ret
    elif arg is Integer(-1) or arg is Rational(1, 2) or type(arg) is Integer or type(arg) is Float or type(arg) is Rational or type(arg) is int:
        return arg
    else:
        args = get_expr_args(arg)
        arg_list = []
        for e in args:
            arg_list.append(trans_var(e, name_variable_map, i))
        
        new_expr = expr_op(arg, arg_list)
        
        return new_expr


def trans_var_names(expr_list, name_variable_map):
    new_expr_list = []
    for expr in expr_list:
        lhs_var = name_variable_map[str(expr.lhs)]
        i = lhs_var.vec_index
        new_expr = trans_var(expr, name_variable_map, i)
        new_expr_list.append(new_expr)
    return new_expr_list

import sys
def main():
    expr_list = []
    name_variable_map = {}
    global SIMD
    if len(sys.argv) == 2:
        SIMD = None
    else:
        simd_arg = sys.argv[2].strip()
        SIMD = simd_arg
        Var.SIMD = SIMD

    input_file_name = None
    if len(sys.argv) >= 2:
        input_file_name = sys.argv[1].strip() 
    else:
        print("error!! no pyker file")
        return

    with open(input_file_name, 'r', encoding='utf-8') as f:
        s = f.read()
        expr_list, name_variable_map = Parse(s)
    
    if SIMD:
        num_var_def(expr_list, name_variable_map)
        # print(name_variable_map)
    prim_map = type_inference(expr_list, name_variable_map) 
    arg_ret_map_list = get_arg_ret_map_list(expr_list, name_variable_map)
    #ここでdot演算子を変換
    # print(arg_ret_map_list)
    new_op_expr_list = trans_new_op(expr_list, arg_ret_map_list)
    # arg_ret_map_list = get_arg_ret_map_list(new_op_expr_list, name_variable_map)
    # check_tree(new_op_expr_list)

    after_cse_expr_list = apply_cse(new_op_expr_list, name_variable_map)
    #型推論　それから一次変数の型を決定
    # check_prim_map(prim_map) 
     
    #構文木を完全2分木にする処理
    biexpr_list = expr_binary_tree(after_cse_expr_list)
    prim_map = type_inference(biexpr_list, name_variable_map, arg_ret_map_list)
    
    # expr_binary_treeのテスト用
    # check_new_bitree(biexpr_list)


    # check_name_table(name_variable_map)
    #type_inferenceのテスト用
    # check_type_infer(prim_map) 

    # 木構造のチェック
    # check_tree(biexpr_list)
    mid_expr_list = trans_mid_expr_list(biexpr_list, name_variable_map)
    # print('mid_expr_list')
    # check_tree(mid_expr_list)
    # if SIMD:
    #     mid_expr_list = trans_var_names(mid_expr_list, name_variable_map)
    # print(f'exe_expr_list {mid_expr_list}')
    # check_tree(mid_expr_list[0])
    s = CodeGen(mid_expr_list, name_variable_map, prim_map)

    file_name = 'gravity_code'
    with open(f'{file_name}.hpp','w', encoding='utf-8') as f:
        f.write(s) 
    f.close()
    #チェック用
    return biexpr_list, name_variable_map

def check_prim_map(prim_map):
    print('check prim_map')
    print(prim_map)
    return 

def check_tree(expr_list):
    print('check_tree')
    for expr in expr_list:
        # print(dotprint(expr))
        print(ccode(expr))
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
        print(ccode(expr))
        print(srepr(expr))
                
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

