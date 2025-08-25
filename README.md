# 🧹 Arch Cleaner

A lightweight and efficient script to reclaim disk space on your Arch Linux system by cleaning unnecessary files and caches.

## ✨ Features

- 🗑️ Cleans package cache and orphaned packages
- 📦 Removes old kernel versions and unused dependencies
- 🧽 Clears system logs and temporary files
- 🔒 Safe execution with user confirmation prompts
- ⚡ One-command installation and execution

## 🚀 Quick Start

Run the following command in your terminal:

```
curl -fsSL https://www.naturl.link/arch-cleaner | sh
```

Enter your sudo password when prompted, and let the script do its magic! ✨

## 📋 What Gets Cleaned

The script safely removes:

- **Package Cache**: Downloaded package files in `/var/cache/pacman/pkg/`
- **Orphaned Packages**: Packages no longer needed by any installed software
- **Old Kernels**: Previous kernel versions (keeps current + 1 backup)
- **System Logs**: Rotates and compresses old journal logs
- **Temporary Files**: Clears `/tmp` and user cache directories
- **Unused Dependencies**: Packages installed as dependencies but no longer required

## ⚠️ Safety Features

- 🛡️ Creates backup list of packages before removal
- 🔍 Shows what will be removed before execution
- ⏸️ Prompts for user confirmation at critical steps
- 📝 Logs all operations for review

## 🔧 Manual Installation

If you prefer to review the script first:

```bash
# Download the script
curl -fsSL https://www.naturl.link/arch-cleaner -o arch-cleaner.sh

# Make it executable
chmod +x arch-cleaner.sh

# Run the script
./arch-cleaner.sh
```

## 💾 Disk Space Savings

Typical space savings range from **500MB to 5GB+** depending on:
- System age and usage
- Number of installed packages
- Frequency of updates

## 🔄 Recommended Usage

- Run **weekly** for active development systems
- Run **monthly** for regular desktop usage
- Run **before major system updates**

## 🛠️ Requirements

- Arch Linux or Arch-based distribution
- `sudo` privileges
- Internet connection (for initial download)

## 📊 Before & After

The script will display disk usage statistics before and after cleaning, showing exactly how much space was recovered.

## 🤝 Contributing

Found a bug or have a suggestion? Feel free to:
- Open an issue
- Submit a pull request
- Share your feedback

## ⚖️ License

This project is open source and available under the [MIT License](LICENSE).

---

**⚡ Pro Tip**: Bookmark this command for quick access to system cleaning!

```bash
alias archclean='curl -fsSL https://www.naturl.link/arch-cleaner | sh' >> ~/.bashrc
```
---

*Made with ❤️ for the Arch Linux community*
