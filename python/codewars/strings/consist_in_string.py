def billboard(name, price=30):
    if name == "*" not in name:
        return len(name)*price
    else:
        return -1

print(billboard("123*123"))