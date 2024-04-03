# Aula python Unip, AULA 01, Respostas Exercicio 02, converter valores de tempo para segundos.
print("Este programa vai converter um espaco declarado em dias, horas, minutos e segundos para apenas segundos.\n")
dias = int(input("quantos dias?\n"))
hrs = int(input("\nquantas horas?\n"))
mins = int(input("\nquantos minutos?\n"))
seg = int(input("\nquantos segundos?\n"))
print (f"\no total de segundos contabilizados foi de:\n\n*** {((dias*86400)+(hrs*3600)+(mins*60)+seg)} ***\n")