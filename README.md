# Den's Dotfiles

A collection of configuration files and a shell script to automate the setup of a minimal, clean, and highly productive Ubuntu desktop for coding. This repository is designed to get a new system from a fresh install to a fully configured environment with a single command.

## ✨ Features

This setup script automates the installation and configuration of the following:

  -  Zsh with Powerlevel10k for a fast, customizable terminal prompt.
  -  Essential build tools and libraries for development.
  -  Google Chrome and Visual Studio Code.
  -  JetBrains Toolbox for managing IDEs.
  - Spotify and Todoist.
  - Dlang and OneDrive.
  - Automatic symlinking of all your configuration files.

## 🚀 Installation

Follow these steps to set up a new system with these dotfiles.

### Prerequisites

You need a fresh installation of Ubuntu and the git command-line tool.
Bash

` sudo apt install git `

Setup

    Clone this repository to your home directory:

` git clone https://github.com/your-username/dotfiles.git ~/dotfiles `

Navigate into the new directory:
Bash

` cd ~/dotfiles  `

Run the setup script. This will ask for your password to install software and will print status updates as it runs.
Bash

  ` ./install.sh  `

⚠️ Important Notes

    Post-Installation: After the script finishes, you will need to log out and log back in to fully activate your new Zsh shell and theme.

    Powerlevel10k Configuration: The first time you open a new terminal, the Powerlevel10k configuration wizard will start automatically. Follow the prompts to configure your personalized prompt style.

    OneDrive Setup: You will need to run onedrive in your terminal to complete the initial setup and login process for the first time.

🙏 Acknowledgements

This setup script and its configurations are built upon the excellent work of the open-source community. Special thanks to the following projects:

    Powerlevel10k: By Romkatv

    OneDrive Client for Linux: By Abraunegg

    Oh My Zsh: By the Oh My Zsh team

    Visual Studio Code: By Microsoft

    Google Chrome: By Google
    JetBrains Toolbox for managing IDEs.

    Spotify and Todoist.

    Dlang and OneDrive.

    Automatic symlinking of all your configuration files.

🚀 Installation

Follow these steps to set up a new system with these dotfiles.

Prerequisites

You need a fresh installation of Ubuntu and the git command-line tool.
Bash

sudo apt install git

Setup

    Clone this repository to your home directory:
    Bash

git clone https://github.com/your-username/dotfiles.git ~/dotfiles

Navigate into the new directory:
Bash

cd ~/dotfiles

Run the setup script. This will ask for your password to install software and will print status updates as it runs.
Bash

    ./install.sh

⚠️ Important Notes

    Post-Installation: After the script finishes, you will need to log out and log back in to fully activate your new Zsh shell and theme.

    Powerlevel10k Configuration: The first time you open a new terminal, the Powerlevel10k configuration wizard will start automatically. Follow the prompts to configure your personalized prompt style.

    OneDrive Setup: You will need to run onedrive in your terminal to complete the initial setup and login process for the first time.

🙏 Acknowledgements

This setup script and its configurations are built upon the excellent work of the open-source community. Special thanks to the following projects:

    Powerlevel10k: By Romkatv

    OneDrive Client for Linux: By Abraunegg

    Oh My Zsh: By the Oh My Zsh team

    Visual Studio Code: By Microsoft

    Google Chrome: By Google
