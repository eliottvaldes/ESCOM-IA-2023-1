# definimos una lista de numeros del 1 al 10
nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# mostramos la lista original
print("Original list of integers:")
print(nums)

# mostramos la lista con los numeros elevados al cuadrado
print("\n nmber of the said list:")

# mostramos la lista con los numeros elevados al cubo
# la funcion map() aplica una funcion a cada elemento de la lista
# la funcion que se aplica es la funcion lambda
# la funcion lambda eleva al cuadrado el numero que se le pasa como argumento
square_nums = list(map(lambda x: x ** 2, nums))

# mostramos la lista con los numeros elevados al cubo
print(square_nums)

# mostramos la lista con los numeros elevados al cubo
print("\n every number of the said list:")
# aplicamos otra funcion map() pero esta vez le pasamos otra funcion lambda
# la funcion lambda eleva al cubo el numero que se le pasa como argumento
cube_nums = list(map(lambda x: x ** 3, nums))
print(cube_nums)