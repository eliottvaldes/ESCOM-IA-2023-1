from estudiante import Estudiante
from docente import Docente
from paae import PAAE

estudiante = Estudiante('1', 'Juan', 'CURPJUAN1234', 'Calle 123')
docente = Docente('2', 'Maria', 'CURPMARIA5678', 'Calle 456')
paae = PAAE('3', 'Carlos', 'CURPCARLOS9012', 'Calle 789')

print('Por favor, selecciona una opción:')
print('1. Estudiante')
print('2. Docente')
print('3. PAAE')

opcion = int(input())

persona_seleccionada = None

if opcion == 1:
    persona_seleccionada = estudiante
elif opcion == 2:
    persona_seleccionada = docente
elif opcion == 3:
    persona_seleccionada = paae
else:
    print('Opción inválida')
    exit(1)

print('ID:', persona_seleccionada.get_id())
print('Nombre:', persona_seleccionada.get_nombre())
print('CURP:', persona_seleccionada.get_curp())
print('Domicilio:', persona_seleccionada.get_domicilio())
