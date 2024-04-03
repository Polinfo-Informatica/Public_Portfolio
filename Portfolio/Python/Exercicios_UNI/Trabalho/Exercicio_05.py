# Exercicio 05 aula python. Escreva uma funcao em Python que receba uma lista como parametro e retorne uma nova lista que contenha somente elementos distintos da primeira lista.

def limpeza_comparativa(lista01,lista02):
	from itertools import filterfalse
	# Removendo os elementos da lista01 a partir da lista02 e exibindo os resultados
	# usando filterfalse de itertools
	lista_01_02 = list(filterfalse(lista02.__contains__,lista01))
	return (print(f'\nA lista original é :{lista01}\n') , print(f'A lista a remover da original é :{lista02}\n') , print(f'A lista apos remover os elementos é :{lista_01_02}\n'))