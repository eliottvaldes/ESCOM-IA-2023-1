# definimos una lista de tuplas con las asignaturas y sus notas
subject_marks = [('English', 88), ('Science', 90), ('Maths', 97), ('Social sciences', 82)]
# imprimimos la lista original
print("Original list of tuples:")
print(subject_marks)

# ordenamos la lista de tuplas por la nota de menor a mayor
# usamos una funcion lambda para ordenar la lista. 
# La funcion lambda toma como argumento una tupla y devuelve el segundo elemento de la tupla
subject_marks.sort(key = lambda x: x[1])

# imprimimos la lista ordenada
print("\nReult:")
print(subject_marks)
