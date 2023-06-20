from collections import deque

# Capacidad máxima de los ferris
CAPACIDAD_MAXIMA = 10

# Inicializar los ferris
Portos = []  # Pila
Celebrian = deque()  # Cola

while len(Portos) < CAPACIDAD_MAXIMA or len(Celebrian) < CAPACIDAD_MAXIMA:
    # Leer matrícula y ferris
    matricula = input("Ingrese la matrícula del auto: ")
    ferris = input("Ingrese el ferris donde irá el auto (P para Portos, C para Celebrian): ")

    # Validar entrada y agregar auto al ferris correspondiente
    if ferris == 'P' and len(Portos) < CAPACIDAD_MAXIMA:
        Portos.append(matricula)
    elif ferris == 'C' and len(Celebrian) < CAPACIDAD_MAXIMA:
        Celebrian.append(matricula)
    else:
        print("El ferris está lleno o la opción ingresada es incorrecta. Por favor, intente nuevamente.")

    # Imprimir el contenido de los ferris
    print("Portos: ", Portos)
    print("Celebrian: ", list(Celebrian))

# Simular que inicia el viaje
print("\n=====================================================================")
print("Los ferris han partido. Los autos no pueden ingresar.")
# Simular el viaje de los ferris
print("Los ferris han completado su viaje. Los autos comenzarán a salir.")
print("=====================================================================\n")

    # Simular que los autos salen de los ferris Portos y Celebrian
while Portos or Celebrian:
    # Sacar auto de Portos
    if Portos:
        # mostrar el auto que sale de Portos
        print(f"\nEl auto {Portos[-1]} ha salido de Portos.")
        # sacar el auto de Portos
        Portos.pop() 
        # mostrar los autos restantes en Portos
        print(f"Autos restantes en Portos: {Portos}")
    
    # Sacar auto de Celebrian
    if Celebrian:
        # mostrar el auto que sale de Celebrian
        print(f"\nEl auto {Celebrian[0]} ha salido de Celebrian.")
        # sacar el auto de Celebrian
        Celebrian.popleft()
        # mostrar los autos restantes en Celebrian
        print(f"Autos restantes en Celebrian: {list(Celebrian)}")
