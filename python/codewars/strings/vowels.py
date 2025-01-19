def disemvowel(string_):
    result =''
    vowels = ['a','e','i','o','u','A','E','I','O','U']
    for i in string_:
        if i not in vowels:
            result += i
    return result


# refactoring
def disemvowel(s):
    for i in "aeiouAEIOU":
        s = s.replace(i,'')
    return s


def disemvowel(string):
    return "".join(c for c in string if c.lower() not in "aeiou")

import re
def disemvowel(string):
    return re.sub('[aeiou]', '', string, flags = re.IGNORECASE)