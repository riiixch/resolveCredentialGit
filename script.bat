@echo off
color 07

echo ===================================================
echo     Git Cache Cleaner (Auto-Check Mode)
echo             By: GitHub RIIIXCH
echo ===================================================
echo.

:: ---------------------------------------------------
:: ตรวจสอบหาโปรแกรม Git ในเครื่อง
:: ---------------------------------------------------
echo [0/2] Checking for Git installation...
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo    -^> ERROR: Git is not installed or not added to PATH!
    echo    -^> Please install Git from https://git-scm.com/ and try again.
    echo.
    pause
    exit /b
)
echo    -^> Git is installed. Proceeding...
echo.

:: ---------------------------------------------------
:: CASE 1: เช็คและลบข้อมูลล็อกอิน (Windows Credential Manager)
:: ---------------------------------------------------
echo [1/2] Checking Windows Credential Manager for Git accounts...

cmdkey /list | findstr /i "git:" >nul 2>&1

if %errorlevel% equ 0 (
    echo    -^> Found Git credentials! Clearing them now...
    
    for /F "tokens=1,2 delims= " %%G in ('cmdkey /list ^| findstr /i "git:"') do (
        echo    -^> Deleting: %%H
        cmdkey /delete:%%H >nul 2>&1
    )
    echo    -^> Credentials cleared successfully.
) else (
    echo    -^> No Git credentials found. Skipping to next step...
)

echo.
:: ---------------------------------------------------
:: CASE 2: ลบ Config Username และ Email ของ Git
:: ---------------------------------------------------
echo [2/2] Clearing Git Global Username and Email...

git config --global --unset user.name 2>nul
git config --global --unset user.email 2>nul

echo    -^> Git Global config cleared!
echo.

:: ---------------------------------------------------
:: ถามผู้ใช้ว่าต้องการตั้งค่า Username / Email ต่อเลยหรือไม่
:: ---------------------------------------------------
set /p setup_new="Do you want to set up a new Git username and email now? (Y/N): "
if /I "%setup_new%"=="Y" goto SETUP_CONFIG

:: ถ้าผู้ใช้ตอบ N หรือปุ่มอื่น จะข้ามการตั้งค่าและจบการทำงาน
echo.
echo ===================================================
echo Checking Current Global Config (Should be empty):
git config --global --list | findstr "user"
echo ===================================================
echo.
echo Done! You can now use a new Git account.
pause
exit /b

:: ---------------------------------------------------
:: ส่วนของ UI ตั้งค่า Username / Email ใหม่
:: ---------------------------------------------------
:SETUP_CONFIG
cls
echo ===================================================
echo     Git Cache Cleaner (Auto-Check Mode)
echo             By: GitHub RIIIXCH
echo ===================================================
echo.
echo  +-----------------------------------------------+
echo  ^|           SETUP NEW GIT CREDENTIALS           ^|
echo  +-----------------------------------------------+
echo.
set /p new_username="  [?] Enter your new Git Username : "
set /p new_email="  [?] Enter your new Git Email    : "
echo.
echo  +-----------------------------------------------+
echo  ^|               APPLYING CHANGES...             ^|
echo  +-----------------------------------------------+

:: นำค่าที่รับมาไปตั้งเป็น Global Config
git config --global user.name "%new_username%"
git config --global user.email "%new_email%"

echo.
echo    -^> Successfully updated Git config!
echo.
echo ===================================================
echo  Your Current Global Config:
git config --global --list | findstr "user"
echo ===================================================
echo.
echo Done! Your Git is ready to go.
pause
exit /b