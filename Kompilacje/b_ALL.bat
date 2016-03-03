@echo off

rem pperetko: Lenistwo matk¹ wynalazku.
rem Build systemu Najem bez udzia³u myszki ;-)...
cd ..\
cd Program\

brcc32 -foVersion.res Version.rc
rem brcc32 -foZasoby.res Zasoby.rc

dcc32 -$d- -$l- -$y- -$c- -h- -w- -q -b -u"C:\Program Files\Borland\Delphi7\Lib"; DBSystem.dpr
if %errorlevel% == 0 (echo DBSystem: ok) else (echo DbSystem: error)

rem cd Zasoby
rem cd ..\
cd Konfiguracja\
dcc32 -$d- -$l- -$y- -$c- -h- -w- -q -b -u"C:\Program Files\Borland\Delphi7\Lib"; Konfiguracja.dpr
if %errorlevel% == 0 (echo Konfiguracja: ok) else (echo Konfiguracja: error)


pause
