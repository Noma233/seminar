from sympy import *
from sympy.codegen.ast import (Variable, Pointer, real, CodeBlock, Declaration,
                               FunctionDefinition, 
                               For, FunctionCall)
from sympy import symbols
from sympy.codegen.ast import Declaration, Type
from sympy import *
from sympy.codegen.ast import CodeBlock, For, Variable, Declaration, FunctionDefinition,FloatBaseType, Assignment, FunctionCall, String,IntBaseType
from sympy.codegen.ast import FunctionDefinition, Return, integer

va, vb, vc = symbols('va vb vc')

pattern = '\s+'

dec_var = 'EPI F64vec xi:pos'



