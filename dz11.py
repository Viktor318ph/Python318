def create_dict(*args):
    result_dict = {}
    for i in args:
        result_dict[i] = i
    return result_dict


print(create_dict(1, 2, 3, 4))
print(create_dict('grey', (2, 17), 3.11, -4))
