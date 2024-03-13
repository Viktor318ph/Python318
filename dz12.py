def outer(a, b, c):
    s = 0

    def inner(i, j):
        nonlocal s
        s += i * j

    inner(a, b)
    inner(a, c)
    inner(b, c)
    return 2 * s


print(outer(2, 4, 6))
print(outer(5, 8, 2))
print(outer(1, 6, 8))
