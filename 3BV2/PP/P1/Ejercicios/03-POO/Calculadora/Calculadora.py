# Clase Calculadora que realiza las operaciones básicas de suma, resta, multiplicación, división y módulo
class Calculadora:
    # Constructor que inicializa los valores de los atributos enteros, flotantes y dobles
    def __init__(self, entero1=10, flotante1=3.14, doble1=5.23456):
        self.entero1 = entero1
        self.flotante1 = flotante1
        self.doble1 = doble1

    # Método que recibe un entero como argumento y devuelve la suma del atributo entero1 y el argumento entero2
    def sumar(self, entero2):
        return self.entero1 + entero2

    # Método que recibe un entero como argumento y devuelve la resta del atributo entero1 y el argumento entero2
    def restar(self, entero2):
        return self.entero1 - entero2

    # Método que recibe un entero como argumento y devuelve la multiplicación del atributo entero1 y el argumento entero2,
    # utilizando el algoritmo de sumas sucesivas
    def multiplicar(self, entero2):
        resultado = 0
        for i in range(entero2):
            resultado += self.entero1
        return resultado

    # Método que recibe un entero como argumento y devuelve la división del atributo entero1 y el argumento entero2,
    # utilizando el algoritmo de restas sucesivas
    def dividir(self, entero2):
        resultado = 0
        while self.entero1 >= entero2:
            self.entero1 -= entero2
            resultado += 1
        return resultado

    # Método que recibe un entero como argumento y devuelve el módulo del atributo entero1 y el argumento entero2
    def modulo(self, entero2):
        return self.entero1 % entero2


# Instancia de la clase Calculadora
calculadora = Calculadora()
# definimos una variable apra almacenar el valor 10
entero2 = 5
# Pruebas de los métodos de la clase Calculadora
print(f"Suma de {calculadora.entero1} + {entero2} = {calculadora.sumar(entero2)}")
print(f"Resta de {calculadora.entero1} - {entero2} = {calculadora.restar(entero2)}")
print(f"Multiplicación de {calculadora.entero1} * {entero2} = {calculadora.multiplicar(entero2)}")
print(f"Módulo de {calculadora.entero1} % {entero2} = {calculadora.modulo(entero2)}")
print(f"División de {calculadora.entero1} / {entero2} = {calculadora.dividir(entero2)}")
