import re
import sys

def get_file_name():

    return sys.argv[1], sys.argv[2]


file_name, li = get_file_name()

with open(file_name) as f:
    s = f.read()
    L3_p = re.search(repr(li)[1:-1], s)
    L3_str = s[L3_p.start():]


v_only = re.findall(r"v\w+pd",L3_str)


print(len(v_only))