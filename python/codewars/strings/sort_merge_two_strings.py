# Take 2 strings s1 and s2 including only letters from a to z. Return a new sorted string (alphabetical ascending), the longest possible, containing distinct letters - each taken only once - coming from s1 or s2.
# Examples:
#
# a = "xyaabbbccccdefww"
# b = "xxxxyyyyabklmopq"
# longest(a, b) -> "abcdefklmopqwxy"
#
# a = "abcdefghijklmnopqrstuvwxyz"
# longest(a, a) -> "abcdefghijklmnopqrstuvwxyz"
#
abc = "zzzxxxccccccc"

print(sorted(abc))


map = {}
for i in abc:
    map[i] = map.get(i,0)+1

print(map)

def longest(a1, a2):
    str = a1 + a2
    map = {}
    for i in str:
        map[i] = map.get(i,0)+1

    uniq_str = ""


    for k,v in map.items():
        if v == 1:
            uniq_str += k

    return uniq_str

print(longest("123","456123"))




def longest_only_once(a1, a2):
    a1a2 = a1 + a2
    uniq_chars = set(a1a2)
    return "".join(sorted(uniq_chars))

print(longest_only_once("123","456123"))