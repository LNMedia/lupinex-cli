# LNX-CLI

The "LNX Command Line Interface" (short: LNX-Cli) is a specially developed command line tool that offers the user an efficient and central option to carry out all system-related tasks directly via the console.

The aim of this tool is to provide a slim, interactive work environment that goes far beyond simple command input. Users can use the LNX-Cli everyday processes such as file management, system maintenance, tool calls or configurations quickly and without graphic user interface-and in an environment that is designed for speed, clarity and control.

Through modular expandability and clear structure, the LNX-Cli is aimed at both advanced users and technically interested users who value a consistent, minimalist and direct work tool.

---

## Table of Contents

- [LNX-CLI](#lnx-cli)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
    - [Requirements](#requirements)
    - [First steps – Getting Started with LNX-CLI](#first-steps--getting-started-with-lnx-cli)
      - [📦 Extract \& Launch](#-extract--launch)
      - [🌐 Language Selection](#-language-selection)
      - [🧪 Try Some Basic Commands](#-try-some-basic-commands)
      - [🧰 Enable Extended Features (optional)](#-enable-extended-features-optional)
      - [⚙️ Modules \& Scripts](#️-modules--scripts)
      - [🏁 Ready to Roll](#-ready-to-roll)
  - [Technologies](#technologies)
  - [📄 License \& Project Status](#-license--project-status)
    - [License:](#license)
    - [Project Status: 🚧 Early Development](#project-status--early-development)

---

## Installation

### Requirements

The only thing required to carry out the LNX Cli tool is a Windows operating system. Since it is based entirely on classic Windows technologies-namely batch scripts (.bat/.cmd) and optional VBScript (.VBS)-it works on practically any Windows version without additional installation.

- Batch files have been processed via CMD.exe by default since Windows 95 or Windows NT 4.0 and form the core of the system.
-VBScript, which can be used for interactive dialogues or GUI elements (e.g. Message boxes or input prompts), has been an integral part of the operating system since Windows 98 or NT 4.0 and is carried out via WScript.exe or CScript.exe.

As a result, the tool can also be used on older or slimmed-down Windows systems (e.g. Windows PE or Windows-to-GO environments) without additional dependencies.


- **🔧 Advanced functionality through additional tools**:
  Some of the integrated commands of the LNX Cli tool expand the possibilities beyond the Windows standard. In order to be able to use this completely, certain third-party tools are required-especially when working with Github and version control.

- **💡 Requirements for complete CLI functionality**:
  *Github commands*: Github Cli (GH) - enables interactions with Github directly via the command line, e.g. B. Repositors' cloning, creating issues or releasing releases.
  *Unix-like Shell commands*: Git Bash - provides a BASH terminal on Windows, including tools such as GrEP, AWK, SED, LS, CURL, SSH etc.-often also necessary for the use of the Github CLI.
  *Optional extensions*: WGET, CURL, Node, Python, ... - Some scripts offer support for network access, APIs or advanced data processing if corresponding programs are installed.

  **Important**: The *LNX-CLI* automatically recognizes whether the required tools are available and indicates the user if something is missing or only limited functionality is available.

- **⚙️ Plug-and-play on Windows**:
  The design of the tool is deliberately based on a plug-and-play principle, i.e. h. It works on every Windows calculator immediately after unpacking- *without setup *, *without installer *. Manual installation of external tools can only be necessary for additional features.

### First steps – Getting Started with LNX-CLI

The LNX-CLI is designed to run out of the box on any Windows system:
- **Windows 98 / NT 4.0 or newer**
- No setup required, no admin rights needed
- Fully offline-capable (except GitHub and other online commands)

**Recommended**:
- Windows 10 or 11 for best compatibility
- Terminal with ANSI color support (cmd.exe, Windows Terminal, ConEmu, Hyper, Alacritty, etc.)

#### 📦 Extract & Launch

1. Download the latest release or clone this repository:
    - GitHub:
    ```bash
    git clone https://github.com/LNMedia/lupinex-cli.git
    ```
    - Or download and extract the ZIP archive
2. Open the tool's root directory
3. Then double-click the 'launch.vbs' to start this tool.

#### 🌐 Language Selection

On the first launch, you'll be prompted to select your preferred language.
All menus, messages, and outputs will adjust accordingly.

You can change the language anytime via:
```bash
settings lang new_lang_code
```

*Supported languages*:
- English (en)
- German (de)

#### 🧪 Try Some Basic Commands

Once inside the CLI, you can enter commands such as:
```bash
help
settings 
clear
```

Tip: Many outputs are color-coded for better readability and style.

#### 🧰 Enable Extended Features (optional)

To fully unlock the power of LNX-CLI (especially for GitHub commands), we recommend installing a few additional tools:

- **GitHub Integration**: [GitHub CLI](https://cli.github.com) - Use GitHub commands like gh repo clone, gh issue create, etc.
- **Bash-like commands**: [Git Bash](https://git-scm.com/downloads) - Includes Bash terminal, Git, and UNIX-style tools like grep, sed, curl
- **Optional tools**: curl, wget, node, python - Some scripts may use these for advanced features or API access

The CLI will automatically check for installed tools and notify you if something is missing or partially supported.

#### ⚙️ Modules & Scripts

LNX-CLI is built with modularity in mind. You can add your own scripts inside bin/modules/ and call them directly via the CLI:

Example:
```bash
cleanup
update
```

#### 🏁 Ready to Roll

Once everything’s up and running, you can customize your CLI experience:
- Switch between dark/light themes
- Change the language
- Add your own scripts
- Set up the auto-updater (optional)
- Make it yours

---

## Technologies

This tool, which offers an interactive interface and I18N support, works with only 2, technologies pre-integrated directly in Windows:
- Batch (Win95/NT and up)
- VBScript (Win98 / NT 4.0 and up)

---

## 📄 License & Project Status

### License:
This project is licensed under the **MIT License** – meaning you're free to use, modify, and distribute the code, as long as the original license and copyright notice remain.

→ See LICENSE.txt for full terms.

### Project Status: 🚧 Early Development
LNX-CLI is currently in early development. That means:

- Many features are still experimental or incomplete
- Bugs and limitations are to be expected
- The internal structure may change significantly as development continues

**You are welcome to test, contribute, report issues, or just follow along as it evolves.**

Stay tuned – there’s a lot more to come!