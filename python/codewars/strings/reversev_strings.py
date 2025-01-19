def reverseString(string):
    result = ''
    for i in range(len(string)-1,-1,-1): #len starts with 1, string's index start with 0
        # print(string[i])
        result+= string[i]
    print(result)
    return result


reverseString("123abc")

# refactoring
def solution(str):
  return str[::-1]