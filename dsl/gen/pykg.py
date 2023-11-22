from sympy import *
from sympy.codegen.ast import (CodeBlock, For, Variable, Declaration, FunctionDefinition,
                                Assignment, FunctionCall, String, IntBaseType,
                               FunctionPrototype, integer,Return)
from Variable import Variable
from PartExpression import PartExpression



#式をsympyに適応させる
def expr_part(var_col):
    left_exp, right_exp = tuple(map(lambda x: sympify(x), var_col.split('='))) 
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
            v = Variable(col)
            name_variable_map[v.name] = v


    return expr_list, name_variable_map

def type_priority(x, y):
    left_type = x.type_name
    left_bit = x.bit
    right_type = y.type_name
    right_bit = y.bit

    ret_type = left_type
    ret_bit = left_bit

    if left_bit < right_bit:
           ret_bit = right_bit 

    #typeの条件式も書く SとかF

    return (ret_type, ret_bit)


def make_assignment_part():
    return

def operator_pattern(op_list, arg_partexpr_map, arg):
    arg_partexpr = None
    for pre_arg in arg.args:
        # print(pre_arg)
        pre_partexpr = arg_partexpr_map[pre_arg]

        if arg_partexpr == None:
            arg_partexpr = pre_partexpr
            continue
        
        arg_partexpr.extend(pre_partexpr, type(arg))
    
    return arg_partexpr

def variable_pattern(name_variable_map, arg, new_var):

    if  str(arg) in name_variable_map or arg is Integer(-1):
        variable = name_variable_map[str(arg)]
        return PartExpression(variable)
    
    elif arg.name == new_var.name:
        return None
    #エラー
    else:
        print(arg)
        return

def CodeGen(expr_list, name_variable_map):

    load_part = CodeBlock()
    store_part = CodeBlock()
    assign_part = CodeBlock()

    arg_partexpr_map = {}
    op_list = {Add, Mul}
    name_variable_map['-1'] = Integer(-1)
    for expr in expr_list:
        
        #exprは式なのでAssignmentになっている。
        #Assignmentの左辺が新しい変数なので、その変数を初期化
        new_var = Variable()
        new_var.name = expr.lhs.name
        
        for arg in postorder_traversal(expr):

            if type(arg) in op_list:
                arg_partexpr = operator_pattern(op_list, arg_partexpr_map, arg)

            elif type(arg) is Symbol or arg is Integer(-1):
                arg_partexpr = variable_pattern(name_variable_map, arg, new_var)
                if arg_partexpr == None:
                    continue

            #エラー処理
            else:
                print('error' + arg)

            arg_partexpr_map[arg] = arg_partexpr
            
        #最後に　new_var.type_nameを完成したPartExpressionから読む 
        expr_rhs_partexpr = arg_partexpr_map[expr.rhs]
    
        new_var.type_name = expr_rhs_partexpr.type_name
        assign_expr = PartExpression(new_var).extend(expr_rhs_partexpr, Assignment)
        for e in assign_expr.exprs:
            print(e)    


    return 


def main():
    expr_list = []
    name_variable_map = {}


    with open('rij.pykg', 'r', encoding='utf-8') as f:
        s = f.read()
        expr_list, name_variable_map = Parse(s)

    for expr in expr_list:
        print(expr)

    for arg in name_variable_map:
        print(name_variable_map[arg])

    CodeGen(expr_list, name_variable_map)

    #チェック用
    return expr_list, name_variable_map


if __name__ == "__main__":

    expr_list, type_map = main()

x,y,z = symbols('x y z')

