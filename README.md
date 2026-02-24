# 🧹 resolveCredentialGit
Resolve Credential Git Cache Cleaner for Windows 10/11

[![OS](https://img.shields.io/badge/OS-Windows_11-blue?logo=windows)](#)
[![Git](https://img.shields.io/badge/Tool-Git-F05032?logo=git&logoColor=white)](#)

[🇹🇭 ภาษาไทย](#-ภาษาไทย) | [🇬🇧 English](#-english)

---

## 🇹🇭 ภาษาไทย

สคริปต์แบทช์ (`script.bat`) สำหรับลบแคชบัญชีผู้ใช้ Git และการตั้งค่า Config บน Windows 10/11 แบบอัตโนมัติ เหมาะสำหรับผู้ที่ต้องการเปลี่ยนบัญชี GitHub, GitLab หรือ Bitbucket ในเครื่องคอมพิวเตอร์ แต่ติดปัญหา Push/Pull ไม่ได้เพราะระบบจำบัญชีเดิมไว้

### ✨ ฟีเจอร์หลัก
สคริปต์นี้ทำงานด้วยระบบ **Auto-Check** โดยจะแบ่งการทำงานเป็น 2 ส่วน:
1. **Clear Windows Credentials (ลบข้อมูลล็อกอิน):** ตรวจสอบว่ามีบัญชี Git ค้างอยู่ใน `Windows Credential Manager` หรือไม่ หากเจอ ระบบจะทำการลบทิ้งให้ทันที แต่ถ้าไม่เจอจะข้ามขั้นตอนนี้ไปโดยไม่เกิด Error
2. **Clear Git Global Config (ลบชื่อและอีเมล):** ทำการลบ `user.name` และ `user.email` ที่อยู่ใน Global Config ของ Git ออก เพื่อให้คุณพร้อมสำหรับการตั้งค่าบัญชีใหม่

### 🚀 วิธีการใช้งาน
เปิด Command Prompt (cmd) หรือ Terminal แล้วรันคำสั่งตามลำดับต่อไปนี้:

1. Clone repository นี้ลงมาที่เครื่องของคุณ:
```cmd
git clone https://github.com/riiixch/resolveCredentialGit

```

2. เข้าไปที่โฟลเดอร์ของโปรเจกต์:
```cmd
cd resolveCredentialGit

```


3. รันสคริปต์เพื่อล้างแคช:
```cmd
script.bat

```


4. เมื่อสคริปต์ทำงานเสร็จสิ้น คุณสามารถใช้งาน `git push` หรือ `git pull` ได้เลย ระบบจะแจ้งให้คุณล็อกอินด้วยบัญชีใหม่อีกครั้ง

---

## 🇬🇧 English

A simple batch script (`script.bat`) to automatically clear Git credentials and global configuration on Windows 11. This is highly useful when you need to switch GitHub, GitLab, or Bitbucket accounts but are blocked by authentication errors due to cached credentials.

### ✨ Features

This script uses an **Auto-Check** mechanism and performs two main tasks:

1. **Clear Windows Credentials:** It checks the `Windows Credential Manager` for any stored Git accounts. If found, it safely deletes them. If no credentials exist, it gracefully skips to the next step.
2. **Clear Git Global Config:** It unsets the `user.name` and `user.email` from your Git global configuration, giving you a clean slate for your next commit.

### 🚀 How to Use

Open your Command Prompt (cmd) or Terminal and run the following commands:

1. Clone this repository to your local machine:
```cmd
git clone https://github.com/riiixch/resolveCredentialGit

```


2. Navigate into the project directory:
```cmd
cd resolveCredentialGit

```


3. Run the script to clear the cache:
```cmd
script.bat

```


4. Once the process is complete, the next time you run `git push` or `git pull`, Git will prompt you to authenticate with your new credentials.

---

**Note:** *This script is safe to use and will not affect your local repositories or actual code files.*