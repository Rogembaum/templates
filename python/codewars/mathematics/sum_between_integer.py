def get_sum(a, b):
    result = 0
    if a == b:
        return a
    length = abs(a + b)
    if a > b:
        result = b
        for i in range(length):
            result += b + 1
    else:
        print("b > a")
        result = a
        for i in range(length):
            result += a + 1

    return result


print(get_sum(0, 5))
