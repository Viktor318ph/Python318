a = int(input("Количество символов: "))
b = str(input("Тип Символа: "))
print(" 0 - горизонтальная\n 1 - вертикальная")
c = int(input("Ориентация линии: "))

if c == 0:
    qwer = b * a
    print(qwer)
elif c == 1:
    for i in range(a):
        print(b)
else:
    print("Вы задали неверную ориентацию")
