#!/bin/bash
if [ "$1" = "macos" ] | [ "$1" = "linux" ]
then
	clear

	echo "Installing NVM"
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

	echo "Installing node v11.12.0"
	source ~/.nvm/nvm.sh
	source ~/.profile
	source ~/.bashrc
	nvm install v11.12.0


	echo "Installing truffle 5.1.12"
	if [ "$1" = "linux" ]
	then
  		sudo apt-get install npm
  	fi
	sudo npm install -g truffle@5.1.12

	echo "Installing ganache-cli"
	npm install -g ganache-cli

else
	echo "Syntax: ./EnvironmentSetup.sh macos/linux."
  	echo "OS supported: Mac OS | Linux"
	fi

if [ "$1" = "linux" ] && [ "$2" = "-b" ]
then

	echo "Installing HomeBrew"

	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
	test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
	test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
	echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
fi

if [ "$1" = "macos" ] && [ "$2" = "-b" ]
then
	echo "Installing HomeBrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi
