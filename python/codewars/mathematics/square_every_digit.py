def square_digits(num):
    str_result = ''
    for i in range(len(str(num))):
        str_result += str(int(str(num)[i]) ** 2)
    return int(str_result)

print(square_digits(811181))

# refactoring
def