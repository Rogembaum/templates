def repeat_str(repeat, string):
    result = ''
    while repeat > 0:
        result += string
        repeat -= 1
    return result

def repeat_str(repeat, string):
    solution = ""
    for i in range(repeat):
        solution += string
    return solution


def repeat_str(repeat, string):
    return repeat * string

repeat_str(5,"abc ")