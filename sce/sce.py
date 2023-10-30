import time

def test_normal(n):
  a = 10
  b = 0
  x1 = 10
  x2 = 20
  g = 3
  d = 4
  for i in range(n):
    for j in range(n):
        a = x1 * x2 + g
        b = x1 * x2 + d
        
                  
        return


def test_sc(n):
  a = 10
  b = 0
  x1 = 10
  x2 = 20
  g = 3
  d = 4
  for i in range(n):
    for j in range(n):
        tmp = x1 * x2
        a = tmp + g
        b = tmp + d
  
        return 

timen = int(input())

start = time.time()
test_normal(timen)
end = time.time()

print("normal time = ", end-start)
normal_time = end-start

start = time.time()
test_sc(timen)
end = time.time()

print("sce time = ", end-start)
sc_time = end-start

if sc_time < normal_time:
        print("sc win!")
elif sc_time > normal_time:
        print("normal win!")
else:
        print("draw")
        
        