# def smallest(n):
#     result = n
#     k = 1
#
#     while k <= n:
#
#         while result % k == 0 and k <= n:
#             k += 1
#
#         if k <=n:
#             result += 1
#             k = 1
#
#     return result
def smallest(n):
    result = 1

    for i in range(1, n + 1):
        temp = result
        while temp % i != 0:  # Find the next multiple of i
            temp += result
        result = temp

    return result

print(smallest(5))