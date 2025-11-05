# System Maintenance Suite (Assignment 5 - Capstone)

This repository contains automated Linux maintenance scripts to perform:

✅ System Backup  
✅ System Update & Cleanup  
✅ Log Monitoring  
✅ TUI Menu to run modules  

## 📁 Directory Structure
System-Maintainance-Suite/

│

├── scripts/

│   ├── backup.sh        # Backup script

│   ├── update.sh        # Update and cleanup script

│   ├── logwatch.sh      # Log monitoring script

│   ├── menu.sh          # Menu interface script

│   └── lib.sh           # Common functions and configuration loader

│

├── etc/

│   └── maint.conf       # Configuration file (backup paths, retention settings)

│

├── logs/                # Output logs created by scripts

│

└── README.md


🚀 Getting Started
Setup

Clone the repository and enter the project directory:

git clone https://github.com/VarshaAgarwal01/System-Maintainance-Suite.git

cd System-Maintainance-Suite


Make the scripts executable:

chmod +x scripts/*.sh


Edit the configuration file and update backup paths and retention values as required:

nano etc/maint.conf

How to Use

Run the menu interface:

./scripts/menu.sh


Or run scripts individually:

./scripts/backup.sh

./scripts/update.sh

./scripts/logwatch.sh
