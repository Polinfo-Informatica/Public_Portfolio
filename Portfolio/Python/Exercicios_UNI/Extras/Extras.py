# Varios codigos semi prontos

def is_integer():
	# Testa uma variavel para ver se ela � uma integer
	try:
		int()
		return True
	except ValueError:
		return False