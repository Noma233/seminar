import re
import sys

def get_file_name():

    li_st = repr(sys.argv[2])[1:-1]
    li_end = repr(sys.argv[3])[1:-1]

    return sys.argv[1], li_st, li_end 


file_name, li_st, li_end = get_file_name()

with open(file_name) as f:
    s = f.read()
    Lst_p = re.search(li_st, s)
    Len_p = re.search(li_end, s)
    L3_str = s[Lst_p.start():Len_p.start()]
    

pattern_v = r"v(div|sqrt|add|sub|(fmadd|fnmadd)(231|213)|fnmadd|mul|)pd"

v_only = re.findall(pattern_v,L3_str)


print(len(v_only))