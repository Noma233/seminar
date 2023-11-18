import re

#一つの変数の型情報を持つクラス
# EPI.pos vec3<F64> xi -> 
# struct_name = 'EPI'
# memb_name = 'pos'
# type_name = 'F64'
# vec_name = 'vec3'
# var_name = 'xi'
class Variable:
   
    #行を空白で区切りwordのリストにしそれをセットする
    def __init__(self, str_type_col=None):
        self.struct_name = ""
        self.memb_name = ""
        self.type_name = ""
        self.name = ""  
        self.vec = "1"
        if str_type_col:
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

    def typeinfo_assign_(self, other):
        self.type_name = other.type_name
        self.vec = other.vec
