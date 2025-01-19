def smash(words):
    result = ''
    length = len(words)
    for i in range(len(words)-1):
        result += words[i]
        if i == length and length >= 1:
            result += str(i)
        else:
            result += str(i) + ' '
    return result

print(smash(['hello']))