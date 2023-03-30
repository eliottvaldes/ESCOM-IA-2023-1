# --------------------------------------------------
# FUNCIONES LAMBDA
# --------------------------------------------------
# Ejemplo de codigo de funcion lambda
# la estuctura de una funcion lambda es:
# lambda argumentos: expresion
# la funcion lambda es una funcion anonima, es decir, no tiene nombre
# y se puede usar en cualquier parte donde se requiera una funcion

# ejemplo de funcion lambda que suma dos numeros
(lambda x:x)(1) # 1 porque es la funcion identidad

#ejemplo de funcion lambda que el parametro x y un valor z
(lambda x:x+4)(1) # 3


# definicion de funciones en python
sumar_uno = lambda x: x+1
# llamada a la funcion
sumar_uno(-1) # 0


# ejemplo de una expresion lambda para obtener el nombre
nombre_completo = lambda nombre,apellido: f'El nombre completo es {nombre.title()} {apellido.title()}'

# llamada a la funcion
nombre_completo('Eliot','Valdes') # El nombre completo es 

# --------------------------------------------------
# FUNCIONES ANONIMAS
# --------------------------------------------------
# las funciones anonimas son funciones lambda que se pueden usar en cualquier parte donde se requiera una funcion

# definicion de funcion anonima
lambda x,y:x+y
# internamente el interprete lo que hace es asignarle un nombre a la funcion 'lambda' y lo deja como _

# para llamar a la ultima funcion anonima que se ha definido se usa la funcion anonima _
_(2,-7) # -5


# --------------------------------------------------
# FUNCIONES DE ALTO NIVEL
# --------------------------------------------------
# ejemplo de funcion que recibe un numero y una funcion como parametro
funcion_alto_nivel = lambda x,funcion: x+funcion(x)
# llamada a la funcion
funcion_alto_nivel(3,lambda x:x/2) # 4.5


# OBTENER INFORMACION DE UNA FUNCION LAMBDA

import dis
add = lambda x,y: x+y
type(add) # <class 'function'>

# para conocer un poco mas la traza de como funciona esa funcion

dis.dis(add) # retorna la traza de la funcion
#  2           0 LOAD_FAST                0 (x)


div_cero = lambda x: x/0
div_cero(1) # ZeroDivisionError: division by zero

# las funciones lo aceptan palabras reservadas como return
# (lambda x: return x)(1) # SyntaxError: 'return' outside function

# ejemplo para ver si el valor es par o impar
(lambda x: x%2 and 'impar' or 'par')(3) # 'impar'
