<div align="center">

# 🧹 Git Cache Cleaner

[![OS](https://img.shields.io/badge/OS-Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)](#)
[![Git](https://img.shields.io/badge/Tool-Git-F05032?style=for-the-badge&logo=git&logoColor=white)](#)
[![Author](https://img.shields.io/badge/Author-RIIIXCH-2ea44f?style=for-the-badge&logo=github&logoColor=white)](https://github.com/riiixch)

A smart, interactive batch script designed to effortlessly resolve **Git cache issues, Permission Denied errors, and account switching** on Windows. Highly recommended for **Lab PCs** or shared work environments.

</div>

---

## ✨ Features (Interactive Menu)

Upon running the script, you will be greeted with a user-friendly terminal menu:

| Option | Feature | Description |
|:---:|:---|:---|
| **[1]** | **Clear Windows Credentials** | Deletes stored Git credentials (passwords/tokens) from the Windows Credential Manager. |
| **[2]** | **Clear Global Config** | Unsets the global `user.name` and `user.email`. |
| **[3]** | **Clear Local Config & Fix Lock** | Clears repository-specific configs and safely deletes stuck `index.lock` files (Must run inside the target repository). |
| **[4]** | **Setup New & Manage Commit** | Guides you to set up new credentials and offers tools to **Amend (update author)** or **Undo** your last commit. |
| **[5]** | **🚀 Run ALL Steps** | **(Recommended)** Executes options 1 through 4 sequentially! |

---

## 🚀 How to Use

You can use the script in two ways:

### Method 1: Via Command Line (Terminal / CMD)
1. Clone the repository to your local machine:
```cmd
git clone https://github.com/riiixch/Git-Cache-Cleaner

```

2. Navigate into the cloned directory:
```cmd
cd Git-Cache-Cleaner

```


3. Run the script:
```cmd
script.bat

```



### Method 2: Drop into Target Repository (Best for Lab PCs)

1. Copy the `script.bat` file directly into your problematic project folder (the one containing the hidden `.git` folder).
2. Double-click `script.bat` to execute it.
3. Select **Option [5]** to perform a complete wipe and setup.
4. Follow the on-screen prompts to configure your new account and manage your last commit.

---

<div align="center">

Made with ❤️ by [**RIIIXCH**](https://github.com/riiixch)

[![GitHub](https://img.shields.io/badge/GitHub-RIIIXCH-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/riiixch)

</div>