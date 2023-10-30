import numpy as np

def relative_error(true_value, approx_value):
    return np.abs(true_value - approx_value) / np.abs(true_value)

def significant_digits(base, true_value, approx_value):
    rel_error = relative_error(true_value, approx_value)
    if rel_error == 0:
        return np.inf
    return -np.log(rel_error) / np.log(base)

a = 100000 * np.sqrt(2)
_a = 141421

decimal_significant_digits = significant_digits(10, a, _a)
binary_significant_digits = significant_digits(2, a, _a)

print("10進有効桁数: ", decimal_significant_digits)
print("2進有効桁数: ", binary_significant_digits)
