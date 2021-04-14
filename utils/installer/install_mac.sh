#!/usr/bin/env bash
set -e

NVIM_HOME=~/.config/nvim

echo "**************************************************************************"
echo "********************Home directories setup...*****************************"
echo "**************************************************************************"
#mkdir -p $HOME/src/github.com
#mkdir -p $HOME/bin
#mkdir -p $HOME/pkg

echo "**************************************************************************"
echo "******************Command line tooling install...***********************************"
echo "**************************************************************************"
command -v gcc >/dev/null 2>&1 && xcode-select --install || true
command -v gcc >/dev/null 2>&1 || { echo >&2 "I require gcc, but it's not installed. Aborting."; exit 1; }

echo "**************************************************************************"
echo "******************Homebrew Install...*************************************"
echo "**************************************************************************"
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh)"
command -v brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "**************************************************************************"
echo "******************Application and tool installation...********************"
echo "**************************************************************************"
#brew tap Homebrew/bundle
#brew bundle --file=$NVIM_HOME/utils/config/Brewfile
brew install ctags
brew install fzf
brew install go
brew install jq
brew install nodejs
brew install npm
brew install ripgrep
brew install tmux
brew install vifm
brew install wget
brew install zsh
brew install --cask neovim-nightly
brew install --cask  font-fira-code

echo "**************************************************************************"
echo "******************Git Install...******************************************"
echo "**************************************************************************"
command -v git >/dev/null 2>&1 || brew install git

echo "**************************************************************************"
echo "******************Nvim Install...*************************************"
echo "**************************************************************************"
[[ -d ${NVIM_HOME} ]] && rm -rf ${NVIM_HOME}
git clone --single-branch --branch nvcode git@github.com:pellepedro/nvim.git $NVIM_HOME


# Bootstrap zsh
mkdir -p $HOME/.zsh
cp $NVIM_HOME/utils/config/zsh/zshrc $HOME/.zshrc
cp $NVIM_HOME/utils/config/zsh/p10k.zsh $HOME/.p10k.zsh
curl -fLo $HOME/.zsh/antigen.zsh --create-dirs https://git.io/antigen

# Bootstrap vifm
mkdir -p ${HOME}/.vifm/colors
cp $NVIM_HOME/utils/config/vifm/vifmrc $HOME/.vifm/vifmrc
cp $NVIM_HOME/utils/config/vifm/colors/nord.vifm $HOME/.vifm/colors/nord.vifm


echo "**************************************************************************"
echo "*********************Gems install...**************************************"
echo "**************************************************************************"
#sudo gem install neovim

echo "**************************************************************************"
echo "*********************Pip3 Npm install...***************************************"
echo "**************************************************************************"
pip3 install pynvim --user
