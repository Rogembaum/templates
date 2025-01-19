def find_needle(haystack):
    for i in range(0,len(haystack)):
        if haystack[i] == 'needle':
            return f"found the needle at position {i}"

def find_needle_refactoring(haystack):
    return f'found the needle at position {haystack.index("needle")}'