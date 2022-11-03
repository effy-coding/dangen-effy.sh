#!/usr/bin/env bash

#####################
# macOS
#####################

if test ! $(which xcodebuild); then
  sudo xcodebuild -license accept
fi

if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

sudo spctl --master-disable

brew update && brew upgrade

# Install git
brew install git

sudo spctl --master-enable

# Off mouse acceleration
defaults write .GlobalPreferences com.apple.mouse.scaling -1

# Off Press and Hold
defaults write -g ApplePressAndHoldEnabled -bool false

# Set keyboard repeat rate
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

echo "You may know some changes are apply after reboot..."

#####################
# Terminal
#####################

# Install zsh settings
brew install zsh-completions
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..

/bin/bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Install neovim
brew install neovim

# Set vim editor
cat << EOF >> ~/.zshrc
alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"
export EDITOR=/usr/local/bin/nvim
EOF

# Install vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#####################
# PL
#####################

brew cask install visual-studio-code

# Install elixir and go
brew install elixir
brew install golang

# Install nvm & node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
source ~/.zshrc

nvm install --lts && nvm use --lts
# Install Docker
brew cask install docker

# Install k8s
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
brew install minikube
brew install k9s

echo "alias k=kubectl" >> ~/.zshrc
echo "source <(kubectl completion zsh)" >> ~/.zshrc

# Install terraform
brew install terraform
echo "alias tf=terraform" >> ~/.zshrc

# Install Hugo
brew install hugo

brew install bat
