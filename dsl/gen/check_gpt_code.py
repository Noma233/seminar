class TypeInfo:
    def __init__(self, struct_name="", memb_name="", type_name="", bit_val=0, vec_name="", var_name=""):
        self.struct_name = struct_name
        self.memb_name = memb_name
        self.type_name = type_name
        self.bit_val = bit_val
        self.vec_name = vec_name
        self.var_name = var_name

# Define a function to parse the string and create an instance of TypeInfo
def parse_string_to_typeinfo(s):
    # Split the string by space
    parts = s.split()

    # Further split the first part by '.' to get struct_name and memb_name
    struct_memb = parts[0].split('.')
    struct_name = struct_memb[0]
    memb_name = struct_memb[1]

    # Extract type_name and bit_val from the second part of the string
    type_bit = ''.join(filter(str.isalpha, parts[1])), ''.join(filter(str.isdigit, parts[1]))

    # Split the third part to get vec_name and var_name
    vec_name = parts[2][:-len(parts[3])]
    var_name = parts[3]

    # Create an instance of TypeInfo
    return TypeInfo(struct_name, memb_name, type_bit[0], int(type_bit[1]), vec_name, var_name)

# Example string
s = 'EPI.pos F64vec3 xi'

# Create an instance of TypeInfo from the string
type_info_instance = parse_string_to_typeinfo(s)
type_info_instance.__dict__  # Show the attributes of the instance
