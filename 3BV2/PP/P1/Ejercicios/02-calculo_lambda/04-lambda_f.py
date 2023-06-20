# Importa el módulo datetime, que proporciona clases para trabajar con fechas y horas.
import datetime  

# Obtiene la fecha y hora actual y la asigna a la variable "now".
now = datetime.datetime.now()  
# Imprime la fecha y hora actual.
print(f"Current date and time => {now}")

# Define una función lambda llamada "year" que devuelve el año de una fecha dada.
year = lambda x: x.year  
# Define una función lambda llamada "month" que devuelve el mes de una fecha dada.
month = lambda x: x.month  
# Define una función lambda llamada "day" que devuelve el día de una fecha dada.
day = lambda x: x.day  
# Define una función lambda llamada "t" que devuelve la hora de una fecha dada.
t = lambda x: x.time()  

# Imprime el año de la fecha actual.
print(f"Current year is => {year(now)}")

# Imprime el mes de la fecha actual.
print(f"Current month is => {month(now)}")

# Imprime el día de la fecha actual.
print(f"Current day is => {day(now)}")

# Imprime la hora de la fecha actual.
print(f"Current time is => {t(now)}")

