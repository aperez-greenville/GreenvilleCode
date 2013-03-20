@REM ***********************************************
@REM Telestaff.bat - Telestaff file copy
@REM Author: Alvaro A. Perez
@REM Version 1.0 
@REM Last Revised: 03-20-2013
@REM This Batch File will copy all files in the Express Update V10 Folder
@ECHO OFF


systeminfo | find "System type" > %TEMP%\Systemtype.txt
FOR /F "usebackq delims=: tokens=2" %%i IN (%TEMP%\Systemttype.txt) DO set vers=%%i

echo %vers% | find "x64-based PC" > nul
if %ERRORLEVEL% == 0 goto x_64

echo %vers% | find "X86-based PC" > nul
if %ERRORLEVEL% == 0 goto x_32



:x_64
:Run Windows 64bit specific commands here.
echo 64BIT

cd C:\Program Files (x86)\TeleStaff\LIB

if exist {C:\Program Files (x86)\TeleStaff\LIB}(
  robocopy "\\fs1\Apps\TeleStaff\ExpressUpdateV10_DesktopFiles" "C:\Program Files (x86)\TeleStaff\LIB" /e /mir /np
) else ( 
go to copy_x_64
)
 
:copy_x_64
 
 
if exist {C:\Program Files (x86)\TeleStaff\LIB}(
  copy "\\fs1\Apps\TeleStaff\ExpressUpdateV10_DesktopFiles" "C:\Program Files (x86)\TeleStaff\LIB"
) else ( 
go to exit
)
 
goto exit

:x_32
:Run Window 32bit specific commands here.
echo 32BIT

if exist {C:\Program Files\TeleStaff\LIB}(
 robocopy "\\fs1\Apps\TeleStaff\ExpressUpdateV10_DesktopFiles" "C:\Program Files\TeleStaff\LIB" /e /mir /np
 ) else (
 copy_x_32
 )
 
 :copy_x_32
 if exist {C:\Program Files\TeleStaff\LIB}(
  copy "\\fs1\Apps\TeleStaff\ExpressUpdateV10_DesktopFiles" "C:\Program Files\TeleStaff\LIB"
 ) else (
 go to exit
 )

goto exit