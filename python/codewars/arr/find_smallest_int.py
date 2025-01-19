def find_smallest_int(arr):
    if arr is not None or arr:
        min_integer = arr[0]
        for i in arr:
            if i < min_integer:
                min_integer = i
        return min_integer
    else:
        print("arr is None or empty")

print(find_smallest_int([1,2,-5,-100,1000]))

# refactoring
def findSmallestInt(arr):
    return min(arr)


def findSmallestInt(arr):
    #sort array
    arr.sort()
    return arr[0]

def findSmallestInt(arr):
    smallest = []
    for i in range(0,len(arr)):
        if (arr[i] < smallest):
            smallest = arr[i]
    return smallest