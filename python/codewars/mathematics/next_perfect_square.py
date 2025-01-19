import math

def find_next_square(sq):
    num_sqrt = math.isqrt(sq)
    if num_sqrt ** 2 == sq:
        return (num_sqrt + 1) ** 2
    else:
        return -1

print(find_next_square(143))

# some other way
def find_next_square(sq):
    root = sq ** 0.5
    if root.is_integer():
        return (root + 1)**2
    return -1