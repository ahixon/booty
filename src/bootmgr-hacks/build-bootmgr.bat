@echo off
cls

rem %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set edited=bootmgr.edited.exe
set destbm=bootmgr.edited
set tempbm=%destbm%.tmp
set header=resources\header.bin
rem %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


if exist %destbm% del %destbm%

if not exist %edited% goto :exit

echo
echo Updating PE checksum...
tools\PEChecksum64.exe %edited%

echo Compressing PE file to %tempbm%...
tools\bmzip64.exe /c %edited% %tempbm%

echo Joining 16-bit loader and PE files...
copy /b %header%+%tempbm% %destbm%
del %tempbm%

echo Done! New bootmgr is '%destbm%'
goto :finish

:exit
echo ERROR: Input file '%edited%' doesn't exist!

:finish
pause