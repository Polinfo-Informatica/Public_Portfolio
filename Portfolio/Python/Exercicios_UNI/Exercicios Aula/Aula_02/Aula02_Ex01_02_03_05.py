"""Aula python Unip, AULA 02, Respostas Exercicios 01, 02, 03 e 05:
01 = Crie uma lista de nomes dados via input. Em seguida, crie uma mensagem de saudacao para ao menos um dos nomes da lista criada
02 = Utilizando a lista criada no Exercicio 01, use o *laco for* para criar uma mensagem de saudacao para cada um dos nomes na lista.
03 = Utilizando a lista criada no Exercicio 01:
- Utilize insert() para adcionar um novo item no inicio da lista
- Utilize insert() para adcionar um novo item no meio da lista
- Utilize append() para adcionar um novo item no final da lista
05 = Usando um dos programas que você escreveu nesta aula, acrescente varias linhas no final do programa que facam o seguinte:
- Exiba a mensagem *os tres primeiros itens da lista sao:* Em seguida, use uma fatia para exibir os tres primeiros itens da lista desse programa.
- Exiba a mensagem *Tres itens do meio da lista sao:* Use uma fatia para exibir os tres itens do meio da lista."""

print('Este programa gera uma lista de nomes a partir do que o usuario digitar e exibe essa lista de diferentes formas.')

names = [str(names).strip().title() for names in input('\nDigite varios nomes separados por virgula\nEx: John Doe,Jane Doe,Washington Pillar\n').split(',')]

names.insert(0,f'Primeiro Nome Adicionado')
names.insert(2,'Segundo Nome Adicionado')
names.append('Ultimo Nome Adicionado')

for name in names:
	print(f'\nO nome "{name}" foi adicionado a lista com sucesso.')

print(f'\nOs tres primeiros itens da lista sao:{names[0:3]}')
print(f'\nTres itens do meio da lista sao:{names[2:6]}\n')