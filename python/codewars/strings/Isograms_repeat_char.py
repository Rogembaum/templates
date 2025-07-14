# An isogram is a word that has no repeating letters, consecutive or non-consecutive. Implement a function that determines whether a string that contains only letters is an isogram. Assume the empty string is an isogram. Ignore letter case.
#
# Example: (Input --> Output)
#
# "Dermatoglyphics" --> true
# "aba" --> false
# "moOse" --> false (ignore letter case)

def is_isogram(string):
    arr = []
    for i in range(len(string)):
        print(f"element in string: {string[i]}")
        arr.append(string[i])
        for j in range(len(arr)-1):
            print(f"element in arr: {arr[j]}")
            if string[i].lower() == arr[j].lower():
                return False
    return True
print(is_isogram("asdfghjklqwertyuio"))

# set(string.lower()): A set is a collection of unique elements. When you apply set() to the lowercase version of the string, it removes any duplicate characters. So, if the string has repeating characters, the resulting set will contain only one occurrence of each character.
def is_isogram_refactor(string):
    return len(string) == len(set(string.lower()))

def is_isogram_refactor_2(string):
    string = string.lower()
    for letter in string:
        if string.count(letter) > 1: return False
    return True