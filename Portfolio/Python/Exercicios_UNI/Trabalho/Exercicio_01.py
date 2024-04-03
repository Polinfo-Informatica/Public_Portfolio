# Exercicio aula python 01. Escreva um programa em Python que mostre os números de uma lista após remover os números pares dela.

def par_impar_split(lista_num):
    # divide os numeros da variavel (lista_num) por dois e se não tiver resto poe na lista num_even
	num_even = [x for x in lista_num if x % 2 == 0]
	# divide os numeros da variavel (lista_num) por dois e se tiver resto um ou mais poe na lista num_odd
	num_odd = [x for x in lista_num if x % 2 >= 1]
	return num_even,num_odd