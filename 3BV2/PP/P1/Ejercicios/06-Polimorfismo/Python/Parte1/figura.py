from abc import ABC, abstractmethod
import math

class Figura(ABC):
    def __init__(self, dimension1):
        self.dimension1 = dimension1

    @abstractmethod
    def calcular_area(self):
        pass

    @abstractmethod
    def calcular_perimetro(self):
        pass
