def century_from_year(year):
    result = year // 100
    if (year > result * 100):
        return result + 1
    else:
        return result

print(century_from_year(205))


# refactoring
def century(year):
    return (year + 99) // 100


def century(year):
    return (year / 100) if year % 100 == 0 else year // 100 + 1