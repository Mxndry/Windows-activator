@echo off
title Activador de Windows

setlocal enabledelayedexpansion

echo =================================
echo        Activador de Windows
echo =================================
echo.

echo Seleccione la edición de Windows a activar:
echo.
echo 1. Windows 10 Pro
echo 2. Windows 10 Home
echo 3. Windows 11 Pro
echo 4. Windows 11 Home
echo.

set /p choice=Ingrese el número correspondiente a la edición: 
echo.

if "%choice%"=="1" (
    set edition=Windows 10 Pro
    set product_key=W269N-WFGWX-YVC9B-4J6C9-T83GX
) else if "%choice%"=="2" (
    set edition=Windows 10 Home
    set product_key=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
) else if "%choice%"=="3" (
    set edition=Windows 11 Pro
    set product_key=W269N-WFGWX-YVC9B-4J6C9-T83GX
) else if "%choice%"=="4" (
    set edition=Windows 11 Home
    set product_key=YTMG3-N6DKC-DKB77-7M9GH-8HVX7
) else (
    echo Opción no válida. Por favor, ingrese un número válido.
    pause
    exit
)

echo.
echo Configuración de Windows:
echo ========================
echo Edición: %edition%
echo Clave del producto: %product_key%
echo Servidor KMS: kms.digiboy.ir
echo.

set /p confirm=¿Desea continuar con la activación? (S/N): 
echo.

if /i "%confirm%"=="S" (
    echo Activando Windows...
    echo.
    echo Instalando la clave del producto...
    slmgr /ipk %product_key%
    echo.
    echo Configurando el servidor KMS...
    slmgr /skms kms.digiboy.ir
    echo.
    echo Activando Windows...
    echo Set oShell = CreateObject("WScript.Shell") > temp.vbs
    echo oShell.Run "cmd /c slmgr /ato", 0, True >> temp.vbs
    echo Set oShell = Nothing >> temp.vbs
    cscript //nologo temp.vbs
    del temp.vbs
    echo.
    echo Windows activado correctamente.
) else (
    echo Activación cancelada por el usuario.
)

echo.
echo Presione cualquier tecla para salir.
pause >nul