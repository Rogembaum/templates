def title_space(str):
    result = ''
    for i in str.split(" "):
        if result == '':
            result += i[0] +"."
        else:
            result += i[0]
    return result.title()

print(title_space("saffs Pdfse"))



# refactoring
def abbrevName(name):
    return '.'.join(w[0] for w in name.split()).upper()


def abbrevName(name):
    first, last = name.upper().split(' ')
    return first[0] + '.' + last[0]