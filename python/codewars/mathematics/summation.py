# def summation(num):
#     result = 0
#     for i in range (num,0,-1):
#         result +=  i
#     return result
#
# print("Result: "+ str(summation(8)))


def summation(num):
    return num * (num + 1) // 2

print("Result: " + str(summation(2)))