from figura import Figura
import math

class Circulo(Figura):
    def __init__(self, radio):
        super().__init__(radio)

    def calcular_area(self):
        return math.pi * self.dimension1 ** 2

    def calcular_perimetro(self):
        return 2 * math.pi * self.dimension1
