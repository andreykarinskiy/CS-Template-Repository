:: Initialize repository parameters and variables.

@echo off & setlocal

:: Show information text.
call :show-info

:: Rename Solution file.
::call :rename-solution

:: Replace Copyrights variables:
REM call :apply-copyrights @AUTHOR
REM call :apply-copyrights @COMPANY
REM call :apply-copyrights @PRODUCT

:: call :package @PACKAGE_NAME, MYPACKAGE
:: call :package @REPOSITORY_URL, MYREPOSITORY

call :show-complete

pause
exit /b %errorlevel%

::-------------------------------------------------------------------------
:show-info
echo **********************************************************************
echo *               Source code repository initialization.               *
echo **********************************************************************
echo
exit /b 0
::-------------------------------------------------------------------------
:show-complete
echo **********************************************************************
echo *                    Repository initialized.                         *
echo **********************************************************************
exit /b 0
::-------------------------------------------------------------------------
:rename-solution
set /p value=Solution name:
rename source\SOLUTION.sln %value%.sln
exit /b 0
::-------------------------------------------------------------------------
:apply-copyrights
set /p value=%~1: 
call :copyrights "%~1" %value%
exit /b 0
::-------------------------------------------------------------------------
:copyrights
echo Set Copyrights variable "%~1" to "%~2" 
call :replace ./source/Copyrights.props, %~1, %~2
exit /b 0
::-------------------------------------------------------------------------
:apply-package
set /p value=Name of package Author: 
call :copyrights "%~1" %value%
exit /b 0
::-------------------------------------------------------------------------
:package
echo Set Package variable "%~1" to "%~2" 
call :replace ./source/Package.props, %~1, %~2
exit /b 0
::-------------------------------------------------------------------------
:readme
:: 1. Replace @LICENSE placeholder by license type.
:: 2. Replace build badges (URLs).
exit /b 0
::-------------------------------------------------------------------------
:replace
REM set batchPath=%~dp0
REM powershell.exe -file "%batchPath%replace.ps1" ^
REM     -target %~1 ^
REM     -from %~2 ^
REM     -to %~3
exit /b 0