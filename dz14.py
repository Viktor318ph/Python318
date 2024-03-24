def avg(fn):
    def wrap(*args):
        return fn(*args) / len(args)

    return wrap


@avg
def summa(*args):
    return sum(args)


print(summa(2, 3, 3, 4))
