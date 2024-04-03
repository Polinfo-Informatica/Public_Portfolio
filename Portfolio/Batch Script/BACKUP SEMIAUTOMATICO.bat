@ECHO OFF
ECHO OFF
COLOR 0B
SETLOCAL
CLS

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

:: Checa se a batch esta rodando como administrador e termina a batch se não estiver
goto check_Permissions

:check_Permissions
    net session >nul 2>&1
    if %errorLevel% == 0 (
		echo ************************************************************
		echo * Direitos administrativos adequados.                      *
		echo ************************************************************
		goto _start01
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

:_start01
::pergunta qual a unidade de backup
set /P _let="qual a letra da unidade de backup. Exemplo: D: ? "

::pergunta o nome do usuario
set /P nome="qual o login do usuario? verificar a pasta c : \ users \ Exemplo: maria.silva: "

::cria variavel de parte do caminho
set _user=C:\Users\

::une as variaveis para o caminho ficar completo
set _path=%_user%%nome%

::pergunta a empresa
set /P emp="qual a empresa? "

set _dest=%_let1%\Backup\%emp%_Backup_%nome%_%z%
set _dest01=%_let%\Backup\%emp%_Backup_%nome%_%z%\Desktop\
set _dest02=%_let%\Backup\%emp%_Backup_%nome%_%z%\Documents\
set _dest03=%_let%\Backup\%emp%_Backup_%nome%_%z%\Favorites\
set _dest04=%_let%\Backup\%emp%_Backup_%nome%_%z%\Links\
set _dest05=%_let%\Backup\%emp%_Backup_%nome%_%z%\Music\
set _dest06=%_let%\Backup\%emp%_Backup_%nome%_%z%\Pictures\
set _dest07=%_let%\Backup\%emp%_Backup_%nome%_%z%\Videos\
set _dest08=%_let%\Backup\%emp%_Backup_%nome%_%z%\Downloads\
set _dest09=%_let%\Backup\%emp%_Backup_%nome%_%z%\Contacts\
set _dest10=%_let%\Backup\%emp%_Backup_%nome%_%z%\Searches\
set _dest11=%_let%\Backup\%emp%_Backup_%nome%_%z%\Thunderbird_Roaming\
set _dest12=%_let%\Backup\%emp%_Backup_%nome%_%z%\Thunderbird_Local\
set _dest13=%_let%\Backup\%emp%_Backup_%nome%_%z%\Spark\
set _dest14=%_let%\Backup\%emp%_Backup_%nome%_%z%\C\CENO2019\
set _dest15=%_let%\Backup\%emp%_Backup_%nome%_%z%\C\CENO2019.new\
set _dest16=%_let%\Backup\%emp%_Backup_%nome%_%z%\C\CENO2020\
set _dest17=%_let%\Backup\%emp%_Backup_%nome%_%z%\C\CENO2021\
set _dest18=%_let%\Backup\%emp%_Backup_%nome%_%z%\C\CENO2022\
set _dest19=%_let%\Backup\%emp%_Backup_%nome%_%z%\C\SAF\
set _dest20=%_let%\Backup\%emp%_Backup_%nome%_%z%\C\SPED\
set _dest21=%_let%\Backup\%emp%_Backup_%nome%_%z%\C\storage\
set _dest22=%_let%\Backup\%emp%_Backup_%nome%_%z%\C\CENO2018\
set _dest23="%_let%\Backup\%emp%_Backup_%nome%_%z%\C\Arquivos de Programas RFB\ "
set _dest24="%_let%\Backup\%emp%_Backup_%nome%_%z%\C\Program Files (x86)\Funeraria\ "
set _dest25="%_let%\Backup\%emp%_Backup_%nome%_%z%\C\Program Files (x86)\Serasa Experian\ "
set _dest26="%_let%\Backup\%emp%_Backup_%nome%_%z%\C\Program Files (x86)\Programas RFB\ "
set _dest27="%_let%\Backup\%emp%_Backup_%nome%_%z%\C\Program Files\A.E.T. Europe B.V\ "
set _dest28="%_let%\Backup\%emp%_Backup_%nome%_%z%\C\ProgramData\A.E.T. Europe B.V\ "
set _dest39="%_let%\Backup\%emp%_Backup_%nome%_%z%\C\ProgramData\Programas RFB\ "
set _dest30="%_let%\Backup\%emp%_Backup_%nome%_%z%\C\ProgramData\Serasa Experian\ "
set _dest31="%_let%\Backup\%emp%_Backup_%nome%_%z%\C\IBGE\ "
set _dest32="%_let%\Backup\%emp%_Backup_%nome%_%z%\C\Program Files (x86)\OMNIKEY\ "
rem set _dest33="%_let%\Backup\%emp%_Backup_%nome%_%z%\C\ "
rem set _dest34="%_let%\Backup\%emp%_Backup_%nome%_%z%\C\ "
rem set _dest34="%_let%\Backup\%emp%_Backup_%nome%_%z%\C\ "


:: Variaveis de configuração... só mecher se souber o que faz

::Define as opcoes do robocopy
set _opt=/E /R:2 /W:1

::define as opçoes do arquivo de log
set _log=/UNILOG+:"%_dest%\log_%z%.txt" /TEE /V

@echo.
@echo *******************************************************************************
@echo #                                                                             #
@echo # Esta batch copia todos os arquivos do usuario para outra pasta de backup
@echo #                                                                             #
@echo *******************************************************************************
@echo.
pause

:: Criando Pastas de Destino

MD %_dest%

:: Movendo/Copiando arquivos para o destino

ROBOCOPY %_path%\Desktop\ %_dest01% %_opt% %_log%
ROBOCOPY %_path%\Documents\ %_dest02% %_opt% %_log%
ROBOCOPY %_path%\Favorites\ %_dest03% %_opt% %_log%
ROBOCOPY %_path%\Links\ %_dest04% %_opt% %_log%
ROBOCOPY %_path%\Music\ %_dest05% %_opt% %_log%
ROBOCOPY %_path%\Pictures\ %_dest06% %_opt% %_log%
ROBOCOPY %_path%\Videos\ %_dest07% %_opt% %_log%
ROBOCOPY %_path%\Downloads\ %_dest08% %_opt% %_log%
ROBOCOPY %_path%\Contacts\ %_dest09% %_opt% %_log%
ROBOCOPY %_path%\Searches\ %_dest10% %_opt% %_log%
ROBOCOPY %_path%\AppData\Roaming\Thunderbird\ %_dest11% %_opt% %_log%
ROBOCOPY %_path%\AppData\Local\Thunderbird\ %_dest12% %_opt% %_log%
ROBOCOPY %_path%\AppData\Roaming\Spark\ %_dest13% %_opt% %_log%
ROBOCOPY C:\CENO2019\ %_dest14% %_opt% %_log%
ROBOCOPY C:\CENO2019.new\ %_dest15% %_opt% %_log%
ROBOCOPY C:\CENO2020\ %_dest16% %_opt% %_log%
ROBOCOPY C:\CENO2021\ %_dest17% %_opt% %_log%
ROBOCOPY C:\CENO2022\ %_dest18% %_opt% %_log%
ROBOCOPY C:\SAF\ %_dest19% %_opt% %_log%
ROBOCOPY C:\SPED\ %_dest20% %_opt% %_log%
ROBOCOPY C:\storage\ %_dest21% %_opt% %_log%
ROBOCOPY C:\CENO2018\ %_dest22% %_opt% %_log%
ROBOCOPY "C:\Arquivos de Programas RFB\ " %_dest23% %_opt% %_log%
ROBOCOPY "C:\Program Files (x86)\Funeraria\ " %_dest24% %_opt% %_log%
ROBOCOPY "C:\Program Files (x86)\Serasa Experian\ " %_dest25% %_opt% %_log%
ROBOCOPY "C:\Program Files (x86)\Programas RFB\ " %_dest26% %_opt% %_log%
ROBOCOPY "C:\Program Files\A.E.T. Europe B.V\ " %_dest27% %_opt% %_log%
ROBOCOPY "C:\ProgramData\A.E.T. Europe B.V\ " %_dest28% %_opt% %_log%
ROBOCOPY "C:\ProgramData\Programas RFB\ " %_dest29% %_opt% %_log%
ROBOCOPY "C:\ProgramData\Serasa Experian\ " %_dest30% %_opt% %_log%
ROBOCOPY "C:\IBGE\ " %_dest31% %_opt% %_log%
ROBOCOPY "C:\Program Files (x86)\OMNIKEY\ " %_dest32% %_opt% %_log%
rem ROBOCOPY  %_dest33% %_opt% %_log%
rem ROBOCOPY  %_dest34% %_opt% %_log%
rem ROBOCOPY  %_dest35% %_opt% %_log%

@echo.
@echo *******************************************************************************
@echo #                                                                             #
@echo # Backup Concluido...
@echo #                                                                             #
@echo # Para mais informaçoes checar o arquivo %_dest%%_log%
@echo #                                                                             #
@echo *******************************************************************************
@echo.

:_end
	PAUSE
	EXIT
		
:_shutdown
	echo ************************************************************
	echo * O computador desligara em 1 segundo                      *
	echo ************************************************************
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