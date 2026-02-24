@echo off
color 0A
echo ===================================================
echo     Git Cache Cleaner (Auto-Check Mode)
echo             By: GitHub RIIIXCH
echo ===================================================
echo.

:: ---------------------------------------------------
:: CASE 1: เช็คและลบข้อมูลล็อกอิน (Windows Credential Manager)
:: ---------------------------------------------------
echo [1/2] Checking Windows Credential Manager for Git accounts...

:: ค้นหาว่ามี Credential ของ Git บันทึกไว้หรือไม่ (ซ่อน output ไว้)
cmdkey /list | findstr /i "git:" >nul 2>&1

:: เช็คผลลัพธ์: %errorlevel% เป็น 0 แปลว่า "เจอ"
if %errorlevel% equ 0 (
    echo    -^> Found Git credentials! Clearing them now...
    
    :: วนลูปเพื่อลบทุก account ของ git ที่เจอ
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

:: ใช้ 2>nul เพื่อซ่อน Error ในกรณีที่มันไม่มีค่าให้ลบอยู่แล้ว
git config --global --unset user.name 2>nul
git config --global --unset user.email 2>nul

echo    -^> Git Global config cleared!

echo.
echo ===================================================
echo Checking Current Global Config (Should be empty):
git config --global --list | findstr "user"
echo ===================================================
echo.
echo Done! You can now use a new Git account.
pause