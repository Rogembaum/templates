# def digitize(n):
#     result = []
#     for i in str(n):
#         result.insert(0,int(i))
#     return result
#
#
# print(digitize(35231))
#
# # refactoring
# def digitize(n):
#     return [int(x) for x in str(n)[::-1]]



def reverse_digit(num):
    return [int(i) for i in str(num)[::-1]]

print(reverse_digit(1234567890))







