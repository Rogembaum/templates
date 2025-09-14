# Задача: Найти пару чисел в отсортированном массиве, сумма которых равна заданному числу
#
# Условие:
# Дан отсортированный по возрастанию массив целых чисел nums и целое число target.
# Нужно найти индексы двух чисел, сумма которых равна target.
# Используй метод двух указателей.
#         l  r
# nums = [1, 2, 4, 7, 11, 15]
# target = 15
# # Ожидаемый результат: индексы (1, 4) → числа 4 + 11 = 15
"""
 unit tests:
 1: 
         l  r  
 nums = [1, 2, 4, 7, 11, 15]
 ...
         l                r  
 nums = [1, 2, 4, 7, 11, 15]
 
 ...
                    l    r  
 nums = [1, 2, 4, 7, 11, 15]
 
"""

def two_sum(nums, target):
    left_index = 0
    right_index = len(nums)-1

    while left_index < right_index:
        result_sum = nums[left_index] + nums[right_index]

        if result_sum == target:
            return left_index, right_index
        elif result_sum > target:
                right_index -= 1
        else:
                left_index +=1

    return None


print(two_sum([1,2,3,7,9,123],4))