""" Exercicio 02 aula python. Escreva um programa em Python que aceite uma lista de inteiros. 
Calcule o comprimento da lista e a quantidade de ocorrencias do quinto elemento da lista.
Retorne True se o comprimento da lista for 8 e o quinto elemento ocorrer tres vezes na referida lista."""

def tst_8t_5t(lista_num):
    # Esta função pede uma lista de numeros inteiros e se a lista tiver 8 elementos e o elemento "5" estiver presente 3 vezes retorna "True" senao retorna "False"
    print('\nEsta função pede uma lista de numeros inteiros e se a lista tiver 8 elementos\ne o elemento "5" estiver presente 3 vezes retorna "True" senao retorna "False"\n')
    # Armazena como inteiro quantos elementos "5" existem na lista "num_list" na variavel num_list_counter
    num_list_five_counter = lista_num.count(5)
    # Armazena como inteiro quantos elementos existem na lista "num_list" na variavel num_list_counter
    num_list_counter = len(lista_num)
    # Exibe os valores das variaveis num_list_counter e num_list_five_counter
    print(f'\nA lista fornecida tem: {num_list_counter} numeros\n\nA lista fornecida tem o numero 5: {num_list_five_counter} vezes\n')
    # Testa se a lista atende os prerequisitos do exercicio
    if num_list_counter == 8 and num_list_five_counter == 3:
        return True
    else:
        return False
    