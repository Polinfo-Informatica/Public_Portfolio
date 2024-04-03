# Aula python Unip, AULA 01, Respostas Exercicio 03, aplicar um desconto em um numero e exibir estes valores.
print("este programa vai aplicar um desconto em um valor.\nPor favor responda as perguntas.\n")
val = float(input("Qual o Valor do produto?\n"))
des = float(input("\nQual o desconto\n"))
print(f"\nSeu produto custa R$ {val:.2f}\n\nSeu desconto foi de R$ {((val / 100) * des):.2f}\n\nSeu total foi de R$ {(val - (val / 100) * des):.2f}\n")