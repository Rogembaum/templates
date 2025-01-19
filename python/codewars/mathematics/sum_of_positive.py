def positive_sum(arr):
    result = 0
    for i in arr:
        if i > 0:
            result += i
    if result == 0:
        return 0
    else:
        return result

print("Sum of positive is: " + str(positive_sum([1,-2,3])))

# refactoring
def positive_sum(arr):
    return sum(x for x in arr if x > 0)