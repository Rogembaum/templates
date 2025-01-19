# test.assert_equals(is_square(-1), False, "-1: Negative numbers cannot be square numbers")
# test.assert_equals(is_square(0), True, "0 is a square number (0 * 0)")
# test.assert_equals(is_square(3), False, "3 is not a square number")
# test.assert_equals(is_square(4), True, "4 is a square number (2 * 2)")
# test.assert_equals(is_square(25), True, "25 is a square number (5 * 5)")
# test.assert_equals(is_square(26), False, "26 is not a square number")

import math

def is_square(n):
    if n < 0:
        return False
    return math.isqrt(n) ** 2 == n


# refactoring
# % 1 - test num if it is integer

def better_is_square(n):
    return n > -1 and (n**0.5)%1 == 0
print(better_is_square(25))

