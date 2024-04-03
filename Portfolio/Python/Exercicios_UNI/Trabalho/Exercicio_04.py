# Exercicio 04 aula python. Escreva um programa em Python para remover um item de uma tupla.

def tupla_cortada():
    # "altera" a tupla usando o metodo slice e criando uma nova tupla com o metodo aplicado
    print('Este programa cria uma tupla e remove um valor dela')
    # Cria a tupla a modificar
    tupla_odiada=('filas','calor',2021,False)
    print(f'\nSua tupla original é: {tupla_odiada}\n')
    tupla_01 = tupla_odiada[1:]
    return tupla_01

""" Explicação detalhada do metodo slice
The syntax is:

a[start:stop]  # items start through stop-1
a[start:]      # items start through the rest of the array
a[:stop]       # items from the beginning through stop-1
a[:]           # a copy of the whole array

There is also the step value, which can be used with any of the above:

a[start:stop:step] # start through not past stop, by step

The key point to remember is that the :stop value represents the first value that is not in the selected slice. So, the difference between stop and start is the number of elements selected (if step is 1, the default).

The other feature is that start or stop may be a negative number, which means it counts from the end of the array instead of the beginning. So:

a[-1]    # last item in the array
a[-2:]   # last two items in the array
a[:-2]   # everything except the last two items

Similarly, step may be a negative number:

a[::-1]    # all items in the array, reversed
a[1::-1]   # the first two items, reversed
a[:-3:-1]  # the last two items, reversed
a[-3::-1]  # everything except the last two items, reversed

Python is kind to the programmer if there are fewer items than you ask for. For example, if you ask for a[:-2] and a only contains one element, you get an empty list instead of an error. Sometimes you would prefer the error, so you have to be aware that this may happen.
Relationship with the slice object

A slice object can represent a slicing operation, i.e.:

a[start:stop:step]

is equivalent to:

a[slice(start, stop, step)]

Slice objects also behave slightly differently depending on the number of arguments, similarly to range(), i.e. both slice(stop) and slice(start, stop[, step]) are supported. To skip specifying a given argument, one might use None, so that e.g. a[start:] is equivalent to a[slice(start, None)] or a[::-1] is equivalent to a[slice(None, None, -1)].

While the :-based notation is very helpful for simple slicing, the explicit use of slice() objects simplifies the programmatic generation of slicing.
"""