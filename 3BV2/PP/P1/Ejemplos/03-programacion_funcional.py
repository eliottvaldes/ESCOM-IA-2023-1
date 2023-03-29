import random

def generate_random_array(size= 10, min=1, max=1000):
    return [random.randint(min, max) for i in range(size)]

def main():
    size = int(input("Ingrese el tamaño del arreglo: "))
    min = int(input("Ingrese el valor mínimo: "))
    max = int(input("Ingrese el valor máximo: "))
    array = generate_random_array(size, min, max)
    print(f"El arreglo de tamaño {size} generado es: {array}")

if __name__ == "__main__":
    main()