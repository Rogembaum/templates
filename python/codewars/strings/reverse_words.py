# Complete the function that accepts a string parameter, and reverses each word in the string. All spaces in the string should be retained.
# Examples
#
# "This is an example!" ==> "sihT si na !elpmaxe"
# "double  spaces"      ==> "elbuod  secaps"
#


def reverse_words(text: str) -> str:
    orig_words = text.split(" ")
    reverse_words = []

    for word in orig_words:
        reverse_words.append(word[::-1])
        print(reverse_words)

    return " ".join(reverse_words)

print(reverse_words("stressed desserts  rtrtrtr   6g6h6b"))


# def reverse_words(str):
#     return ' '.join(s[::-1] for s in str.split(' '))