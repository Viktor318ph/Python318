# first_name = "Nikolay"
# print("Hello," + first_name + "!")

# a = 30
# b = "Hello"
# c = 2.8
# print(type(a))
# print(type(c))
# print(type(b))

# a = 5
# print(a, type(a))
# b = "Hello"
# print(b, type(b))
# print(str(a) + b)

# a = 5
# print(a, id(a))
# b = 4
# print(b, id(b))
# a = b
# print(a, id(a))

# a = b = c = 4
# print(a, b, c)

# a, b, c = 5, "Hello", 9.2
# print(a, b, c)

# PI = 3.14
# print(PI)
# PI = 2
# print(PI)

# a = 1
# b = 2
# print("a:", a)
# print("b:", b)
# a, b = b, a
# # c = a  # c = 1
# # a = b  # a = 2
# # b = c  # b = 1
# print("a:", a)
# print("b:", b)
#
# print("строка \t\tсимволов строка \
#       символов строка символов \
#       строка символов строка символов \
#       строка символов строка символов строка символов")
# print('строка символов')

# s1 = "Hello"
# s2 = "Phyton"
# s3 = s1 + ", " + s2 + "!"
# print(s3)
# print(s1 * 5)

# print(4358349534957395395395045035)
# print(4.358349534957395395395045035)


# print(6 + 2)
# print(6 - 2)
# print(6 * 2)
# print(6 / 2)  # 3.0
# print(6 / 4)  # 1.5
#
# print(6 // 2)  # 3
# print(6 // 4)  # 1
#
# print(6 ** 3)
# print(6 % 4)


# a = 10
# b = 20
#
# print("a:", a)
# print("b:", b)
#
# a = a * b
# b = a // b
# a = a // b
#
# print("a:", a)
# print("b:", b)


# number = (6 + 4) * (5 ** 2 + 7)
# print(number)

# num = 10
# num +=5
# print(num)
#
# num -= 3
# print(num)

# num = 4321
# print(num)
# a = num % 10
# print("a:", a)
# num = num // 10
# # print(num)
# b = num % 10
# print("b:", b)
# num = num // 10
# # print(num)
# c = num % 10
# print("c:", c)
# num = num // 10
# # print(num)
# d = num % 10
# print("d:", d)
# print(a * 1000 + b * 100 + c * 10 + d)

# num = 4321
# print(num)
# res = num % 10 * 1000
# num //= 10
# res += num % 10 * 100
# num //= 10
# res += num % 10 * 10
# num //= 10
# res += num % 10
# print(res)

# num1 = "2.5"
# num2 = 3
# # res = num1 + str(num2)
# # print(res)
# res = float(num1) + num2
# print(res)

# print(int(2.5))
# print(round(2.51))
# print(round(2.519, 2))

# a = 2.519
# b = round(a)
# print(b, type(b))
# c = round(a, 2)
# print(c, type(c))

# name = "Виктор"
# age = 28
# print("Меня зовут " + name + ". Мне " + str(age) + " лет.")
# print("Меня зовут ", name, ". Мне ", age, " лет.", sep="", end="\n\n")
# print("Hello")

# name = input("Введите имя: ")
# print("Hello,", name)

# num = input("Введите число: ")
# power = input("Введите степень: ")
#
# num = int(num)
# power = int(power)
#
# res = num ** power
# print("Число", num, "в степени", power, "равно: ", res)

# print("Введите четыре числа: ")
# num1 = int(input("1: "))
# num2 = int(input("2: "))
# num3 = int(input("3: "))
# num4 = int(input("4: "))
# print("Результат: ", round((num1+num2) / (num3+num4), 2))

# b1 = True
# b2 = False
# print(b1 + 5)  # 1 + 5 = 6
# print(b2 + 5)  # 0 + 5 = 5

# print(bool("python"))  # True
# print(bool(""))  # False
# print(bool(" "))  # True
# print(bool(3454))  # True
# print(bool(-3))  # True
# print(bool(4.2))  # True
# print(bool(0))  # False
# print(bool(0.0))  # False
# print(bool(False))  # False
# print(bool(None))  # False

# test = None
# print(test)
# test = 5
# print(test)

# print(7 == 7)
# print(2 + 5 == 7)
# print(7 != 10 - 3)
# print(8 > 5)
# print(8 < 5)
# print(8 >= 8)
# print(8 <= 8)
# print("привет" > "Привет")

# print(2 < 4 < 9)
# print(2 * 5 > 7 >= 4 + 3)
# print(3 * 3 <= 7 >= 2)

# a = 10
# b = 5
# c = a == b
# print(a, b, c)

# print(5 - 3 == 2 and 1 + 3 == 4)
# print(5 - 3 == 2 and 1 + 3 < 4)
# print(5 - 3 > 2 and 1 + 3 == 4)
# print(5 - 3 > 2 and 1 + 3 < 4)

# print(not 9 - 5)
# print(not 9 - 9)

# cnt = 15
# if cnt < 10:
#     cnt += 1
# print(cnt)

# age = int(input("Введите свой возраст: "))
# if age >= 18:
#     print("Доступ на сайт разрешён")
#     # ...
#     # pass
# else:
#     print("Доступ запрещён")

# a = 25
# b = 25
# if a > b:
#     print("a > b")
# elif b > a:
#     print("b > a")
# else:
#     print("a == b")

# a = int(input('Введите первую сторону: '))
# b = int(input('Введите вторую сторону: '))
# c = int(input('Введите третью сторону: '))
# if a == b == c:
#     print('Треугольник равносторонний')
# elif a == b or a == c or b == c:
#     print('Треугольник равнобедренный')
# else:
#     print('Треугольник разносторонний')

# day = int(input("Введите день недели (цифрой): "))
# if (day >= 1) and (day <= 5):  #  1 <= day <= 5
#     print("Рабочий день", end=" ")
#     if day == 1:
#         print("понедельник")
#     if day == 2:
#         print("вторник")
#     if day == 3:
#         print("среда")
#     if day == 4:
#         print("четверг")
#     if day == 5:
#         print("пятница")
# elif day == 6 or day == 7:
#     print("Выходной день -", end=" ")
#     if day == 6:
#         print("суббота")
#     if day == 7:
#         print("воскресенье")
# else:
#     print("Такого дня недели не существует!")

# a = int(input("Введите номер месяца: "))
# if 1 <= a <= 12:
#     if 3 <= a <= 5:
#         print("Весна")
#     elif 6 <= a <= 8:
#         print("Лето")
#     elif 9 <= a <= 11:
#         print("Осень")
#     else:
#         print("Зима")
# else:
#     print("Ошибка ввода данных")


# n = int(input("Введите кол-во ворон: "))
# if 0 <= n <= 9:
#     print("На ветке", end=" ")
#     if n == 1:
#         print(n, "ворона")
#     elif 2 <= n <= 4:
#         print(n, "вороны")
#     else:
#         print(n, "ворон")
# else:
#     print("Ошибка ввода данных")


# n = int(input("Введите кол-во ворон: "))
# if 0 <= n <= 9:
#     print("На ветке", end=" ")
#     if n == 1:
#         print(n, "ворона")
#     if 2 <= n <= 4:
#         print(n, "вороны")
#     if 5 <= n <= 9 or n == 0:
#         print(n, "ворон")
# else:
#     print("Ошибка ввода данных")


# password = "user"
#
# match password:
#     case 'admin':
#         print("Администратор")
#     case 'user':
#         print("Пользователь")
#     case _:
#         print("Такого значения не существует")


# day = "понедельник"
# time = 17
#
# match day:
#     case 'понедельник' | 'вторник' | 'среда' | 'четверг' | 'пятница' if 9 <= time <= 16:
#         print("Рабочий день")
#     case 'суббота' | 'воскресенье':
#         print("Выходной день")
#     case _:
#         print("Такого дня недели не существует или нерабочее время")

# a, b = 10, 20
# minim = a if a < b else b
# print(minim)


# a, b = 50, 30
# print("a == b" if a == b else "a > b" if a > b else "b > a")


# a, b = 20, 5
# print('на ноль делить нельзя' if b == 0 else a / b)
# print(a / b)


# a = 5
# b = 0
# print(a / b)


# try:
#     n = int(input("Введите целое число: "))
#     print(n * 2)
# except ValueError:
#     print("Что-то пошло не так")


# try:
#     n = int(input("Введите делимое: "))
#     m = int(input("Введите делитель: "))
#     print(n / m)
# except (ValueError, ZeroDivisionError):
#     print("Нельзя вводить строки или нельзя делить на ноль")
# else:
#     print("Всё нормально. Вы ввели числа", n, "и", m)
# finally:
#     print("Конец программы")


# n = input("Введите первое число")
# m = input("Введите второе число")
#
# try:
#     print(int(n) + int(m))
# except ValueError:
#     print(n + m)


# n = input("Введите первое число")
# m = input("Введите второе число")
#
# try:
#     n = int(n)
#     m = int(m)
# except ValueError:
#     n = str(n)
# finally:
#     print(n + m)


# Циклы

# i = 0
# while i < 5:
#     print("i =", i)
#     i += 1   # i = i + 1


# i = 10
# while i > 0:
#     print("i =", i)
#     i -= 2


# i = 1
# while i <= 20:
#     if i % 2 == 0:
#     print("i =", i)
#     i += 1


# n = int(input("Укажите количество символов: "))
# print(n * "+-")  # +-+-+
# print( n * "+" if n % 2 == 0 else n * "-")
#
# i = 0
# while i < n:
#     if i % 2 == 0:
#         print("+", end="")
#     else:
#         print("-", end="")
#     i += 1
#
# while n > 0:
#     print("*")
#     n -= 1


# n = int(input("Введите начало диапазона: "))
# m = int(input("Введите конец диапазона: "))
# # sum = 0
# while n <= m:
#     print(n, end=" ")
#     if n % 2:
#     # sum += n
#     n += 1
# # print(sum)


# n = input("Введите целое число: ")
#
# while type(n) != int:
#     try:
#         n = int(n)
#     except ValueError:
#         print("Чистое не целое")
#         n = input("Введите целое число: ")
#
# if n % 2 == 0:
#     print("Чётное")
# else:
#     print("Нечётное")


# i = 0
# while i < 10:
#     if i == 3:
#         i += 1
#         continue
#     print(i, end=" ")
#     if i == 5:
#         break
#     i += 1
#     print("\nЦикл завершён")


# i = 0
# while True:
#     print(i)
#     if i == 5:
#         break
#     i += 1


# while True:
#     n = int(input("Введите положительное число: "))
#     if n < 0:
#         break

# summ = 1
# while True:
#     n = int(input("Введите число: "))
#     if n == 0:
#         break
#     summ *= n
#
# print(summ)


# i = 0
# while i < 10:
#     if i == 5:
#         break
#     print(i)
#     i += 1
# else:
#     print("Цикл окончен, i =", i)


# i = 1
# while i < 5:
#     print("Внешний цикл: i=", i)
#     j = 1
#     while j < 4:
#         print("\tВнутренний цикл: j =", j)
#         j += 1
#     i += 1

# a = [0] * int(input("Введите количество элементов списка: "))
# print(a)
# for i in range(3):
#     a[i] = int(input("-> "))
# print(a)

# a = [int(input("-> ")) for i in range(int(input("n = ")))]
# print(a)

# summ = 0
# a = [int(input("->")) for i in range(int(input("n = ")))]
# for i in range(len(a)):
#     if a[i] < 0:
#         summ += a[i]
# print(summ)

# s = list(range(10, 100, 10))
# print(s)
#
# for i in range(len(s)):
#     print(i, end=" ")

# print("Вносим изменения")

print("Данные переносим на GitHub")
