#
# A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).
#
# Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.

# from solution import is_pangram
# import codewars_test as test
#
#
# @test.describe("Fixed tests")
# def fixed_tests():
#     @test.it("Test pangrams")
#     def test_pangrams():
#         pangrams = ["The quick brown fox jumps over the lazy dog.",
#                     "Cwm fjord bank glyphs vext quiz",
#                     "Pack my box with five dozen liquor jugs.",
#                     "How quickly daft jumping zebras vex.",
#                     "ABCD45EFGH,IJK,LMNOPQR56STUVW3XYZ"]
#         for pangram in pangrams:
#             test.assert_equals(is_pangram(pangram), True, f"Incorrect answer for '{pangram}'")
#
#     @test.it("Test non-pangrams")
#     def test_non_pangrams():
#         non_pangrams = ["This isn't a pangram!",
#                         "abcdefghijklm opqrstuvwxyz",
#                         "Aacdefghijklmnopqrstuvwxyz"]
#         for non_pangram in non_pangrams:
#             test.assert_equals(is_pangram(non_pangram), False, f"Incorrect answer for '{non_pangram}'")
def detect_pangram(st):
    st = st.lower()
    alphabet = set('abcdefghijklmnopqrstuvwxyz')
    for i in st:
        if i in alphabet:
            alphabet.remove(i)
    return  len(alphabet) == 0

print(detect_pangram("The quick brown fo jumps over the lazy dog."))

# refactoring

st = st.lower()
alphabet = set('abcdefghijklmnopqrstuvwxyz')
for i in st:
    if i in alphabet:
        alphabet.remove(i)
return len(alphabet) == 0
