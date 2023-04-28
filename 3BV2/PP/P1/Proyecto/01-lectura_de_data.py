import os
import pandas as pd

# Obtener la ruta completa del archivo
ruta_archivo = os.path.join(os.getcwd(), 'iris.data')

print(ruta_archivo)

# Verificar si el archivo existe
if os.path.exists(ruta_archivo):
    # Leer el archivo
    data = pd.read_csv(ruta_archivo, header=None, names=['largo', 'ancho', 'alto', 'anchoSepalo', 'especie'])

    # Verificar que se haya leído correctamente
    # mostramos los primeros 5 registros
    print(data.head())

    # mostramos los últimos 5 registros
    print(data.tail())

else:
    print('Error: el archivo no se encuentra en la ubicación especificada.')


