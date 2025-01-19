# import random
# import codewars_test as test
# from solution import invert
#
#
# @test.describe("Invert values")
# def fixed_tests():
#     @test.it('Basic Test Cases')
#     def basic_test_cases():
#         test.assert_equals(invert([1, 2, 3, 4, 5]), [-1, -2, -3, -4, -5])
#         test.assert_equals(invert([1, -2, 3, -4, 5]), [-1, 2, -3, 4, -5])
#         test.assert_equals(invert([]), [])
#         test.assert_equals(invert([0]), [0])
#
#     @test.it("Random Tests")
#     def _():
#         for _ in range(500):
#             lst = [random.randint(-1000, 1000) for _ in range(random.randint(0, 1000))]
#             expected = [-x for x in lst]
#             lst_copy = lst.copy()
#             test.assert_equals(invert(lst), expected, f'Testing for lst = {repr(lst)}')
#             test.expect(lst == lst_copy, 'You must not mutate the input list')
#
def invert(lst):
    for i in range(len(lst)):
        lst[i] = lst[i]*(-1)
    return lst

def invert_refactor(lst):
    return [-1*lst[i] for i in range(len(lst))]

def invert_refactor_super(lst):
    return [-x for x in lst]

print(invert([1,2,3]))
print(invert_refactor([1,2,3]))