import math

def sctc(sin):
    arr = []
    # sin
    arr.append(sin)

    # cos
    value = math.isqrt(1-sin*sin)
    int_value = int(value)
    arr.append(int_value)

    # tan
    # arr.append(sin/)
    # con


    return arr

# print(sctc(0.5))