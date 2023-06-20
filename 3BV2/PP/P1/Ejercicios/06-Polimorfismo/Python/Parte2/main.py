from estudiante import Estudiante
from docente import Docente
from paae import PAAE

# Crear instancias de Estudiante, Docente y PAAE
estudiante = Estudiante('1', 'Eliot', 'CURPELIOT1234', 'Calle 123')
docente = Docente('2', 'Jaime', 'CURPJAIME5678', 'Calle 456')
paae = PAAE('3', 'Itzel', 'CURPITZEL9012', 'Calle 789')

while True:
    print("\n\n=====================================================================")
    print('Por favor, selecciona una opción:')
    print('1. Estudiante')
    print('2. Docente')
    print('3. PAAE')
    print('4. Salir')

    opcion = int(input())  # Leer la opción seleccionada por el usuario

    if opcion == 1:
        persona_seleccionada = estudiante
    elif opcion == 2:
        persona_seleccionada = docente
    elif opcion == 3:
        persona_seleccionada = paae
    elif opcion == 4:
        print('Saliendo del programa...')
        break  # Salir del ciclo while y finalizar el programa
    else:
        print('Opción inválida')
        continue  # Volver al inicio del ciclo para solicitar nuevamente una opción

    # Mostrar la información de la persona seleccionada
    print("\n------------------")
    print('ID:', persona_seleccionada.get_id())
    print('Nombre:', persona_seleccionada.get_nombre())
    print('CURP:', persona_seleccionada.get_curp())
    print('Domicilio:', persona_seleccionada.get_domicilio())
    print()
