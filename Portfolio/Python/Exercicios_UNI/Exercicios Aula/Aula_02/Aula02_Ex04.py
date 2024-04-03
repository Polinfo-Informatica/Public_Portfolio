# Aula python Unip, AULA 02, Respostas Exercicio 04:
"""
Um numero elevado a terceira potencia e chamado de cubo. Crie uma lista dos dez primeiros cubos (cada inteiro de 1 a 10) 
e utilize um *laco for* para exibir o valor de cada cubo. Faca uma versao com e outra sem *list comprehensions*.
"""

print('Este programa gera uma lista dos dez primeiros numeros elevados ao cubo')

# com list comprehension
cube_3 = [value**3 for value in range(1,11)]
print(f'\nGerado com list comprehension {cube_3}')

# sem list comprehension

Cube_3 = [0,1,2,3,4,5,6,7,8,9,10]

for num in Cube_3:
	print(f'Gerado sem list comprehension {num**3}')