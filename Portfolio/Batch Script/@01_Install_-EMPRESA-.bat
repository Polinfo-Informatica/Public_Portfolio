@ECHO OFF
ECHO OFF
CLS
COLOR 0B
SETLOCAL

:: Duvidas contatar guilherme.polizel.767@gmail.com ou no whatsapp 55 12 981245489 Polinfo Informatica

:: faz o diretorio padrao ser o diretorio onde a batch abre
CD /d %~dp0

:: cria a variavel p01 e faz ela ser igual ao diretorio onde a batch foi aberta
SET p01=%cd%

:: Adaptando marcas de tempo para usar em nomes de arquivos
:: se nescessario adaptar o set z para suas nescessidades

set t=%date%_%time%
set z=%t:~0,2%.%t:~3,2%.%t:~6,4%
set z=%z: =0%

:install_paths
::gera as variaveis dos caminhos e nome de arquivos a serem instalado consolidados para facil atualização e configuração
	winrar_install = start "Winrar" /w %p01%\winrar-x64-623br.exe /S
	notepad_install = start "NPP" /w %p01%\npp.8.5.5.Installer.x64.exe /S
	zip7_install = start "7zip" /w %p01%\7z2301-x64.exe /S
	chrome_install = start "Chrome" /w %p01%\ChromeStandaloneenterprise64.msi
	java64_install = start "Java64" /w %p01%\jre-8u381-windows-x64.exe INSTALLCFG=%p01%\jre-install-options.cfg /L C:\jre64-install_%z%.log
	java32_install = start "Java32" /w %p01%\jre-8u381-windows-i586.exe INSTALLCFG=%p01%\jre-install-options.cfg /L C:\jre32-install_%z%.log
	office_install = start "Office365" /w "%p01%\Office\setup.exe" /configure "%p01%\Office\installOfficeProPlus64.xml"


:check_Permissions
:: Checa se a batch esta rodando como administrador e termina a batch se não estiver
    net session >nul 2>&1
    if %errorLevel% == 0 (
		echo ************************************************************
		echo * Direitos administrativos adequados.                      *
		echo ************************************************************
		echo *
		goto ask_main
    ) else (
		echo ************************************************************
		echo * Falha: Direitos administrativos inadequados!             *
		echo *                                                          *
		echo * Favor abrir a batch como administrador!                  *
		echo *                                                          *
		echo * Falha: Direitos administrativos inadequados!             *
		echo ************************************************************
		echo *
		goto _end
    )


:ask_main
::Menu pricipal
	ECHO ******************
	ECHO * Menu Principal *
	ECHO ******************
	ECHO 
	ECHO Digite 1 para ir ao *Menu de Instalacoes*
	ECHO Digite 2 para ir ao *Menu de Rede*
	ECHO Digite 3 para ir ao *Menu de Energia*
	ECHO Digite 0 para encerrar este procedimento.
	ECHO 
	set /P ASK1="Por Favor digite apenas 1,2,3 ou 0 "
	2>NUL CALL :CASE_%ASK1%
	IF ERRORLEVEL 1 CALL :DEFAULT_CASE

	ECHO Done.
	EXIT /B

	:CASE_1
		echo ************************************************************
		echo * " 1 " Selecionado... Abrindo Menu de Instalacoes         *
		echo ************************************************************
		echo *
		GOTO ask_install_programs
	:CASE_2
		echo ************************************************************
		echo * " 2 " Selecionado... Abrindo Menu de Rede                *
		echo ************************************************************
		echo *
		GOTO ask_net
	:CASE_3
		echo ************************************************************
		echo * " 3 " Selecionado... Abrindo Menu de Energia             *
		echo ************************************************************
		echo *
		GOTO ask_power
	:CASE_0
		echo ************************************************************
		echo * " 0 " Selecionado... Encerrando...                       *
		echo ************************************************************
		echo *
		GOTO _end
	:DEFAULT_CASE
		echo ************************************************************
		echo * Por Favor digite apenas 1,2 ou 3                         *
		echo ************************************************************
		echo *
		GOTO ask_main
	:END_CASE
		VER > NUL
		GOTO _end

:ask_install_programs
::Menu de instalações de programas
	ECHO  
	ECHO ***********************
	ECHO * Menu de Instalacoes *
	ECHO ***********************
	ECHO  
	ECHO Digite 1 para instalar *Todos*: Winrar, Notepad Plus, Java, 7zip, Office 365 e Chave Original do Windows.
	ECHO Digite 2 para instalar *Winrar*
	ECHO Digite 3 para instalar *Notepad Plus*
	ECHO Digite 4 para instalar *Java*
	ECHO Digite 5 para instalar *7zip*
	ECHO Digite 6 para instalar *Office 365*
	ECHO Digite 7 para instalar *Chave Original do Windows*
	ECHO Digite 8 para *resetar* configuracoes de teclado
	ECHO Digite 9 para instalar correcao *EXCLUSIVA* a teclados de notebooks Lenovo
	ECHO Digite 0 para voltar ao *menu principal*
	ECHO  
	set /P ASK2="Por Favor digite apenas 1,2,3,4,5,6,7,8,9 ou 0 "
	2>NUL CALL :CASE_%ASK2%
	IF ERRORLEVEL 1 CALL :DEFAULT_CASE

	ECHO Done.
	EXIT /B

	:CASE_1
		echo ************************************************************
		echo * " 1 " Selecionado... Instalando Tudo                     *
		echo ************************************************************
		echo *
		GOTO install_all
	:CASE_2
		echo ************************************************************
		echo * " 2 " Selecionado... Instalando Winrar                   *
		echo ************************************************************
		echo *
		GOTO install_winrar
	:CASE_3
		echo ************************************************************
		echo * " 3 " Selecionado... Instalando Notepad Plus             *
		echo ************************************************************
		echo *
		GOTO install_notepad_plus
	:CASE_4
		echo ************************************************************
		echo * " 4 " Selecionado... Instalando Java                     *
		echo ************************************************************
		echo *
		GOTO install_java
	:CASE_5
		echo ************************************************************
		echo * " 5 " Selecionado... Instalando 7zip                     *
		echo ************************************************************
		echo *
		GOTO install_7zip
	:CASE_6
		echo ************************************************************
		echo * " 6 " Selecionado... Instalando Office 365               *
		echo ************************************************************
		echo *
		GOTO install_office
	:CASE_7
		echo ************************************************************
		echo * " 7 " Selecionado... Instalando Chave Original do Windows*
		echo ************************************************************
		echo *
		GOTO install_winkey
	:CASE_8
		echo ************************************************************
		echo * " 8 " Selecionado... Resetando config teclado            *
		echo ************************************************************
		echo *
		GOTO reset_keys
	:CASE_9
		echo ************************************************************
		echo * " 9 " Selecionado... Instalando correcao teclas Lenovo   *
		echo ************************************************************
		echo *
		GOTO fix_key_lenovo_note
	:CASE_0
		echo ************************************************************
		echo * " 0 " Selecionado... Retornando ao menu principal        *
		echo ************************************************************
		echo *
		GOTO ask_main
	:DEFAULT_CASE
		echo ************************************************************
		echo * Por Favor digite apenas 1,2,3,4,5,6,7,8,9 ou 0           *
		echo ************************************************************
		echo *
		GOTO ask_install_programs
	:END_CASE
		VER > NUL
		GOTO _end

:install_winrar
	echo ************************************************************
	echo * Instalando o Winrar                                      *
	echo ************************************************************

	%winrar_install%
	
	goto ask_install_programs
	
:install_notepad_plus
	echo ************************************************************
	echo * Instalando o Notepad Plus                                *
	echo ************************************************************

	%notepad_install%
	
	goto ask_install_programs
	
:install_7zip
	echo ************************************************************
	echo * Instalando o 7zip                                        *
	echo ************************************************************

	%zip7_install%
	
	goto ask_install_programs
	
:install_chrome
	echo ************************************************************
	echo * Instalando o Google Chrome                               *
	echo ************************************************************

	%chrome_install%
	
	goto ask_install_programs
	
:install_java
	echo ************************************************************
	echo * Instalando o Java                                        *
	echo ************************************************************

	%java32_install%
	%java64_install%
	
	goto ask_install_programs
	
:install_office
	echo ************************************************************
	echo * Instalando o Office 365                                  *
	echo * Esta Instalacao pode demorar... por favor aguarde...     *
	echo ************************************************************
	
	%office_install%
	
	goto ask_install_programs


:install_all
::Instala Winrar, Java, Notepad Plus, 7zip, Office 365 e Chave do Windows original se houver.
	echo ************************************************************
	echo * Instalando o Winrar                                      *
	echo ************************************************************

	%winrar_install%
	
	echo ************************************************************
	echo * Instalando o Notepad Plus                                *
	echo ************************************************************

	%notepad_install%
	
	echo ************************************************************
	echo * Instalando o 7zip                                        *
	echo ************************************************************

	%zip7_install%

	echo ************************************************************
	echo * Instalando o Google Chrome                               *
	echo ************************************************************

	%chrome_install%
	
	echo ************************************************************
	echo * Instalando o Java 32 e 64                                *
	echo ************************************************************

	%java32_install%
	%java64_install%
	
	echo ************************************************************
	echo * Instalando o Office 365                                  *
	echo * Esta Instalacao pode demorar... por favor aguarde...     *
	echo ************************************************************
	
	%office_install%

:install_winkey
	:: Le a chave que esta salva no firmware do computador, joga o valor da chave na variavel _key e roda os scripts nativos do windows para ativar
	echo ************************************************************
	echo * Buscando Chave Original no Sistema...                    *
	echo ************************************************************

	set "_key="
	for /f "skip=1delims=" %%G in (
	'wmic path softwarelicensingservice get OA3xOriginalProductKey'
	) do if not defined _key set "_key=%%G"

	echo ************************************************************
	echo * Chave Encontrada: %_key%
	echo ************************************************************

	slmgr.vbs /ipk %_key%

	echo ************************************************************
	echo * Tentando ativar o windows com a chave encontrada         *
	echo * @@@ Conexao com a internet obrigatoria @@@               *
	echo * por favor aguarde... isso pode demorar um pouco...       *
	echo ************************************************************

	slmgr.vbs /ato
	
	goto ask_install_programs
	
:reset_keys
::Estes comandos apagam quaisquer configuraçoes personalizadas do teclado.
	REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "Scancode Map" /f
	REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layouts" /v "Scancode Map" /f
	REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "Value Scancode Map" /f
	REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layouts" /v "Value Scancode Map" /f
	
	echo ************************************************************
	echo * Reset de teclado realizado                               *
	echo * sera aplicada apenas apos reinicializar                  *
	echo ************************************************************
	
	goto ask_install_programs

:fix_key_lenovo_note
::estas duas linhas aplicam uma correção a um erro que ocorre apenas nos notebooks lenovo remover os ""dois" "dois pontos"" nesses casos ou copiar e colar no CMD nesses casos.

	REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "Scancode Map" /t REG_SZ /d 00,00,00,00,00,00,00,00,02,00,00,00,73,00,1d,e0,00,00,00,00 /f
	REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layouts" /v "Scancode Map" /t REG_SZ /d 00,00,00,00,00,00,00,00,02,00,00,00,73,00,1d,e0,00,00,00,00 /f
	
	echo ************************************************************
	echo * Configuracao de teclado realizada                        *
	echo * sera aplicada apenas apos reinicializar                  *
	echo ************************************************************
	
	goto ask_install_programs
	
:ask_net
::Menu de configuraçoes de rede
	echo ****************
	ECHO * Menu de Rede *
	echo ****************
	echo 
	ECHO O que deseja fazer?
	ECHO Digite 1 para renomear o computador e automaticamente > reiniciar > entrar no dominio -EMPRESA- > reiniciar
	ECHO Digite 2 para automaticamente entrar no dominio -EMPRESA- > reiniciar
	ECHO Digite 0 para voltar ao menu principal
	ECHO 
	set /P ASK3="Por Favor digite apenas 1,2 ou 0"
	2>NUL CALL :CASE_%ASK3%
	IF ERRORLEVEL 1 CALL :DEFAULT_CASE

	ECHO Done.
	EXIT /B

	:CASE_1
		echo ************************************************************
		echo * %ASK3% Selecionado... Renomear computador selecionado.   *
		echo ************************************************************
		echo *
		GOTO rename_computer
	:CASE_2
		echo ************************************************************
		echo * %ASK3% Selecionado... Entrar no dominio selecionado.     *
		echo ************************************************************
		echo *
		GOTO final_touch
	:CASE_0
		echo ************************************************************
		echo * %ASK3% Selecionado... Retornando ao menu principal       *
		echo ************************************************************
		echo *
		GOTO ask_main
	:DEFAULT_CASE
		echo ************************************************************
		echo * %ASK3% Selecionado... favor digitar apenas 1, 2 ou 0     *
		echo ************************************************************
		echo *
		GOTO ask_net
	:END_CASE
		VER > NUL
		GOTO _end
	  
:rename_computer
::pergunta o ativo do computador e armazena na variavel %newname%
echo ************************************************************
echo * Atual nome do computador %computername%
echo * Atual nome do computador %computername%
echo * Atual nome do computador %computername%
echo ************************************************************
set /P newname="qual o NUMERO do ativo do computador? "
set -EMPRESA-=SJC
set full=%-EMPRESA-%%newname%

::renomeia o computador com o valor da variavel %newname%
wmic computersystem where name='%computername%' call rename name='%full%'

::Agenda uma tarefa para rodar o script final touch na proxima vez que for feito logon no computador e reinicia maquina
SCHTASKS /CREATE /TN "Batch_Config" /TR "%p01%\final_touch.cmd" /SC ONLOGON /RL HIGHEST /F
goto _restart

:final_touch
::Poe a senha no administrador e ativa a conta
NET USER "Administrador" 00112233 /PASSWORDREQ:YES
NET USER "Administrador" /ACTIVE:YES
::Apaga o usuario temporario criado durante a instalação do windows
NET USER "User" /Delete
::Apaga a task que roda esta batch
SCHTASKS /DELETE /TN "Batch_Config" /F
:: abre script do powershell para ingressar no dominio -EMPRESA-
type nul > C:\JoinDom-EMPRESA-.txt
powershell -executionpolicy bypass -noexit "& ""%p01%\JoinDom-EMPRESA-.ps1"""
Exit

:ask_power
::pergunta quais configuraçoes de energia realizar.
	echo *******************
	ECHO * Menu de Energia *
	echo *******************
	echo 
	ECHO O que deseja fazer? 
	ECHO Digite 1 para Listar os planos de energia e seus GUIDs
	ECHO Digite 2 para Importar e ativar um plano de *ALTO DESEMPENHO* que a maquina nunca desliga sozinha
	ECHO Digite 3 para Importar e ativar um plano de *EQUILIBRIO* de energia
	ECHO Digite 0 para Retornar ao menu principal
	ECHO 
	set /P ASK4="Por Favor digite apenas 1,2,3 ou 0"
	2>NUL CALL :CASE_%ASK4%
	IF ERRORLEVEL 1 CALL :DEFAULT_CASE

	ECHO Done.
	EXIT /B

	:CASE_1
		echo ************************************************************
		echo * %ASK4% Selecionado... Listando planos de energia              *
		echo ************************************************************
		echo *
		GOTO list_power
	:CASE_2
		echo ************************************************************
		echo * %ASK4% Selecionado... Ativando plano de Desempenho            *
		echo ************************************************************
		echo *
		GOTO import_power_high
	:CASE_3
		echo ************************************************************
		echo * %ASK4% Selecionado... Ativando plano Equilibrado              *
		echo ************************************************************
		echo *
		GOTO import_power_low
	:CASE_0
		echo ************************************************************
		echo * %ASK4% Selecionado... Retornando ao Menu Principal...         *
		echo ************************************************************
		echo *
		GOTO ask_main
	:DEFAULT_CASE
		echo ************************************************************
		echo * %ASK4% Selecionado... Opcao invalida                          *
		echo ************************************************************
		echo *
		GOTO ask_power
	:END_CASE
		VER > NUL
		GOTO _end

	:list_power
	Powercfg /List
	GOTO ask_power

	:import_power_high
	powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
	powercfg /change monitor-timeout-ac 15
	powercfg /change monitor-timeout-dc 10
	powercfg /change disk-timeout-ac 0
	powercfg /change disk-timeout-dc 0
	powercfg /change standby-timeout-ac 0
	powercfg /change standby-timeout-dc 0
	powercfg /change hibernate-timeout-ac 0
	powercfg /change hibernate-timeout-dc 0
	GOTO ask_power

	:import_power_low
	powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e
	GOTO ask_power


:_end
	PAUSE
	EXIT
		
:_shutdown
	echo ************************************************************
	echo * O computador desligara em 1 segundo                      *
	echo ************************************************************
	SCHTASKS /DELETE /TN "Batch_Config" /F
	SHUTDOWN /S /T 1
	PAUSE
	EXIT
		
:_restart
	echo ************************************************************
	echo * O computador reiniciara em 1 segundo                     *
	echo ************************************************************
	SHUTDOWN /R /T 1
	PAUSE
	EXIT
	
:_end_dom
	echo ************************************************************
	echo * COMPUTADOR ESTA NO DOMINIO -EMPRESA-                           *
	echo ************************************************************
	SCHTASKS /DELETE /TN "Batch_Config" /F
	PAUSE
	SHUTDOWN /S /T 15
	EXIT

:garbage
	EXIT

	echo ****************
	ECHO * Menu  *
	echo ****************
	echo 
	ECHO O que deseja fazer?
	ECHO Digite 1 para 
	ECHO Digite 2 para 
	ECHO Digite 0 para 
	ECHO 
	set /P ASK="Por Favor digite apenas  ou 0"
	2>NUL CALL :CASE_%ASK%
	IF ERRORLEVEL 1 CALL :DEFAULT_CASE

	ECHO Done.
	EXIT /B

	:CASE_1
		echo ************************************************************
		echo * *
		echo ************************************************************
		echo *
		GOTO 
	:CASE_2
		echo ************************************************************
		echo *      *
		echo ************************************************************
		echo *
		GOTO 
	:CASE_0
		echo ************************************************************
		echo *        *
		echo ************************************************************
		echo *
		GOTO 
	:DEFAULT_CASE
		echo ************************************************************
		echo * %ASK% Selecionado... favor digitar apenas  ou 0     *
		echo ************************************************************
		echo *
		GOTO 
	:END_CASE
		VER > NUL
		GOTO _end

	NET LOCALGROUP ADMINISTRADORES

	systeminfo | findstr what you want to search goes here >nul 2>&1
	if %errorLevel% == 0 (
			echo ************************************************************
			echo * text that displays if what u searched was found          *
			echo ************************************************************
			goto name of the part of the batch to go if what u searched was found
		) else (
			echo ************************************************************
			echo * text that displays if what u searched was NOT found      *
			echo ************************************************************
			goto name of the part of the batch to go if what u searched was NOT found
		)

	start "nome" /w msiexec /i %p01%\.msi /quiet /qn  /log c:\install__%z%.log

	SET USER

	Atual nome do computador %computername%

	wmic bios get serialnumber
	EXIT