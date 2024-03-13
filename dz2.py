num = int(input("Введите пятизначное число: "))

a = num % 10
# print("a:", a)
num = num // 10

b = num % 10
# print("b:", b)
num = num // 10

c = num % 10
# print("c:", c)
num = num // 10

d = num % 10
# print("d:", d)
num = num // 10

f = num % 10
# print("f:", f)
num = num // 10

res = a * b * c * d * f
print("Произведение цифр числа: ", res)
sum1 = a + b + c + d + f
m = sum1 / 5
print("Среднее арифметическое: ", m)



