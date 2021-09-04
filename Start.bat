REM INITIALISATION SEQUANCE





@ECHO OFF
cd /d %~dp0
mode con: cols=999 lines=999
title  %~dp0 - Jarvis 0.4
color 30
cls

SETLOCAL ENABLEEXTENSIONS
SETLOCAL ENABLEDELAYEDEXPANSION

:menuLOOP
echo     ___  __  ___  __    __  ___ _____  _____ 
echo    /   \/__\/ __\/__\/\ \ \/   \\_   \/__   \
echo   / /\ /_\ / _\ /_\ /  \/ / /\ / / /\/  / /\/
echo  / /_///__/ /  //__/ /\  / /_//\/ /_   / /   
echo /___,'\__/\/   \__/\_\ \/___,'\____/   \/    
                                             
echo.
echo.= DEFENDIT =================================================
echo.
for /f "tokens=1,2,* delims=_ " %%A in ('"findstr /b /c:":menu_" "%~f0""') do echo.    %%B  %%C
set choice=
echo.&set /p choice=Enter command  : ||GOTO:menu_loop
echo.&call:menu_%choice%
GOTO:menuLOOP

:menu_L Locker
goto:lockerinternal
cls
GOTO:EOF

:menu_SN Sniff
smsniff.exe
cls
GOTO:EOF

:menu_F    File Analysis
set f=
echo.&set /p f= File Path : 
echo:
FOR %%? IN (%f%) DO (
echo ---BASIC INFO ---------
	ECHO File Extension       : %%~x?
	ECHO File Attributes      : %%~a?
        ECHO Version              : %%~i
	ECHO Located on Drive     : %%~d?
	ECHO File Size            : %%~z?
	ECHO Last-Modified Date   : %%~t?
	ECHO Path                 : %%~f?
)
echo:
echo ---PERMISSIONS ---------
CACLS f
echo:
pause
GOTO:EOF






:menu_S    SYS info.
cls
echo.
echo.= INFO =================================================
echo.
for /f "tokens=1,2,* delims=_ " %%A in ('"findstr /b /c:":info_" "%~f0""') do echo.    %%B  %%C
set choice=
echo.&set /p choice=Enter command  : ||GOTO:menu_S
echo.&call:info_%choice%
GOTO:EOF

:menu_N    New CMD
cls
cmd.exe
GOTO:EOF


:menu_
goto:menuLOOP

:menu_C  Cls
cls
GOTO:EOF



:menu_X Exit
exit
GOTO:EOF

:info_S Sys info
cls
FOR /F "tokens=4 delims= " %%i in ('route print ^| find " 0.0.0.0"') do set localIp=%%i
echo:
echo    ********* SYSTEM INFO *********
echo     NAME    :   %COMPUTERNAME%
echo     IP      :   %localIp%
echo     OS      :   %OS%
echo     CORE    :   %PROCESSOR_ARCHITECTURE% (%NUMBER_OF_PROCESSORS%)
echo     USER    :   %USERNAME% 
echo      #SERVER:   %LOGONSERVER%
ping -n 1 www.google.com >nul
if errorlevel 1 (
echo     WWW     :   FALSE
  start speak.vbs noconnect.jarvis
echo    *******************************
echo:
pause
cls
  GOTO:EOF
)
echo     WWW     :   TRUE
  
echo:
pause
GOTO:menu_S


:info_T Task List
cls
tasklist
echo:
pause
GOTO:menu_S

:info_I Ip info
cls
ipconfig
echo:
pause
GOTO:menu_S

:info_A Adv. sysinfo
cls
systeminfo
echo:
pause
GOTO:EOF

:info_E Enviorment variables
cls
SET
echo:
pause
GOTO:menu_S

:info_
goto:menu_s

:info_x Main menu
goto:menuLOOP





:lockerinternal
cls
@ECHO OFF
set /p build=<pswd.jarvis
title ENCRYPTOR
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
if NOT EXIST Locker goto MDLOCKER
:CONFIRM
echo ENCRYPT DIR?(Y/N)
set/p "cho=>"
if %cho%==Y goto LOCK
if %cho%==y goto LOCK
if %cho%==n goto END
if %cho%==N goto END
cls
echo:
echo     INVALID ENTRY !
goto CONFIRM
:LOCK
ren Locker "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo:
echo     ENCRYPTION SUCCESFUL 
goto End
:UNLOCK
echo:
echo     ENTER CODE : 
set/p "pass=>"
if NOT %pass%==%build% goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" Locker
start explorer.exe Locker
echo DECRYPTION SEQUANCE FINISHED.
goto End
:FAIL
color 04
cls
echo:
echo    INVALID CODE !
goto UNLOCK
:MDLOCKER
md Locker
echo:
echo     NEW DIR CREATED !
echo:
pause
goto End
:End
goto:menuLOOP

GOTO:menuLOOP