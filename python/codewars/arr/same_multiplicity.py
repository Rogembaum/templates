# Given two arrays a and b write a function comp(a, b) (orcompSame(a, b)) that checks whether the two arrays have the "same" elements, with the same multiplicities (the multiplicity of a member is the number of times it appears). "Same" means, here, that the elements in b are the elements in a squared, regardless of the order.
# Examples
# Valid arrays
#
# a = [121, 144, 19, 161, 19, 144, 19, 11]
# b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
#
# comp(a, b) returns true because in b 121 is the square of 11, 14641 is the square of 121, 20736 the square of 144, 361 the square of 19, 25921 the square of 161, and so on. It gets obvious if we write b's elements in terms of squares:
#
# a = [121, 144, 19, 161, 19, 144, 19, 11]
# b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]
#
# Invalid arrays
#
# If, for example, we change the first number to something else, comp is not returning true anymore:
#
# a = [121, 144, 19, 161, 19, 144, 19, 11]
# b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]
#
# comp(a,b) returns false because in b 132 is not the square of any number of a.
#
# a = [121, 144, 19, 161, 19, 144, 19, 11]
# b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]
#
# comp(a,b) returns false because in b 36100 is not the square of any number of a.
# Remarks
#
#     a or b might be [] or {} (all languages except R, Shell).
#     a or b might be nil or null or None or nothing (except in C++, COBOL, Crystal, D, Dart, Elixir, Fortran, F#, Haskell, Nim, OCaml, Pascal, Perl, PowerShell, Prolog, PureScript, R, Racket, Rust, Shell, Swift).
#
# If a or b are nil (or null or None, depending on the language), the problem doesn't make sense so return false.
from twisted.python.failure import count


def comp(array1, array2):
    if array1 is None or array2 is None:
        return False

    map_array1_unique = {}
    map_array2_unique = {}
    map_array1_square = {}

    # create map for array1 to count unique elements in array1
    for elem in array1:
        if elem in map_array1_unique:
            map_array1_unique[elem] += 1
        else:
            map_array1_unique[elem] = 1

    # create map for array2 to square the keys and count unique elements in array2
    for k, v in map_array1_unique.items():
        map_array1_square[k*k] = v


    # create map for array2 to count unique elements in array2
    for elem in array2:
        if elem in map_array2_unique:
            map_array2_unique[elem] += 1
        else:
            map_array2_unique[elem] = 1

    # True if both maps contain the same key-value pairs, regardless of order.
    return map_array1_square == map_array2_unique


print(comp([121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361]))


# def comp(array1, array2):
#     try:
#         return sorted([i ** 2 for i in array1]) == sorted(array2)
#     except:
#         return False