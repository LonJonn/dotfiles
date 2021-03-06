#!/bin/zsh

# Installing Homebrew
if [[ $(which brew) =~ "not found" ]]; then
	echo "Installing Homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	if [[ $(uname) == "Linux" ]]; then
		# Source
		eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

		# Build Essentials
		echo "Installing build-essentials"
		sudo apt install build-essential
	fi
fi

# Installing Brew Packages
echo "Cleaning & Restoring Brewfile"
brew bundle install --global --cleanup
