@echo off
rem SetLocal EnableExtensions
rem SetLocal EnableDelayedExpansion

set $strLocal8=%USERPROFILE%\APPDATA\Local\1C\1cv8
set $strRoaming8=%USERPROFILE%\APPDATA\Roaming\1C\1cv8
set $strLocal82=%USERPROFILE%\APPDATA\Local\1C\1cv82
set $strRoaming82=%USERPROFILE%\APPDATA\Roaming\1C\1cv82
set $strLocalXP="%USERPROFILE%\Local Settings\Application Data\1C\1Cv82"
set $strRoamingXP="%USERPROFILE%\Application Data\1C\1Cv82"
set $strLocalXP8="%USERPROFILE%\Local Settings\Application Data\1C\1Cv8"
set $strRoamingXP8="%USERPROFILE%\Application Data\1C\1Cv8"
set $goal=????????-????-????-????-?????????????

call :goKiller

rem IF Profile path has postfix ".000"
 SET $profile000=%USERPROFILE%
::Extract everything BUT the last 4 characters: .000
 SET $profile=%$profile000:~0,-4%
set $strLocal8=%$profile%\APPDATA\Local\1C\1cv8
set $strRoaming8=%$profile%\APPDATA\Roaming\1C\1cv8
set $strLocal82=%$profile%\APPDATA\Local\1C\1cv82
set $strRoaming82=%$profile%\APPDATA\Roaming\1C\1cv82
set $strLocalXP="%$profile%\Local Settings\Application Data\1C\1Cv82"
set $strRoamingXP="%$profile%\Application Data\1C\1Cv82"

call :goKiller

exit

:goKiller
call :Killer %$strLocal8%
call :Killer %$strRoaming8%
call :Killer %$strLocal82%
call :Killer %$strRoaming82%
call :Killer %$strLocalXP%
call :Killer %$strRoamingXP%
call :Killer %$strLocalXP8%
call :Killer %$strRoamingXP8%


:Killer
cd /d %1 || exit /B
For /F "delims=" %%d in ('dir /b /ad "*%$goal%"') do (
echo "Your cash deleted =)"
rmdir %%d /s /q
)

PING localhost -n 2 >NUL