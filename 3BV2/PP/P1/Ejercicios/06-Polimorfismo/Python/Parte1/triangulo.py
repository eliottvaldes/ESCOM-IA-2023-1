from figura import Figura

class Triangulo(Figura):
    def __init__(self, base, altura):
        super().__init__(base)
        self.dimension2 = altura

    def calcular_area(self):
        return 0.5 * self.dimension1 * self.dimension2

    def calcular_perimetro(self):
        return self.dimension1 * 3
