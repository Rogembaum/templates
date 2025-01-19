def fake_bin(digit_string):
    result = ''
    for i in digit_string:
        if int(i) < 5:
            result.join('0')
            result += '0'
            print("below 5, result = "+result)
        else:
            result.join('1')
            print("above 5, result = " + result)
            result += '1'
    return result

def refactoring_fake_bin(digit_string):
    return ''.join('0' if i < '5' else '1' for i in digit_string)

print(fake_bin("12345"))

print(refactoring_fake_bin("12345"))