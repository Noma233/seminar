from sympy import *
from sympy.codegen.ast import (CodeBlock, For, Variable, Declaration, FunctionDefinition,
                                Assignment, FunctionCall, String, IntBaseType,
                               FunctionPrototype, integer,Return)
import re


#一つの変数の型情報を持つクラス
# EPI.pos vec3<F64> xi -> 
# struct_name = 'EPI'
# memb_name = 'pos'
# type_name = 'F64'
# vec_name = 'vec3'
# var_name = 'xi' 
class TypeInfo:

    #行を空白で区切りwordのリストにしそれをセットする
    def __init__(self, str_type_col):
        self.struct_name = ""
        self.memb_name = ""
        self.type_name = ""
        self.name = ""
        self.vec = "1"

        word_lst = str_type_col.split()
        self.set_var(word_lst)

    def __repr__(self) -> str:
        ret = f"name = {self.name} , struct = {self.struct_name},  member_name = {self.memb_name} \n" 
        ret +=  f" type_name = {self.type_name} , vec_name = {self.vec} \n"
        return ret

    #宣言の1行から型情報を取得
    def set_var(self, word_lst):

        #EPI,EPJ,FORCEを正規表現で判定する
        struct_name_pattern = r'(EP(I|J)|FORCE).\w+'
        check_pat = re.match(struct_name_pattern, word_lst[0])

        #合えば、メンバー変数と構造体名をセットし、その後、変数宣言の処理
        if check_pat:
            s = check_pat.group()
            self.struct_name, self.memb_name = s.split('.')
            self.set_type(word_lst[1:])
        #合わなければ、変数宣言の処理
        else:
            self.set_type(word_lst)

        return 
    

    #vec3<F64> xi -> F64, vec3, xi をそれぞれセット
    def set_type(self, word_lst):

        var_type_pattern = r'(vec(3|4)<)?F(16|32|64)>?'
        var_name_pattern = r'[a-zA-Z]\w+'

        #型名をセット
        #型のチェック
        check_pat = re.match(var_type_pattern, word_lst[0])

        #TODO失敗した場合の処理書く
        if check_pat:
            s = check_pat.group() 
            
            #3or4次元であれば
            if s.find('<'):
                vec, type_bit = s.split('<')
                self.vec, self.type_name = vec, type_bit[:-1]
            #1次元であれば
            else:
                self.type_name = s
                

        #変数名をセット
        #変数名の規則をチェック
        check_pat = re.match(var_name_pattern, word_lst[1])
        #TODO失敗した場合の処理書く
        if check_pat:
            s = check_pat.group()
            self.name = s

        return



#式をsympyに適応させる
def expr_part(var_col):
    left_exp, right_exp = tuple(map(lambda x: sympify(x), var_col.split('='))) 
    return Assignment(left_exp, right_exp)

#source code から構文木(sympyのシンボルに変換),変数と型の対応の表を作る
def Parse(file_str):

    file_list = file_str.split('\n')
    expr_list = []
    symbol_type_map = {}

    #ファイルから読み取ったコードを一行ずつ
    for col in file_list:
        
        #＝演算子があれば、式なので、その時、sympyの式に変換
        if col.find('=') != -1:
            expr_list.append(expr_part(col))
        
        else:
            #空白等の式や変数宣言でない部分の処理を書く
            
            #変数宣言だった場合型の情報をTypeInfoから取得
            type_info = TypeInfo(col)
            symbol_type_map[type_info.name] = type_info


    return expr_list, symbol_type_map



def CodeGen(expr_list, symbol_type_map):

    load_part = CodeBlock()
    store_part = CodeBlock()
    assign_part = CodeBlock(*expr_list)

    op_list = {Add, Mul}

    right_type = ""

    # for expr in expr_list:
    #     for arg in preorder_traversal(expr):
    #         if type(arg) is Symbol:
    #             if  arg.name in symbol_type_map:
    #                 symbol_type = symbol_type_map[arg.name]

    #                 #typeが違う場合のエラー処理それとより優先度の高い型にあわせるようにする
    #                 if right_type == "":
    #                     right_type = symbol_type.type_name
    #                 print(srepr(arg))
    #             else:
    #                 symbol_type = right_type
    #                 symbol_type.struct_name = ""
    #                 symbol_type.memb_name = ""
    #                 symbol_type_map[arg.name] = symbol_type
    #         elif type(arg) in op_list:
    #            print(arg) 

    
    return 


def main():
    expr_list = []
    symbol_type_map = {}


    with open('rij.pykg', 'r', encoding='utf-8') as f:
        s = f.read()
        expr_list, symbol_type_map = Parse(s)

    for expr in expr_list:
        print(expr)

    for arg in symbol_type_map:
        print(symbol_type_map[arg])

    CodeGen(expr_list, symbol_type_map)

    return


if __name__ == "__main__":
     main()
