from triangulo import Triangulo
from circulo import Circulo
from rectangulo import Rectangulo
from hexagono import Hexagono

print("Seleccione la figura:\n1. Triángulo\n2. Círculo\n3. Rectángulo\n4. Hexágono")
seleccion = int(input())

if seleccion == 1:
    base = float(input("Ingrese la base del triángulo: "))
    altura = float(input("Ingrese la altura del triángulo: "))
    figura = Triangulo(base, altura)
elif seleccion == 2:
    radio = float(input("Ingrese el radio del círculo: "))
    figura = Circulo(radio)
elif seleccion == 3:
    largo = float(input("Ingrese el largo del rectángulo: "))
    ancho = float(input("Ingrese el ancho del rectángulo: "))
    figura = Rectangulo(largo, ancho)
elif seleccion == 4:
    lado = float(input("Ingrese el lado del hexágono: "))
    figura = Hexagono(lado)
else:
    print("Selección inválida")
    exit()

print("Área: ", figura.calcular_area())
print("Perímetro: ", figura.calcular_perimetro())
