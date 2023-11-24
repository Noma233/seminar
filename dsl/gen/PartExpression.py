from sympy import *
from Variable import Variable

class PartExpression:
    def __init__(self, arg=None):
        
        self.vec = 0
        self.type_name = ""
        self.bit = 0
        self.sym_expr = None
        self.exprs = []
        self.arg = arg

        if type(arg) is Variable:
            self.vec = arg.vec
            self.type_name = arg.type_name
            self.bit = arg.bit
            self.sym_expr = arg.symbol
            
            if self.vec == 1:
                    self.exprs.append(arg.symbol)
            else:    
                for i in range(self.vec):
                    self.exprs.append(sympify(arg.name + f'.v{i}'))
        
        elif arg == Integer(-1):
            self.vec = 1
            self.exprs.append(Integer(-1))
            self.bit = 16
            self.type_name = "F"
        
        else:
            return 

    def type_priority(self, other):
        left_type = self.type_name
        left_bit = self.bit
        right_type = other.type_name
        right_bit = other.bit

        self.type_name = left_type
        self.bit = left_bit

        if left_bit < right_bit:
            ret_bit = right_bit 

        #TODO typeの条件式
        

    
    #部分式と部分式を連結させて、一つの式にしている．
    #この後，selfとotherぐちゃぐちゃになってるやん．　使わんからええけど　
    def join(self, other, op):

        #今は4次元は考えてないからまた今度!
        if self.vec != other.vec:
            if self.vec < other.vec:
                vec1_exp = self 
                vec3_exp = other

            elif self.vec > other.vec:
                vec1_exp = other
                vec3_exp = self
            
            for e in vec3_exp.exprs:
                e = op(e, vec1_exp.exprs[0])

            self = vec3_exp
            self.vec = 3
        #self, otherのvecが同じとき
        else:
            for i in range(self.vec):
                self.exprs[i] = op(self.exprs[i], vec1_exp.exprs[i])

        self.arg = op(self.arg, other.arg)
        self.type_priority(other)