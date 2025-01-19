def count_sheeps(arrayOfSheeps):
  return arrayOfSheeps.count(True)

def count_sheeps(sheep):
    return sum(1 for i in sheep if i is True)


def count_sheeps(sheep):
    result = 0
    for i in sheep:
        if i is True:  # Only count actual True values
            result += 1
    return result
