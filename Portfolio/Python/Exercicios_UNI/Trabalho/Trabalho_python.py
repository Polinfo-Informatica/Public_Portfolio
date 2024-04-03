# Arquivo com as funçoes agrupadas de todos os exercicios para nota em python.
# Este codigo requer python 3.10 ou superior para rodar.

while True:
    print(f'\n\nMENU PRINCIPAL\n\nSelecione qual o exercicio que deseja testar \n1 - Separar numeros pares de uma lista\n2 - Testa uma lista se tem um total de 8 elementos e tem 3 vezes o elemento 5\n3 - Testa se o dicionario tem a chave especificada\n4 - Cria uma tupla e remove um elemento da tupla\n5 - Cria duas listas e exibe a primeira lista sem todos os elementos da segunda\n0 - Sair')
    n = (input('\n'))
    if n == '1':
        # Importa a função do exercicio 01
        from Exercicio_01 import par_impar_split
        # Pede uma sequencia de numeros separados por virgula.
        print("\nEste programa pede uma sequencia de numeros e separa os numeros pares dos impares.\n")
        lista_num = [int(lista_num) for lista_num in input('\nPor favor digite uma sequencia de numeros separado por virgula.\nEx:10,23,47,5,69,99\n\n').split(',')]
        num_even,num_odd = par_impar_split(lista_num)
        print(f"\nTodos os numeros:{lista_num}\n"),print(f"Todos os numeros pares:{num_even}\n"),print(f"Todos os numeros impares:{num_odd}\n")
        print('Função 01 Testada retornando ao menu principal.')
    elif n == '2':
        # Importa a função do exercicio 02
        from Exercicio_02 import tst_8t_5t
        # Pede uma sequencia de numeros separados por virgula.
        print("\nEste programa pede uma sequencia de numeros e verifica quantos numeros são e qauntas vezes o numero 5 se repete\nSe o total de numeros for 8 e o numero 5 aparecer 3 vezes ele retorna true\n\n")
        lista_num = [int(lista_num) for lista_num in input('Por favor digite uma sequencia de numeros separado por virgula.\nEx:10,23,47,5,69,99\n\n').split(',')]
        res2 = tst_8t_5t(lista_num)
        print(f'A sequencia de numeros que foi fornecida retornou o resultado: {res2}\n')
        print('Função 02 Testada retornando ao menu principal.')
    elif n == '3':
        # Importa a função do exercicio 03
        from Exercicio_03 import checa_est_cap
        # Pede ao usuario o nome de um estado brasileiro Exercicio 03.
        checa_dic=input('\nPor favor digite o nome de um estado brasileiro, para exibirmos sua capital.\n\n')
        checa_est_cap(checa_dic)
        print('Função 03 Testada retornando ao menu principal.')
    elif n == '4':
        # Importa a função do exercicio 04
        from Exercicio_04 import tupla_cortada
        # Invoca a Função que remove um elemento da tupla
        tupla_01 = tupla_cortada()
        print(f'sua nova tupla é: {tupla_01}\n')
        print('Função 04 Testada retornando ao menu principal.')
    elif n == '5':
        # Importa a função do exercicio 05
        from Exercicio_05 import limpeza_comparativa
        lista01 = [str(lista01).strip() for lista01 in input('\nDigite varios elementos separados por virgula\nEx: John Doe,Jane Doe,Washington Pillar,10,999\n').split(',')]
        lista02 = [str(lista02).strip() for lista02 in input('\nDigite varios elementos separados por virgula para remover da primeira lista\nEx: John Doe,Jane Doe,Washington Pillar,10,999\n').split(',')]
        limpeza_comparativa(lista01,lista02)
        print('Função 05 Testada retornando ao menu principal.')
    elif n == '0':
        break
    else:
        print('Comando não reconhecido, retornando ao menu principal.\n')