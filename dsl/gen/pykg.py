from sympy import *
from sympy.codegen.ast import (CodeBlock, For, Variable, Declaration, FunctionDefinition,
                                Assignment, FunctionCall, String, IntBaseType,
                               FunctionPrototype, integer,Return)
from Variable import Variable



#式をsympyに適応させる
def expr_part(var_col):
    left_exp, right_exp = tuple(map(lambda x: sympify(x), var_col.split('='))) 
    return Assignment(left_exp, right_exp)

#source code から構文木(sympyのシンボルに変換),変数と型の対応の表を作る
def Parse(file_str):

    file_list = file_str.split('\n')
    expr_list = []
    variable_type_map = {}

    #ファイルから読み取ったコードを一行ずつ
    for col in file_list:
        
        #＝演算子があれば、式なので、その時、sympyの式に変換
        if col.find('=') != -1:
            expr_list.append(expr_part(col))
        
        else:
            #空白等の式や変数宣言でない部分の処理を書く
            
            #変数宣言だった場合型の情報をVariableから取得
            type_info = Variable(col)
            variable_type_map[type_info.name] = type_info


    return expr_list, variable_type_map


#sympy形式の式を探索するとき、探索しているノードがsymbolだった時の処理
#まずそれが一時変数なのかどうか
#一時変数なら、tableにその名前がないはずなので一時変数の処理をする。
#宣言済み変数ならどうしよっか 
#その上のノードでは型の情報がほしい。なぜなら、適切な型の演算のチェックと
#vecなら複数の式を生成しないとだから。
#なので、class Termにその情報を載せてあげるようにしたらいいかな？
#-1なら
def variable_pattern():
    
    return


#sympy形式の式を探索するとき、探索しているノードが演算だった時の処理
#ここで項がvec3であれば、三つ作りたいけど、どないしようか？
#termと式のmapがあれば、args[1]からそのtermに対応できる
def operator_pattern():
    return


def CodeGen(expr_list, variable_type_map):

    load_part = CodeBlock()
    store_part = CodeBlock()
    assign_part = CodeBlock()
    term_expr_map = {}

    op_list = {Add, Mul}


    for expr in expr_list:
        
        new_var = None
        
        for arg in postorder_traversal(expr):
            if type(arg) is Symbol:
                if  arg.name in variable_type_map:
                    symbol_type = variable_type_map[arg.name]

                    #typeが違う場合のエラー処理それとより優先度の高い型にあわせるようにする
                    if new_var:
                        new_var.typeinfo_assign_(symbol_type)
                    print(srepr(arg))
                 
                #variable_type_mapに変数がないかつ新しい一時変数をまだ記録していないなら
                #new_varをそれで更新し、symbolのテーブルを更新する
                elif new_var == None:
                    new_var = Variable()
                    new_var.name = arg.name
                    
                    
                    
            elif type(arg) in op_list:
               print(arg)

    
    return 


def main():
    expr_list = []
    variable_type_map = {}


    with open('rij.pykg', 'r', encoding='utf-8') as f:
        s = f.read()
        expr_list, variable_type_map = Parse(s)

    for expr in expr_list:
        print(expr)

    for arg in variable_type_map:
        print(variable_type_map[arg])

    CodeGen(expr_list, variable_type_map)

    #チェック用
    return expr_list, variable_type_map


if __name__ == "__main__":

    expr_list, type_map = main()
