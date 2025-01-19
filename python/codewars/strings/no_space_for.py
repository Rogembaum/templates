def no_space_for(x):
    result=''
    for i in x:
        if i != ' ':
            result += i
    return result

print(no_space_for("qsq      1_ 2      3"))