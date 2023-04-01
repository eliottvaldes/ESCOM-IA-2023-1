# definir una funcion lambda que devuelva una funcion lambda que multiplique el argumento de entrada x con el argumento de entrada y.
def func_compute(n):
    return lambda x : x * n

# Llamamos a la funcion func_compute() con un argumento 2 y guardamos el resultado en la variable doble.
result = func_compute(2)
# Llamamos a la funcion lambda, usando la variable doble, con un argumento 15 y guardamos el resultado en la variable result.
print("Double the number of 15 =", result(15))
