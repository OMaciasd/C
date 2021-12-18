@ECHO OFF
mode con lines=12 

CALL variables.bat
CALL info.bat "DEPURADOR DE IMAGENES CLONADAS." "B1" "%A%" "%B%"


echo BUSCANDO ARCHIVOS REPETIDOS...
%SYSTEMROOT%\System32\timeout /t 10 /nobreak >nul

ECHO.
echo ...DEPURANDO ARCHIVOS REPETIDOS.

:: FUNCION QUE DEPURA LOS ARCHIVOS CLONADOS, VALIDANDOLOS POR MATCH EN HASH DE CADA METADATO.
%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe -Command "& {Get-ChildItem -recurse | get-filehash | group -property hash | where { $_.count -gt 1 } | %% { $_.group | select -skip 1 } | Remove-Item}"

%SYSTEMROOT%\System32\timeout /t 5 /nobreak >nul


CALL info.bat "COPIAR IMAGENES SOLAS." "A1" "%A%" "%B%"

mkdir copyArchivos
copy *.png copyArchivos /Y >nul
ECHO.
echo COPIANDO ARCHIVOS...

%SYSTEMROOT%\System32\timeout /t 10 /nobreak >nul
start "" copyArchivos