@echo off

rem pperetko: Lenistwo matk¹ wynalazku.
rem Build systemu Najem bez udzia³u myszki ;-)...
cd ..\
cd Program\

brcc32 -foVersion.res Version.rc
rem brcc32 -foZasoby.res Zasoby.rc

dcc32 -$d- -$l- -$y- -$c- -h- -w- -q -b -u"C:\Program Files\Borland\Delphi7\Lib" DbSystem.dpr
if %errorlevel% == 0 (echo DBSystem: ok) else (echo DBSystem: error)

cd Zasoby

pause
