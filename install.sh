#!/bin/bash

# ==========================================================
# My Dotfiles Setup Script
#
# This script automates the installation of software and
# the creation of symlinks for my personal dotfiles.
# ==========================================================

# Print the ASCII banner
sudo apt install figlet -y
echo ""
figlet "den's dotfiles"
echo ""

# Exit immediately if a command exits with a non-zero status.
set -e

# Define color codes for a better user experience
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# --- A helper function for printing messages ---
log() {
  echo -e "${GREEN}==> ${NC}${1}"
}

# --- A helper function for linking dotfiles ---
link_dotfile() {
  log "Creating symlink for $1..."
  ln -sf ~/dotfiles/$1 ~/$1
}

# -----------------------------------------------------------
# SECTION 1: Install System Packages and Applications
# -----------------------------------------------------------
log "SECTION 1: Installing system packages and applications..."
sudo apt update
sudo apt upgrade -y

# Install build tools and libraries for manual builds
log "Installing build tools and dependencies..."
sudo apt install -y build-essential
sudo apt install -y libcurl4-openssl-dev libsqlite3-dev pkg-config git curl systemd-dev libdbus-1-dev

# -----------------------------------------------------------
# SECTION 2: Install and Configure Core Software
# -----------------------------------------------------------
log "SECTION 2: Installing core applications (VS Code, Chrome, etc.)..."

# Install Visual Studio Code
log "Installing Visual Studio Code..."
sudo apt-get install -y wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm packages.microsoft.gpg
sudo apt update
sudo apt install -y code # or code-insiders

# Install Google Chrome
log "Installing Google Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
sudo apt --fix-broken install -y # To fix any broken dependencies

# Install Spotify
log "Installing Spotify..."
curl -sS https://download.spotify.com/debian/pubkey_7A3A7620EA01646B.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install -y spotify-client

# Install Todoist via Snap
log "Installing Todoist..."
sudo snap install todoist

# Install Zen Browser
# Note: Zen Browser does not have an official APT repository.
# You must download the .deb file from their website.
# The following command assumes the latest stable version.
log "Installing Zen Browser..."
wget -O zen-browser.deb https://github.com/zen-browser/zen-browser/releases/download/v1.0.0/zen-browser_1.0.0_amd64.deb
sudo apt install -y ./zen-browser.deb
rm zen-browser.deb

# -----------------------------------------------------------
# SECTION 3: Install Custom Software (Manual Builds)
# -----------------------------------------------------------
log "SECTION 3: Installing custom software (Dlang, OneDrive)..."

# Install Dlang
log "Installing Dlang..."
curl -fsS https://dlang.org/install.sh | bash -s dmd
source ~/dlang/dmd-2.111.0/activate

# Build and Install OneDrive
log "Building and installing OneDrive from source..."
git clone https://github.com/abraunegg/onedrive.git
cd onedrive
./configure
make clean; make;
sudo make install
cd .. # Go back to the previous directory to continue the script

# -----------------------------------------------------------
# SECTION 4: Configure Zsh and Powerlevel10k
# -----------------------------------------------------------
log "SECTION 4: Configuring Zsh and Powerlevel10k..."

# Install Zsh (if not already installed)
log "Installing Zsh..."
if ! command -v zsh &> /dev/null; then
  sudo apt install zsh -y
fi

# Check if Zsh is the default shell
if [[ "$(echo $SHELL)" != "$(which zsh)" ]]; then
  log "Changing default shell to Zsh..."
  chsh -s $(which zsh)
fi

# Install Oh My Zsh (if not already installed)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  log "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Clone Powerlevel10k repository
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  log "Cloning Powerlevel10k repository..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Create a symlink for your custom .zshrc
if [ -f ~/.zshrc ]; then
    log "Backing up existing .zshrc..."
    mv ~/.zshrc ~/.zshrc.bak
fi
log "Linking your custom .zshrc..."
ln -s ~/dotfiles/.zshrc ~/.zshrc

# -----------------------------------------------------------
# SECTION 5: Finalizing Setup
# -----------------------------------------------------------
log "SECTION 5: Finalizing setup..."
log "Setup complete! Please log out and back in to use your new setup."
