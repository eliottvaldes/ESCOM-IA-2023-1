# declarar funcion
def some_decorator(func):
    def wrapper(*args):
        print(f'Calling {func.__name__} with {args}')
        return func(*args)
    return wrapper


# decimos que la funcion decorated_function es decorada por la funcion some_decorator
# al decir que decoramos nos referimos a que la funcion some_decorator recibe como parametro la funcion decorated_function
# lo podemos ver como una forma de polimorfismo
@some_decorator
def decorated_function(x):
    # este comportamiento va a ser sustituido por el comportamiento de la funcion some_decorator
    print(f'Running decorated function with {x}')

decorated_function(2)