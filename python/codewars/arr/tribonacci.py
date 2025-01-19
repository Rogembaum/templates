
# def tribonacci(signature, n):
#     if n > 0:
#         result = signature[:n]
#         while len(result) < n:
#             next_element = result[-1]+ result[-2] + result[-3]
#             result.append(next_element)
#         return result
#     else:
#         return []

# refactoring

def tribonacci(signature, n):
    if n > 0:
        while len(signature[:n]) < n:
            signature.append(sum(signature[-3:]))
        return signature[:n]
    else:
        return []

print(tribonacci([1,1,1], 10))



# This line makes result point to the same list as signature
# signature = [1, 1, 1]
# result = signature
# result.append(2)
# print(signature)  # Output: [1, 1, 1, 2]


# This creates a new list (result) that is a copy of the first n elements from signature.
# signature = [1, 1, 1]
# result = signature[:2]  # Take a slice of the first 2 elements
# result.append(2)
# print(signature)  # Output: [1, 1, 1]
# print(result)     # Output: [1, 1, 2]

