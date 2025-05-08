@echo off
set "installPath=C:\Program Files\HP\Client Management Library"
set "installer=hp-cmsl-1.6.10.exe"

if exist "%installPath%" (
    echo HP Client Management Library is already installed.
) else (
    echo Installing HP Client Management Library...
    start /wait "" "%~dp0%installer%" /silent
    echo Installation complete.
)