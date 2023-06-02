from figura import Figura

class Rectangulo(Figura):
    def __init__(self, largo, ancho):
        super().__init__(largo)
        self.dimension2 = ancho

    def calcular_area(self):
        return self.dimension1 * self.dimension2

    def calcular_perimetro(self):
        return 2 * (self.dimension1 + self.dimension2)
