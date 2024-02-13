
left_list = []

def culc_(l, r):

    return l / r


for i in range(4):
    lef = float(input())

    left_list.append(lef)

right_list = []
for i in range(4):
    r = float(input())
    right_list.append(r)

for i in range(4):
    l = left_list[i]
    r = right_list[i]
    print(culc_(l, r))
