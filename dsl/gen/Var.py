import re
import sympy
#一つの変数の型情報を持つクラス
# EPI.pos vec3<F64> xi -> 
# struct_name = 'EPI'
# memb_name = 'pos'
# type_name = 'F64'
# vec_name = 'vec3'
# var_name = 'xi'
# SIMD = 'AVX2'
SIMD = None
class Var:
    struct_name = ""
    memb_name = ""
    type_name = ""
    bit = 0
    name = ""  
    vec = 1
    symbol = None
    index_name = ''
    prime = False
    argument = None
    vec_index = 1
    origin = None
    tmp_name = None

    def index_def(self):
        if self.struct_name == 'EPI' or self.struct_name == 'FORCE':
            self.index_name = 'i'
        elif self.struct_name == 'EPJ':
            self.index_name = 'j'
        else:
            pass

    
    #行を空白で区切りwordのリストにしそれをセットする
    def __init__(self, str_type_col=None, init_v=None):
        if str_type_col:
            word_lst = str_type_col.split()
            self.set_var(word_lst)
            origin = True
        
        self.index_def()

        if init_v:
            self.struct_name = init_v.struct_name
            self.bit = init_v.bit
            self.type_name = init_v.type_name
            self.name = init_v.name
            self.vec = init_v.vec
            self.symbol = init_v.symbol
            self.prime = init_v.prime
            self.vec_index = init_v.vec_index
            

    def __repr__(self) -> str:
        ret = f"name = {self.name} , struct = {self.struct_name},  member_name = {self.memb_name} \n" 
        ret +=  f" type_name = {self.type_name} , vec_name = {self.vec} \n"
        return ret


    #宣言の1行から型情報を取得
    def set_var(self, word_lst):

        #EPI,EPJ,FORCEを正規表現で判定する
        struct_name_pattern = r'(EP(I|J)|FORCE)'
        check_pat = re.match(struct_name_pattern, word_lst[0])

        #合えば、メンバー変数と構造体名をセットし、その後、変数宣言の処理
        if check_pat:
            s = check_pat.group()
            self.struct_name = s
            self.set_type(word_lst[1:])
        #合わなければ、変数宣言の処理
        else:
            self.set_type(word_lst)

    

    #vec3<F64> xi -> F64, vec3, xi をそれぞれセット
    def set_type(self, word_lst):

        var_type_pattern = r'(vec(3|4)<)?F(16|32|64)>?'
        var_name_pattern = r'\w+'

        #debag

        #型名をセット
        #型のチェック
        check_pat = re.match(var_type_pattern, word_lst[0])

        #TODO 失敗した場合の処理書く
        if check_pat:
            s = check_pat.group() 
            
            #3or4次元であれば
            if s.find('<') != -1:
                vec, type_ = s.split('<')
                vec = ''.join(filter(str.isdigit, vec))
                t = ''.join(filter(str.isalpha, type_))
                bit = ''.join(filter(str.isdigit, type_))
                self.vec = int(vec)
                self.type_name = t
                self.bit = int(bit)
            #1次元であれば
            else:
                self.type_name = ''.join(filter(str.isalpha, s))
                self.bit = int(''.join(filter(str.isdigit, s)))
                

        

        #変数名をセット
        #変数名の規則をチェック
        check_pat = re.match(var_name_pattern, word_lst[1])
        #TODO 失敗した場合の処理書く
        if check_pat:
            s = check_pat.group()
            self.name = s
            self.symbol = sympy.sympify(s)
            self.argument = True

    def typeinfo_assign_(self, other):
        self.type_name = other.type_name
        self.vec = other.vec


    def type_priority(self, other):
        self_type = self.type_name
        self_bit = self.bit
        other_type = other.type_name
        other_bit = other.bit

        type_ = self_type
        bit = self_bit

        if self_bit < other_bit:
            bit = other_bit 

        #typeの条件式も書く SとかF
        self.type_name = type_
        
        self.bit = bit
    
    # def get_tmp_name(self):
    #     if SIMD:
    #         return self.tmp_name
    #     else:
    #         return self.name
        
    def get_tmp_name(self, i):

        if SIMD:
            ret_name = self.name + '_tmp'

            if self.vec == 1:
                return ret_name 
            
            return ret_name + f'_v{i}'
        else:

            ret_name = self.name
            if self.index_name != '':
                ret_name += f'[{self.index_name}]'
                if self.vec == 1:
                    return ret_name
                else:
                    return ret_name + f'[{i}]'
            else:
                if self.vec == 1:
                    return ret_name
                else:
                    return ret_name + f'_v{i}'

    def get_type(self):

        if SIMD == 'AVX2':
            pass
        elif SIMD == 'AVX512':
            pass
        
        else:
            if self.type_name == 'F':
                if self.bit == 32:
                    return 'float'
                elif self.bit == 64:
                    return 'double'
                else:
                    print(self)
                    return "not_defined"
            elif self.type_name == 'S':
                if self.bit == 32:
                    return 'int'
                elif self.bit == 64:
                    return 'long long int'
                else:
                    print(self)
                    return 'not_defined'
            else:
                print(self)
                return 'not_defined'
        
        return