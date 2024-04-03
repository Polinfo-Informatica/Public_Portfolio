# Exercicio 03 aula python. Escreva um programa em Python para verificar se uma determinada chave ja existe em um dicionario

def checa_est_cap(checa_dic):
	# Cria um dicionario com todos os estados e suas capitais.
	estados_capitais_brasil = dict({'Acre':'Rio Branco','Alagoas':'Maceió','Amapá':'Macapá','Amazonas':'Manaus','Bahia':'Salvador','Ceará':'Fortaleza','Distrito Federal':'Brasília','Espírito Santo':'Vitória','Goiás':'Goiânia','Maranhão':'São Luís','Mato Grosso':'Cuiabá','Mato Grosso do Sul':'Campo Grande','Minas Gerais':'Belo Horizonte','Pará':'Belém','Paraíba':'João Pessoa','Paraná':'Curitiba','Pernambuco':'Recife','Piauí':'Teresina','Rio de Janeiro':'Rio de Janeiro','Rio Grande do Norte':'Natal','Rio Grande do Sul':'Porto Alegre','Rondônia':'Porto Velho','Roraima':'Boa Vista','Santa Catarina':'Florianópolis','São Paulo':'São Paulo','Sergipe':'Aracaju','Tocantins':'Palmas'})
	# Checa se a string digitada existe no dicionario
	if checa_dic in estados_capitais_brasil:
		return(print(f'\n{checa_dic} foi encontrada no sistema e sua capital é {estados_capitais_brasil[checa_dic]}\n'),True)
	else:
		return(print(f'O estado {checa_dic} não foi encontrada no sistema\n'),False)