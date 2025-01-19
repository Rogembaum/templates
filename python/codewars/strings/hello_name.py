def hello(name=None):
    if name == "" or name is None:
        return "Hello, World!"
    else:
        name = name.title()
        return f"Hello, {name}!"

print(hello())