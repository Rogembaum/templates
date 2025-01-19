def likes(names):
    match names:
        case [name]:
            return f'{name} likes this'
        case[name1, name2]:
            return f'{name1} and {name2} like this'
        case[name1, name2, name3]:
            return f'{name1}, {name2} and {name3} like this'
        case[name1, name2, *rest]:
            return f'{name1}, {name2} and {len(rest)} others like this'
        case _:
            return 'no one likes this'

print(likes(["Peter", "John", "Steve", "Kate"]))
# print(likes(["123", "456"]))
