cls
Color 03

@echo.
@echo *******************************************************************************
@echo # 
@echo   !BATCH DE LIMPEZA DE TEMPORARIOS E CACHE DE TODOS OS USUARIOS!
@echo # 
@echo   ISSO NAO IRA APAGAR NENHUM DOCUMENTO!
@echo   Apenas arquivos de cache e temporarios serão apagados
@echo # 
@echo   Rodando com os privilegios de %USERNAME% em %COMPUTERNAME%
@echo # 
@echo   %USERNAME% deve possuir privilegios de administrador
@echo # 
@echo   Feche a janela e re-abra com privilegios de administrador caso contrario
@echo # 
@echo   !ESTA OPERACAO PODE DEMORAR 10+ MINUTOS DEPENDENDO DO NUMERO DE USUARIOS!
@echo # 
@echo   Duvidas? procurar guilherme.polizel.767@gmail.com
@echo # 
@echo *******************************************************************************
pause

@echo.
@echo *******************************************************************************
@echo * Fechando programas em %COMPUTERNAME%
@echo *******************************************************************************

taskkill /F /IM "iexplore.exe">nul 2>&1
taskkill /F /IM "chrome.exe">nul 2>&1
taskkill /F /IM "firefox.exe">nul 2>&1
taskkill /F /IM "explorer.exe">nul 2>&1
taskkill /F /IM "msedge.exe">nul 2>&1
taskkill /F /IM "opera.exe">nul 2>&1

@echo.
@echo *******************************************************************************
@echo * Limpando os temporarios de todos os usuarios em %COMPUTERNAME%
@echo *******************************************************************************

for /D %%G in ("%SystemDrive%\Users\*") do erase /F /S /Q "%%G\AppData\Local\Temp\*.*"
for /D %%G in ("%SystemDrive%\Users\*") do RD /S /Q "%%G\AppData\Local\Temp\"


@echo.
@echo *******************************************************************************
@echo * Limpando os temporarios do Windows em %COMPUTERNAME%
@echo *******************************************************************************

erase /F /S /Q "%SystemRoot%\TEMP\*.*"
for /D %%G in ("%SystemRoot%\TEMP\*") do RD /S /Q "%%G"
erase /F /S /Q "%SystemDrive%\nvidia\"
RD /S /Q "%SystemDrive%\nvidia\"
erase /F /S /Q "%SystemDrive%%\Windows.old\"
RD /S /Q "%SystemDrive%%\Windows.old\"
erase /F /S /Q "%SystemDrive%%\Windows.old(1)\"
RD /S /Q "%SystemDrive%%\Windows.old(1)\"
erase /F /S /Q "%SystemDrive%%\Windows.old(2)\"
RD /S /Q "%SystemDrive%%\Windows.old(2)\"
erase /F /S /Q "%SystemDrive%%\Windows.old(3)\"
RD /S /Q "%SystemDrive%%\Windows.old(3)\"
erase /F /S /Q "%SystemDrive%%\Windows.old(4)\"
RD /S /Q "%SystemDrive%%\Windows.old(4)\"

@echo.
@echo *******************************************************************************
@echo * Limpando cache do Google Chrome de todos os usuarios em %COMPUTERNAME%
@echo *******************************************************************************

for /D %%G in ("%SystemDrive%\Users\*") do erase /F /S /Q "%%G\AppData\Local\Google\Chrome\*.*"
for /D %%G in ("%SystemDrive%\Users\*") do erase /F /Q "%%G\AppData\Local\Google\Chrome*"

@echo.
@echo *******************************************************************************
@echo * Limpando cache do Adobe Flash Player em %COMPUTERNAME%
@echo *******************************************************************************

for /D %%G in ("%SystemDrive%\Users\*") do erase /F /S /Q "%%G\AppData\Local\Macromedia\Flash Player\*.*"
for /D %%G in ("%SystemDrive%\Users\*") do erase /F /S /Q "%%G\AppData\Roaming\Macromedia\Flash Player\*.*"
for /D %%G in ("%SystemDrive%\Users\*") do RD /S /Q "%%G\AppData\Local\Macromedia\Flash Player\"
for /D %%G in ("%SystemDrive%\Users\*") do RD /S /Q "%%G\AppData\Roaming\Macromedia\Flash Player\"

@echo.
@echo *******************************************************************************
@echo * Realizando Update das configuracoes de %USERNAME% em %COMPUTERNAME%
@echo *******************************************************************************

(echo n
echo n) | GPUpdate /force /sync

@echo.
@echo *******************************************************************************
@echo * Limpando cache do Internet Explorer em %COMPUTERNAME%
@echo *******************************************************************************

RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 260
for /D %%G in ("%SystemDrive%\Users\*") do erase /F /S /Q "%%G\AppData\Local\Microsoft\Windows\Tempor~1\*.*"
for /D %%G in ("%SystemDrive%\Users\*") do RD /S /Q "%%G\AppData\Local\Microsoft\Windows\Tempor~1\"

@echo.
@echo *******************************************************************************
@echo * Limpando cache do Java em %COMPUTERNAME%
@echo *******************************************************************************

javaws -uninstall

@echo.
@echo *******************************************************************************
@echo * Limpando cache do Spooler de impressao em %COMPUTERNAME%
@echo *******************************************************************************

NET STOP SPOOLER
NET START SPOOLER

@echo.
@echo *******************************************************************************
@echo * Limpando cache DNS em %COMPUTERNAME%
@echo *******************************************************************************

ipconfig /release
ipconfig /flushdns
ipconfig /renew
ipconfig /registerdns

@echo.
@echo *******************************************************************************
@echo * Forçando Update do Windows em %COMPUTERNAME%
@echo *******************************************************************************

net stop wuauclt.exe
net stop wuauserv
net stop bits
net stop cryptsvc
erase /F /S /Q "%SystemRoot%\SoftwareDistribution\*.*"
erase /F /S /Q "C:\Windows\SoftwareDistribution\*.*"
for /D %%G in ("%SystemRoot%\SoftwareDistribution\*") do RD /S /Q "%%G"
for /D %%G in ("C:\Windows\SoftwareDistribution\*") do RD /S /Q "%%G"
erase /F /S /Q "%SystemRoot%\System32\catroot2\*.*"
erase /F /S /Q "C:\Windows\System32\catroot2\*.*"
for /D %%G in ("%SystemRoot%\System32\catroot2\*") do RD /S /Q "%%G"
for /D %%G in ("C:\Windows\System32\catroot2\*") do RD /S /Q "%%G"
net start bits
net start cryptsvc
net start wuauclt.exe
net start wuauserv
wuauclt.exe /updatenow
wuauserv /updatenow

@echo.
@echo *******************************************************************************
@echo * Abrindo Explorer em %COMPUTERNAME%
@echo *******************************************************************************

explorer.exe

pause
