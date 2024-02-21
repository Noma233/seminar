import re
import sys

def get_file_name():

    li_st = repr(sys.argv[2])[1:-1]
    li_end = repr(sys.argv[3])[1:-1]

    return sys.argv[1], li_st, li_end 


def find_num(pat, str):
    num = re.findall(pat, str)
    return num

file_name, li_st, li_end = get_file_name()

with open(file_name) as f:
    s = f.read()
    Lst_p = re.search(li_st, s)
    Len_p = re.search(li_end, s)
    L_str = s[Lst_p.start():Len_p.start()]
    

pattern_v = r"""v(((div|sqrt|add|sub|(fmadd|fnmadd)(231|213|132)|mul|vmul)pd)|(mulsd))"""

v_only = re.findall(pattern_v,L_str)

print("v_operation num = ", len(v_only))

pattern_mov = r"v(broadcastsd|mov\w+)"

v_mov = re.findall(pattern_mov, L_str)

print("v move num = " , len(v_mov))
# print(L_str)