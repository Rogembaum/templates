def next_id(arr):
    min_used_number = 0
    unique_num = set(arr)

    if arr == []:
        return 0

    while min_used_number in unique_num:
        min_used_number += 1
    return min_used_number

def next_id_refactoring(arr):
    t = 0
    while t in arr:
        t += 1
    return t

print(next_id_refactoring([0,1,2,3,4,5,6,7,8,9,10]))
print(next_id_refactoring([]))