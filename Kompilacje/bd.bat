@echo off

rem pperetko: Lenistwo matk� wynalazku.
rem Build systemu Najem bez udzia�u myszki ;-)...
cd ..\
cd Program\

brcc32 -foVersion.res Version.rc
rem brcc32 -foZasoby.res Zasoby.rc

dcc32 -$d+ -$l+ -$y+ -$c+ -h- -w- -q -b -u"C:\Program Files\Borland\Delphi7\Lib"  DBSystem.dpr
if %errorlevel% == 0 (echo DbSystem: ok) else (echo DbSystem: error)



pause
