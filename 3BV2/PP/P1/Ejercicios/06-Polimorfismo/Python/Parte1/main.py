from triangulo import Triangulo
from circulo import Circulo
from rectangulo import Rectangulo
from hexagono import Hexagono

while True:
    # Mostrar el menú de selección de figuras
    print("\n\n=====================================================================")
    print("Seleccione la figura:\n1. Triángulo\n2. Círculo\n3. Rectángulo\n4. Hexágono\n5. Salir")
    seleccion = int(input())  # Leer la opción seleccionada por el usuario

    if seleccion == 1:
        print("\n------------------")
        base = float(input("Ingrese la base del triángulo: "))  # Leer la base del triángulo
        print("\n------------------")
        altura = float(input("Ingrese la altura del triángulo: "))  # Leer la altura del triángulo
        figura = Triangulo(base, altura)  # Crear una instancia de Triangulo con los valores ingresados
    elif seleccion == 2:
        print("\n------------------")
        radio = float(input("Ingrese el radio del círculo: "))  # Leer el radio del círculo
        figura = Circulo(radio)  # Crear una instancia de Circulo con el radio ingresado
    elif seleccion == 3:
        print("\n------------------")
        largo = float(input("Ingrese el largo del rectángulo: "))  # Leer el largo del rectángulo
        print("\n------------------")
        ancho = float(input("Ingrese el ancho del rectángulo: "))  # Leer el ancho del rectángulo
        figura = Rectangulo(largo, ancho)  # Crear una instancia de Rectangulo con los valores ingresados
    elif seleccion == 4:
        print("\n------------------")
        lado = float(input("Ingrese el lado del hexágono: "))  # Leer el lado del hexágono
        figura = Hexagono(lado)  # Crear una instancia de Hexagono con el lado ingresado
    elif seleccion == 5:
        print("\n------------------")
        print("Saliendo del programa...")
        break  # Salir del ciclo while y terminar el programa
    else:
        print("Selección inválida")
        continue  # Volver al inicio del ciclo para solicitar nuevamente una figura

    # Calcular y mostrar el área y perímetro de la figura seleccionada
    print("\n------------------")
    print("Área: ", figura.calcular_area())
    print("Perímetro: ", figura.calcular_perimetro())
    print()
