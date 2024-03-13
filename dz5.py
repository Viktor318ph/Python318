a = [int(input("-> ")) for i in range(int(input("Введите элементы списка\n n = ")))]
k = int(input("Введите индекс\n k = "))
for i in range(k, len(a)):
    a[i - 1] = a[i]
a.pop()
print("Результат: ", a)
