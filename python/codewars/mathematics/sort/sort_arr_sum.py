def soft_sum(arr):
    print("before sorted: "+str(arr))

    sorted(arr[:2])
    print("after sorted: " + str(sorted(arr)))
    return sum(sorted(arr[:2]))

print(soft_sum([55,2,88,99,1,101010101]))