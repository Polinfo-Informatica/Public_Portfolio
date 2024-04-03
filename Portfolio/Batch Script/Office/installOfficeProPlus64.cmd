@ECHO OFF
ECHO OFF
CLS
COLOR 0B
SETLOCAL

:: Duvidas contatar guilherme.polizel.767@gmail.com ou no whatsapp 55 12 981245489 Polinfo Informatica

:: faz o diretorio padrao ser o diretorio onde a batch abre
CD /d %~dp0

:: cria a variavel w e faz ela ser igual ao diretorio onde a batch foi aberta
SET p01=%cd%

:: Adaptando marcas de tempo para usar em nomes de arquivos
:: se nescessario adaptar o set z para suas nescessidades

set t=%date%_%time%
set z=%t:~0,2%.%t:~3,2%.%t:~6,4%
set z=%z: =0%

:check_Permissions
    net session >nul 2>&1
    if %errorLevel% == 0 (
		echo ************************************************************
		echo * Direitos administrativos adequados.                      *
		echo ************************************************************
		goto office365
    ) else (
		echo ************************************************************
		echo * Falha: Direitos administrativos inadequados!             *
		echo *                                                          *
		echo * Favor abrir a batch como administrador!                  *
		echo *                                                          *
		echo * Falha: Direitos administrativos inadequados!             *
		echo ************************************************************
		goto _end
    )

:office365
start "Office365" "%p01%\setup.exe" /configure installOfficeProPlus64.xml
EXIT

:_end
	PAUSE
	EXIT
		
:_shutdown
	echo ************************************************************
	echo * O computador desligara em 5 segundos                     *
	echo ************************************************************
	SHUTDOWN /S /T 5
	PAUSE
	EXIT
		
:_restart
	echo ************************************************************
	echo * O computador reiniciara em 5 segundos                    *
	echo ************************************************************
	SHUTDOWN /R /T 5
	PAUSE
	EXIT