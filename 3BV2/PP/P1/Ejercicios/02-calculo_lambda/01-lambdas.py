import random


# 1.Escribe un programa en Python que cree una función lambda que sume 15 a cualquier número que se le pase como argumento.
suma = (lambda x: x+15)

# 2.Crea una función lambda que multiplique el argumento de entrada x con el argumento de entrada y. 
multiplica = (lambda x, y: x*y)

# 3.Escribe un programa que proporcione una función 
# lambda que divida el valor de entrada x, entre un número aleatorio 
# (puedes usar la función random() o bien la función random.randint(lower,upper).
divide = (lambda x: x/random.randint(1,10))


# probando las funciones
print(f"La suma de 5 + 15 es: {suma(5)}")
print(f"La multiplicación de 5 * 10 es: {multiplica(5, 10)}")
print(f"La división de 10 entre un número aleatorio es: {divide(10)}")


