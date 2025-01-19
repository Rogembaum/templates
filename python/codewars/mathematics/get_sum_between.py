def get_sum(a,b):

    if a == b:
        return a

    minimum = min(a,b)
    result = 0

    while minimum <= max(a,b):
            result += minimum
            minimum += 1
    return result

print(f"Result: {get_sum(-1,-10)}")

def get_sum_refactor(a,b):
    return sum(range(min(a, b), max(a, b) + 1))