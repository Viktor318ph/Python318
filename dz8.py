from random import randint


def ran(a, b):
    return tuple(randint(a, b) for i in range(10))


tpl1 = ran(0, 5)
tpl2 = ran(-5, 0)
print(tpl1)
print(tpl2)
tpl3 = tpl1 + tpl2
print(tpl3)
print("0 =", tpl3.count(0))

