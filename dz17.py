import re


def check_password(password):
    return re.findall("^[A-Za-z0-9-@_]{6,18}$", password)


print(check_password("super@_-Python"))