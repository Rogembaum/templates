def bubble_sort_ray(arr):
    for i in range(len(arr)-1):
        print("#: "+str(i))
        swapped = False
        for j in range(len(arr)-1-i):
            print("##: " + str(j))
            if arr[j] > arr[j+1]:
                print(str(arr[j])+" is more than "+str(arr[j+1])+ " - let's swapped")
                arr[j],arr[j+1] = arr[j+1], arr[j]
                swapped = True
            else:
                print(str(arr[j]) + " is less than " + str(arr[j + 1]) + " - let's NOT swapped")
        if not swapped:
            break
    return arr

print(bubble_sort_ray([11,22,33,44]))