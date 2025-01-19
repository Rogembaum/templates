# accum("abcd") -> "A-Bb-Ccc-Dddd"
# accum("RqaEzty") -> "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
# accum("cwAt") -> "C-Ww-Aaa-Tttt"

def accum(st):
    result = ''
    for i in range(len(st)):
        result += st[i].upper()
        for j in range(i):
            result += st[i].lower()
        result += '-'
    return result[:-1]

print(accum("ZpglnRxqenU"))
