# define la lista de números.
nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# imprime la lista original de números en la pantalla.
print("Original list of integers:")
print(nums)

# imprime un mensaje en la pantalla que indica que los números pares se imprimirán a continuación.
print("\numbers from the said list:")
# utiliza la función filter de Python para crear una nueva lista llamada even_nums que contiene solo los números pares de la lista original nums. La función filter toma dos argumentos: una función que especifica el criterio para incluir un elemento en la nueva lista y la lista original. En este caso, se utiliza una función lambda para especificar que solo se deben incluir números pares. La función lambda toma un número como entrada y devuelve True si el número es par y False si es impar. 
# La lista de números nums se pasa como segundo argumento.
even_nums = list(filter(lambda x: x%2 == 0, nums))
# imprime la lista de números pares even_nums en la pantalla.
print(even_nums)

# imprime un mensaje en la pantalla que indica que los números impares se imprimirán a continuación.
print("\numbers from the said list:")
# utiliza nuevamente la función filter de Python para crear una nueva lista llamada odd_nums que contiene solo los números impares de la lista original nums. En este caso, la función lambda utilizada especifica que solo se deben incluir números impares. La función lambda toma un número como entrada y devuelve True si el número es impar y False si es par. La lista de números nums se pasa como segundo argumento.
odd_nums = list(filter(lambda x: x%2 != 0, nums))
# imprime la lista de números impares odd_nums en la pantalla.
print(odd_nums)

"""
En resumen, el código utiliza las funciones filter y lambda para separar la lista original de números en dos nuevas listas: una lista que contiene solo números pares y otra que contiene solo números impares.
"""