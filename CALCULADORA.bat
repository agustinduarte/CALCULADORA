:: Franco Acosta
:: Agustin Duarte
:: Nicolas Vaz
echo off
title CALCULADORA
mode con: cols=58 lines=35
color b
cls

:calc
type menu.txt
echo.
set /p OP="QUE DECEA HACER?: "

if %OP% EQU 1 set SIGNO=+& goto suma
if %OP% EQU 2 set SIGNO=-& goto resta
if %OP% EQU 3 set SIGNO=*& goto multiplicacion
if %OP% EQU 4 set SIGNO=/& goto division 
if %OP% EQU x exit
if %OP% EQU @ goto historial
if %OP% EQU $ goto borrar
echo.
echo ERROR: Seleccione una opcion valida.
goto tecla

:menu
cls 
goto calc

:tecla
echo.
echo PARA HACER OTRA OPERACION PRECIONE CUALQUIER TECLA
pause>nul
goto menu 

:guardar 
echo.
echo %NUM1% %SIGNO% %NUM2% = %RESUL%
echo %num1%%signo%%num2%=%resul% >> %USERPROFILE%\Documents\historial.txt
attrib +h %USERPROFILE%\Documents\historial.txt
goto tecla

:historial
echo.
echo ---- [HISTORIAL] ----
echo.
if exist %USERPROFILE%\Documents\historial.txt (
    type %USERPROFILE%\Documents\historial.txt
) else (
    echo EL HISTORIAL ESTA VACIO!
)
::if not exist %USERPROFILE%\Documents\historial.txt echo EL HISTORIAL ESTA VACIO! 
::if exist %USERPROFILE%\Documents\historial.txt type %USERPROFILE%\Documents\historial.txt
goto tecla

:borrar
if exist %USERPROFILE%\Documents\historial.txt (
    del %USERPROFILE%\Documents\historial.txt /A:H
    echo.
    echo HISTORIAL BORRADO!
    goto tecla
) else (
    echo.
    echo HISTORIAL BORRADO!
    goto tecla
)

:suma
echo.
echo  ---- [SUMA] ----
echo.
set /p NUM1="PRIMER NUMERO: "
set /p NUM2="SEGUNDO NUMERO: "
set /a RESUL=(num1+num2)
goto guardar

:resta
echo.
echo ---- [RESTA] ----
echo.
set /p NUM1="PRIMER NUMERO: "
set /p NUM2="SEGUNDO NUMERO: "
set /a RESUL=(num1-num2)
goto guardar

:multiplicacion
echo.
echo ---- [MULTIPLICACION] ----
echo.
set /p NUM1="PRIMER NUMERO: "
set /p NUM2="SEGUNDO NUMERO: "
set /a RESUL=(num1*num2)
goto guardar

:division
echo.
echo ---- [DIVISION] ----
echo.
set /p NUM1="PRIMER NUMERO: "
set /p NUM2="SEGUNDO NUMERO: "
if %NUM2% EQU 0 (
    echo.
    echo ERROR: No es posible dividir entre 0
    goto tecla
 )
set /a RESUL=(num1/num2)
goto guardar