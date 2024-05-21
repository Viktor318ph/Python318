class Value:
    def __init__(self, value_type):
        self.value_type = value_type

    def __get__(self, instance, owner):
        return instance.__dict__[self.value_type]

    def __set__(self, instance, value):
        if value <= 0:
            raise ValueError("Значение должно быть положительным")
        instance.__dict__[self.value_type] = value


class Order:
    price = Value('price')
    quantity = Value('quantity')

    def __init__(self, name, price, quantity):
        self.name = name
        self.price = price
        self.quantity = quantity


order = Order('apple', 5, 10)
total = order.price * order.quantity
print("Сумма:", total)
print(order.__dict__)