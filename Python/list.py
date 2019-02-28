#!/usr/bin/env python3

def mergeSort(xs : list):
    l = len(xs)
    if l == 0:
        return []
    elif l == 1:
        return xs

    mid = int(l / 2)
    fst = xs[0:mid]
    snd = xs[mid:]

    return merge(mergeSort(fst), mergeSort(snd))

def merge(a : list, b : list):
    if len(a) == 0:
        return b
    elif len(b) == 0:
        return a
    else:
        if a[-1] > b[-1]:
            v = a.pop()
        else:
            v = b.pop()

        r = merge(a, b)
        r.append(v)

        return r

print(mergeSort([2, 7, 1, 2, 6, 0, 2, 5]))