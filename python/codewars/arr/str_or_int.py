def filter_list(l):
    for i in l:
        if isinstance(l[i],str):
            l.remove(l[i])
    return l