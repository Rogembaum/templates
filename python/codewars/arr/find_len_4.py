def friend(x):
    friends = []
    for i in x:
        if len(i) == 4:
            friends.append(i)
    return friends

print(friend(["1234", "123","12", "12345"]))

# refactoring
def friend(x):
    return [f for f in x if len(f) == 4]