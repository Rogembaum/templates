def find_short(s):
    # arr = list(s.split())
    # min_len = len(arr[2])
    # min_len_2 = list(map(len, list(s.split())))
    # for i in arr:
    #     if len(i) < min_len:
    #         min_len = len(i)
    return min(list(map(len, list(s.split()))))

print(find_short("asqqqqqqqq asd222222 a2222222222222sdgf"))