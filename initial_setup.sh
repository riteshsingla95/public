#!/bin/bash

# Function to check if a command exists and prompt for installation if not
check_and_install() {
  local cmd_name=$1
  local install_prompt="Do you want to install $cmd_name? (Y/n)"

  if command -v "$cmd_name" &> /dev/null; then
    echo "$cmd_name is already installed."
  else
    echo "$cmd_name is not found."
    read -rp "$install_prompt " yn
    case "$yn" in
      [Nn]* ) echo "Skipping $cmd_name installation.";;
      * ) echo "Please install $cmd_name manually. (e.g., 'sudo apt install $cmd_name' or 'brew install $cmd_name')";;
    esac
  fi
}

echo "Starting initial setup..."

# Check for git
check_and_install "git"

# Check for GitHub CLI (gh)
check_and_install "gh"

echo "Initial setup complete."