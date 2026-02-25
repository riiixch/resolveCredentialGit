@echo off
setlocal enabledelayedexpansion
color 07

:: ---------------------------------------------------
:: [0] ตรวจสอบหาโปรแกรม Git ในเครื่อง (ทำเสมอเมื่อเปิดไฟล์)
:: ---------------------------------------------------
echo [*] Checking for Git installation...
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo    -^> ERROR: Git is not installed or not added to PATH!
    echo    -^> Please install Git from https://git-scm.com/ and try again.
    echo.
    pause
    exit /b
)

:: ===================================================
:: MAIN MENU (หน้าเมนูหลัก)
:: ===================================================
:MAIN_MENU
cls
echo ===================================================
echo     Git Cache Cleaner ^& Config Setup (Lab PC)
echo             By: GitHub RIIIXCH
echo ===================================================
echo.
echo  Please select an option:
echo  [1] Clear Windows Credentials
echo  [2] Clear Global Config
echo  [3] Clear Local Config ^& Fix Lock
echo  [4] Setup New Credentials ^& Manage Commit
echo  [5] Run All Steps
echo  [0] Exit
echo.
set /p menu_choice="  [?] Choose an option (0-5): "

:: นำทางไปยังตัวเลือกที่ผู้ใช้เลือก
if "!menu_choice!"=="1" goto MENU_1
if "!menu_choice!"=="2" goto MENU_2
if "!menu_choice!"=="3" goto MENU_3
if "!menu_choice!"=="4" goto MENU_4
if "!menu_choice!"=="5" goto MENU_5
if "!menu_choice!"=="0" exit /b

:: ถ้าพิมพ์อย่างอื่นมา ให้กลับไปหน้าเมนู
goto MAIN_MENU


:: ===================================================
:: MENU HANDLERS (จัดการการเรียกใช้ตามเมนู)
:: ===================================================
:MENU_1
cls
call :FUNC_CLEAR_CREDENTIALS
echo.
pause
goto MAIN_MENU

:MENU_2
cls
call :FUNC_CLEAR_GLOBAL
echo.
pause
goto MAIN_MENU

:MENU_3
cls
call :FUNC_CLEAR_LOCAL
echo.
pause
goto MAIN_MENU

:MENU_4
cls
call :FUNC_SETUP_NEW
echo.
pause
goto MAIN_MENU

:MENU_5
cls
call :FUNC_CLEAR_CREDENTIALS
echo.
call :FUNC_CLEAR_GLOBAL
echo.
call :FUNC_CLEAR_LOCAL
echo.
call :FUNC_SETUP_NEW
echo.
pause
goto MAIN_MENU


:: ===================================================
:: FUNCTIONS (ฟังก์ชันการทำงานหลัก แยกส่วนชัดเจน)
:: ===================================================

:FUNC_CLEAR_CREDENTIALS
echo [*] Checking Windows Credential Manager for Git accounts...
cmdkey /list | findstr /i "git:" >nul 2>&1
if %errorlevel% equ 0 (
    echo    -^> Found Git credentials! Clearing them now...
    for /F "tokens=1,2 delims= " %%G in ('cmdkey /list ^| findstr /i "git:"') do (
        echo    -^> Deleting: %%H
        cmdkey /delete:%%H >nul 2>&1
    )
    echo    -^> Credentials cleared successfully.
) else (
    echo    -^> No Git credentials found.
)
exit /b

:FUNC_CLEAR_GLOBAL
echo [*] Clearing Git Global Username and Email...
git config --global --unset user.name 2>nul
git config --global --unset user.email 2>nul
echo    -^> Git Global config cleared!
exit /b

:FUNC_CLEAR_LOCAL
echo [*] Checking current directory for Local Git repository...
if exist .git\ (
    echo    -^> Found Git repository in this folder!
    git config --local --unset user.name 2>nul
    git config --local --unset user.email 2>nul
    echo    -^> Local config cleared (if any).
    if exist .git\index.lock (
        echo    -^> WARNING: Found stuck 'index.lock' file!
        del /f /q .git\index.lock
        echo    -^> Deleted 'index.lock'. You can now commit normally.
    )
) else (
    echo    -^> No local Git repository found in this directory.
)
exit /b

:FUNC_SETUP_NEW
echo  +-----------------------------------------------+
echo  ^|           SETUP NEW GIT CREDENTIALS           ^|
echo  +-----------------------------------------------+
echo.
set /p setup_new="[?] Do you want to set up a new Git username and email now? (Y/N): "
if /I "!setup_new!" NEQ "Y" (
    echo    -^> Setup skipped.
    goto SHOW_CONFIG
)

set /p new_username="  [?] Enter your new Git Username : "
set /p new_email="  [?] Enter your new Git Email    : "
echo.

git config --global user.name "!new_username!"
git config --global user.email "!new_email!"
echo    -^> Successfully updated Git config!

:: เช็คและถามเรื่องแก้ไข Commit
if exist .git\ (
    echo.
    echo  +-----------------------------------------------+
    echo  ^|         MANAGE LAST COMMIT (OPTIONAL)         ^|
    echo  +-----------------------------------------------+
    echo  [1] UPDATE last commit author to !new_username!
    echo  [2] UNDO [Delete] last commit ^(Your files are SAFE^)
    echo  [3] Skip and do nothing
    echo.
    set /p commit_action="  [?] Choose an option (1/2/3): "

    if "!commit_action!"=="1" (
        echo    -^> Updating commit author...
        git commit --amend --reset-author --no-edit >nul 2>&1
        if !errorlevel! equ 0 (
            echo    -^> Success! Last commit updated.
        ) else (
            echo    -^> Failed. [Maybe no commits exist yet?]
        )
    ) else if "!commit_action!"=="2" (
        echo    -^> Undoing last commit...
        git reset HEAD~1 >nul 2>&1
        if !errorlevel! equ 0 (
            echo    -^> Success! The last commit has been undone.
        ) else (
            echo    -^> Failed. [Maybe no commits to undo?]
        )
    ) else (
        echo    -^> Skipped commit management.
    )
)

:SHOW_CONFIG
echo.
echo ===================================================
echo  Your Current Global Config:
git config --global --list | findstr "user"
echo ===================================================
exit /b