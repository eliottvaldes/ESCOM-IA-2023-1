from figura import Figura
import math

class Hexagono(Figura):
    def __init__(self, lado):
        super().__init__(lado)

    def calcular_area(self):
        return (3 * math.sqrt(3) * self.dimension1 ** 2) / 2

    def calcular_perimetro(self):
        return 6 * self.dimension1
