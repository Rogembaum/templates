def descending_order(num):
    sorted_digits = sorted(str(num), reverse=True)
    sorted_num = int(''.join(sorted_digits))
    return  sorted_num