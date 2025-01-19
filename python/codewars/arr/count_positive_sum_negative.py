def count_positives_sum_negatives(arr):
    result = [0, 0]
    if not arr or arr is None:
        return arr
    for i in arr:
        if i > 0:
            result[0] += 1
        else:
            result[1] += i
    return result


print(count_positives_sum_negatives([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, -11, -12, -13, -14, -15]))