<div align="center">

# 🔑 Git Cache Cleaner

### Resolve Git Credential — Switch Accounts Effortlessly

[![Windows](https://img.shields.io/badge/Platform-Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)](https://www.microsoft.com/windows)
[![Batch Script](https://img.shields.io/badge/Script-Batch%20(.bat)-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)](#)
[![Git](https://img.shields.io/badge/Requires-Git-F05032?style=for-the-badge&logo=git&logoColor=white)](https://git-scm.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)](#-license--ลิขสิทธิ์)

<br/>

**🇬🇧 EN** | A lightweight Windows batch tool to clear cached Git credentials and switch between Git accounts seamlessly.

**🇹🇭 TH** | เครื่องมือ Batch สำหรับ Windows ที่ช่วยล้างข้อมูล Git Credential ที่แคชไว้ เพื่อสลับบัญชี Git ได้อย่างง่ายดาย

<br/>

</div>

---

## ✨ Features | ฟีเจอร์

### 🇬🇧 English

- 🔍 **Auto-detect** Git installation on your system
- 🗑️ **Clear credentials** stored in Windows Credential Manager
- 🧹 **Remove** global Git `user.name` and `user.email`
- ⚙️ **Set up** new Git credentials interactively
- ✅ **Verify** the updated config after changes

### 🇹🇭 ภาษาไทย

- 🔍 **ตรวจจับอัตโนมัติ** ว่ามี Git ติดตั้งในเครื่องหรือไม่
- 🗑️ **ล้างข้อมูลล็อกอิน** ที่เก็บอยู่ใน Windows Credential Manager
- 🧹 **ลบ** ค่า `user.name` และ `user.email` ใน Global Config
- ⚙️ **ตั้งค่า** ข้อมูล Git ใหม่แบบ Interactive
- ✅ **ตรวจสอบ** ค่า Config ที่อัปเดตหลังเปลี่ยนแปลง

---

## 📦 Requirements | สิ่งที่ต้องมี

| Requirement | Description (EN) | คำอธิบาย (TH) |
|:-----------:|:-----------------|:---------------|
| ![Windows](https://img.shields.io/badge/-Windows-0078D6?logo=windows&logoColor=white) | Windows 7 / 8 / 10 / 11 | ระบบปฏิบัติการ Windows 7 ขึ้นไป |
| ![Git](https://img.shields.io/badge/-Git-F05032?logo=git&logoColor=white) | Git installed & added to `PATH` | ติดตั้ง Git และเพิ่มลงใน `PATH` แล้ว |

> [!TIP]
> 🇬🇧 Download Git from [https://git-scm.com](https://git-scm.com/) if you haven't installed it yet.
>
> 🇹🇭 ดาวน์โหลด Git ได้ที่ [https://git-scm.com](https://git-scm.com/) หากยังไม่ได้ติดตั้ง

---

## 🚀 Getting Started | เริ่มต้นใช้งาน

### 🇬🇧 English

1. **Clone** this repository:
   ```bash
   git clone https://github.com/riiixch/resolveCredentialGit.git
   ```
2. **Navigate** into the project folder:
   ```bash
   cd resolveCredentialGit
   ```
3. **Run** the script:
   ```bash
   script.bat
   ```
   > Or simply **double-click** `script.bat` in File Explorer.

### 🇹🇭 ภาษาไทย

1. **โคลน** Repository นี้:
   ```bash
   git clone https://github.com/riiixch/resolveCredentialGit.git
   ```
2. **เข้าไปยัง** โฟลเดอร์โปรเจกต์:
   ```bash
   cd resolveCredentialGit
   ```
3. **รัน** สคริปต์:
   ```bash
   script.bat
   ```
   > หรือ **ดับเบิลคลิก** ไฟล์ `script.bat` ใน File Explorer ได้เลย

---

### 🇬🇧 Step-by-Step (EN)

| Step | Action |
|:----:|:-------|
| **0** | Verify Git is installed on the system |
| **1** | Scan Windows Credential Manager for cached Git tokens and remove them |
| **2** | Unset `user.name` and `user.email` from Git global config |
| **3** | *(Optional)* Prompt user to configure new Git credentials |

### 🇹🇭 ขั้นตอน (TH)

| ขั้นตอน | การทำงาน |
|:-------:|:---------|
| **0** | ตรวจสอบว่ามี Git ติดตั้งในเครื่องหรือไม่ |
| **1** | สแกนและลบ Token ของ Git ที่แคชใน Windows Credential Manager |
| **2** | ลบค่า `user.name` และ `user.email` ออกจาก Git Global Config |
| **3** | *(ไม่บังคับ)* ถามผู้ใช้ว่าต้องการตั้งค่าข้อมูล Git ใหม่หรือไม่ |

---

## 🖥️ Usage | วิธีใช้งาน

### ▶️ Running the Script | การรันสคริปต์

<details>
<summary>🇬🇧 <b>English — Click to expand</b></summary>
<br/>

After running `script.bat`, you'll see output similar to:

```
===================================================
    Git Cache Cleaner (Auto-Check Mode)
            By: GitHub RIIIXCH
===================================================

[0/2] Checking for Git installation...
   -> Git is installed. Proceeding...

[1/2] Checking Windows Credential Manager for Git accounts...
   -> Found Git credentials! Clearing them now...
   -> Credentials cleared successfully.

[2/2] Clearing Git Global Username and Email...
   -> Git Global config cleared!

Do you want to set up a new Git username and email now? (Y/N):
```

- Press **`Y`** to configure new credentials immediately.
- Press **`N`** to finish without setting up new credentials.

**If you pressed `Y`:**

```
===================================================
    Git Cache Cleaner (Auto-Check Mode)
            By: GitHub RIIIXCH
===================================================

 +-----------------------------------------------+
 |           SETUP NEW GIT CREDENTIALS           |
 +-----------------------------------------------+

 [?] Enter your new Git Username : your-username
 [?] Enter your new Git Email    : your-email@example.com

 +-----------------------------------------------+
 |               APPLYING CHANGES...             |
 +-----------------------------------------------+

   -> Successfully updated Git config!

===================================================
 Your Current Global Config:
user.name=your-username
user.email=your-email@example.com
===================================================

Done! Your Git is ready to go.
```

</details>

<details>
<summary>🇹🇭 <b>ภาษาไทย — คลิกเพื่อดูรายละเอียด</b></summary>
<br/>

หลังจากรัน `script.bat` จะเห็นผลลัพธ์คล้ายกับ:

```
===================================================
    Git Cache Cleaner (Auto-Check Mode)
            By: GitHub RIIIXCH
===================================================

[0/2] Checking for Git installation...
   -> Git is installed. Proceeding...

[1/2] Checking Windows Credential Manager for Git accounts...
   -> Found Git credentials! Clearing them now...
   -> Credentials cleared successfully.

[2/2] Clearing Git Global Username and Email...
   -> Git Global config cleared!

Do you want to set up a new Git username and email now? (Y/N):
```

- กด **`Y`** เพื่อตั้งค่าข้อมูล Git ใหม่ทันที
- กด **`N`** เพื่อจบการทำงานโดยไม่ตั้งค่าใหม่

**ถ้ากด `Y`:**

```
===================================================
    Git Cache Cleaner (Auto-Check Mode)
            By: GitHub RIIIXCH
===================================================

 +-----------------------------------------------+
 |           SETUP NEW GIT CREDENTIALS           |
 +-----------------------------------------------+

 [?] Enter your new Git Username : ชื่อผู้ใช้ของคุณ
 [?] Enter your new Git Email    : อีเมลของคุณ@example.com

 +-----------------------------------------------+
 |               APPLYING CHANGES...             |
 +-----------------------------------------------+

   -> Successfully updated Git config!

===================================================
 Your Current Global Config:
user.name=ชื่อผู้ใช้ของคุณ
user.email=อีเมลของคุณ@example.com
===================================================

Done! Your Git is ready to go.
```

</details>

---

## ⚠️ Important Notes | หมายเหตุสำคัญ

> [!WARNING]
> 🇬🇧 This script removes **all** Git credentials from Windows Credential Manager and clears your global Git config. Make sure you know the credentials for the account you want to switch to before running this script.
>
> 🇹🇭 สคริปต์นี้จะลบข้อมูล Git Credential **ทั้งหมด** ออกจาก Windows Credential Manager และล้างค่า Global Config ของ Git กรุณาเตรียมข้อมูลบัญชีที่ต้องการสลับไปให้พร้อมก่อนรันสคริปต์

> [!IMPORTANT]
> 🇬🇧 You may need to run the script as **Administrator** if you encounter permission errors.
>
> 🇹🇭 อาจจำเป็นต้องรันสคริปต์ในโหมด **Administrator** หากพบปัญหาเรื่องสิทธิ์การเข้าถึง

---

## 🤔 Use Cases | กรณีใช้งาน

### 🇬🇧 English

- 🔄 Switching between **personal** and **work** GitHub accounts
- 🛠️ Fixing **authentication errors** after changing passwords
- 🧑‍💻 Using **shared computers** where multiple users commit with Git
- 🏫 Resetting Git credentials in a **school or lab** environment

### 🇹🇭 ภาษาไทย

- 🔄 สลับระหว่างบัญชี GitHub **ส่วนตัว** กับ **ที่ทำงาน**
- 🛠️ แก้ปัญหา **Authentication Error** หลังเปลี่ยนรหัสผ่าน
- 🧑‍💻 ใช้กับ **คอมพิวเตอร์ที่ใช้ร่วมกัน** ที่มีหลายคน Commit ด้วย Git
- 🏫 รีเซ็ต Git Credential ใน **ห้องเรียนหรือห้องแล็บ**


---

## 📄 License | ลิขสิทธิ์

This project is licensed under the **MIT License**.

โปรเจกต์นี้อยู่ภายใต้สัญญาอนุญาต **MIT License**

---

<div align="center">

Made with ❤️ by [**RIIIXCH**](https://github.com/riiixch)

[![GitHub](https://img.shields.io/badge/GitHub-RIIIXCH-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/riiixch)

</div>