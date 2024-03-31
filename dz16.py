text = "Ежевику для ежат принесли два ежа. Ежевику еле-еле ежата возле ели съели."

words = text.split()
count = 0

for word in words:
    if word.lower().startswith("е"):
        count += 1

print("Количество слов, начинающихся с буквы 'е':", count)