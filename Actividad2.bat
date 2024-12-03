@echo off

cls

set "dir_raiz="

:menu
echo.
echo 1 - CREAR ESTRUCTURA
echo 2 - CREAR INFORMACION
echo 3 - SALIR
echo.
set /p opcion=Elige una opcion: 

if "%opcion%"=="1" goto crear_estructura
if "%opcion%"=="2" goto crear_informacion
if "%opcion%"=="3" goto salir
echo Opcion invalida.
goto menu

:crear_estructura
set /p dir_raiz=Introduce el nombre del directorio raiz: 
mkdir "%dir_raiz%"
mkdir "%dir_raiz%\RED"
mkdir "%dir_raiz%\SISTEMA"
mkdir "%dir_raiz%\ONLINE"
:: Asegurar permisos de escritura
icacls "%dir_raiz%" /grant *S-1-1-0:(OI)(CI)F
icacls "%dir_raiz%\RED" /grant *S-1-1-0:(OI)(CI)F
icacls "%dir_raiz%\SISTEMA" /grant *S-1-1-0:(OI)(CI)F
icacls "%dir_raiz%\ONLINE" /grant *S-1-1-0:(OI)(CI)F

echo Estructura de directorios creada con permisos de escritura.
goto menu

:crear_informacion
set /p unidad=Introduce la letra de la unidad para CHKDSK (ej: C): 
chkdsk %unidad%: /f > "%dir_raiz%\SISTEMA\CHEQUEO.txt"
set /p ip=Introduce la IP para el PING: 
ping %ip% > "%dir_raiz%\ONLINE\PING.txt"
ipconfig /all > "%dir_raiz%\RED\CONFIGRED.txt"
echo Informacion generada.
goto menu

:salir
echo Saliendo del programa...
pause

:fin

