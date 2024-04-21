class Person:
    def __init__(self, name, age):
        self.__name = name
        self.__age = age

    @property
    def name(self):
        return self.__name

    @name.setter
    def name(self, value):
        if isinstance(value, str):
            self.__name = value
        else:
            raise ValueError("Имя должно быть строкой.")

    @property
    def age(self):
        return self.__age

    @age.setter
    def age(self, value):
        if isinstance(value, int):
            self.__age = value
        else:
            raise ValueError("Возраст должен быть целым числом.")

    @property
    def info(self):
        return f"Name: {self.name}, Age: {self.age}"

    @name.deleter
    def name(self):
        print("Удаление свойства имя")
        del self.__name

    @age.deleter
    def age(self):
        print("Удаление свойства возраст")
        del self.__age


person = Person("Irina", 26)
print(person.info)

person.name = "Igor"
person.age = 31
print(person.info)

del person.name
del person.age
