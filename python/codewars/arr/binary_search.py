# Напиши функцию binary_search(arr, target), которая принимает отсортированный по возрастанию список
# целых чисел arr и число target.
# Функция должна вернуть индекс элемента, равного target,
# если он есть в массиве, или -1, если такого элемента нет.

# arr = [1, 3, 5, 7, 9, 11]
#
# print(binary_search(arr, 7))   # должно вывести 3
# print(binary_search(arr, 2))   # должно вывести -1

def binary_search(arr, target):
    left = 0
    right = len(arr)-1

    while left <= right:
        middle_index = (left + right) // 2
        middle_value = arr[middle_index]

        if middle_value == target:
            return middle_index
        elif middle_value > target:
            right = middle_index - 1
        else:
            left = middle_index + 1

    return -1
print(binary_search([1,2,4,7,8,99,12314,466855,111111111,111111111111111,1111111111111111111,999999999999999999999999],466855))