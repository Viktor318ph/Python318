
class Car:
    def __init__(self, model, year, manufacturer, engine_power, color, price):
        self.model = model
        self.year = year
        self.manufacturer = manufacturer
        self.engine_power = engine_power
        self.color = color
        self.price = price

    def set_model(self, model):
        self.model = model

    def get_model(self):
        return self.model

    def set_year(self, year):
        self.year = year

    def get_year(self):
        return self.year

    def set_manufacturer(self, manufacturer):
        self.manufacturer = manufacturer

    def get_manufacturer(self):
        return self.manufacturer

    def set_engine_power(self, engine_power):
        self.engine_power = engine_power

    def get_engine_power(self):
        return self.engine_power

    def set_color(self, color):
        self.color = color

    def get_color(self):
        return self.color

    def set_price(self, price):
        self.price = price

    def get_price(self):
        return self.price

    def display_data(self):
        print(" Данные автомобиля ".center(40, "*"))
        print(f"Название модели: {self.model}\nГод выпуска: {self.year}\nПроизводитель: {self.manufacturer}\n"
              f"Мощность двигателя: {self.engine_power}\nЦвет машины: {self.color}\nЦена: {self.price}")
        print("Название модели:", self.model)
        print("=" * 40)


car = Car("X7 M50i", 2021, "BMW", "530 л.с.", "white", 10790000)
car.display_data()