import numpy as np

def E(a, _a):
        
        return np.abs(a - _a)

def rE(a, _a):
        if a == 0:
                return E(a, _a)
        else:
                return E(a, _a) / np.abs(a)

def significant_digits(m, a, _a):
        return (-np.log(rE(a, _a)) // np.log(m))

a = 100000 * np.sqrt(2)
_a = 141421

print("absolute error is ", E(a, _a))
print("relative error is ", rE(a, _a))
print("significant decimal digits is", significant_digits(10, a, _a))
print("significant binary digits is ", significant_digits(2, a, _a))
