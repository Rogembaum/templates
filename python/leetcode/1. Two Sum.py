# 1.
# Two
# Sum
# Easy
# Topics
# premium
# lock
# iconCompanies
# Hint
#
# Given
# an
# array
# of
# integers
# nums and an
# integer
# target,
# return indices
# of
# the
# two
# numbers
# such
# that
# they
# add
# up
# to
# target.
#
# You
# may
# assume
# that
# each
# input
# would
# have
# exactly
# one
# solution, and you
# may
# not use
# the
# same
# element
# twice.
#
# You
# can
# return the
# answer in any
# order.
#
# Example
# 1:
#
# Input: nums = [2, 7, 11, 15], target = 9
# Output: [0, 1]
# Explanation: Because
# nums[0] + nums[1] == 9, we
# return [0, 1].
#
# Example
# 2:
#
# Input: nums = [3, 2, 4], target = 6
# Output: [1, 2]
#
# Example
# 3:
#
# Input: nums = [3, 3], target = 6
# Output: [0, 1]
#
# Constraints:
#
# 2 <= nums.length <= 104
# -109 <= nums[i] <= 109
# -109 <= target <= 109
# Only
# one
# valid
# answer
# exists.
#
# Follow - up: Can
# you
# come
# up
# with an algorithm that is less than O(n2) time complexity?

# if sorting is allowed
def twosumsorted(nums, target):
        nums = sorted(nums)
        result = []
        left = 0
        right = len(nums)-1

        while left < right:
            sum_elem = nums[left] + nums[right]
            if  sum_elem == target:
                return [left,right]
            elif sum_elem > target:
                    right -= 1
            else:
                left += 1

        return result

print(twosumsorted([3,2,4],6))

# if sorting is not allowed
def twosumunsorted(nums,target):
    lookup = {}
    for i, num in enumerate(nums):
        delta = target - num
        if delta in lookup:
            # return delta's index and current index
            return [lookup[delta], i]
        lookup[num] = i
    return []

twosumunsorted([3,2,4],6)