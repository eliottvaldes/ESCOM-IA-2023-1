from collections import deque

class Ferry:
    def __init__(self, name, structure):
        self.name = name
        self.structure = structure
        self.cars = deque()

    def add_car(self, car):
        if len(self.cars) < 10:
            self.cars.append(car)
            print(f"Car {car} added to {self.name}")
            print(self.name, "contains: ", self.cars)
        else:
            print(f"{self.name} is full")

    def release_cars(self):
        print(f"{self.name} starts its journey.")
        while self.cars:
            if self.structure == 'P':
                print(f"Car {self.cars.pop()} left from {self.name}")
            else:
                print(f"Car {self.cars.popleft()} left from {self.name}")
            print(self.name, "contains: ", self.cars)


Portos = Ferry('Portos', 'P')
Celebrian = Ferry('Celebrian', 'C')

# Simulate reading car plates and which ferry it will go
cars = [('A123BC', 'P'), ('B234CD', 'P'), ('C345DE', 'C'), ('D456EF', 'C')]
for car, ferry in cars:
    if ferry == 'P':
        Portos.add_car(car)
    else:
        Celebrian.add_car(car)

Portos.release_cars()
Celebrian.release_cars()
