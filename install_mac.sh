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
echo "******************Application and tool installation...********************"
echo "**************************************************************************"
brew tap Homebrew/bundle
brew bundle --file=$NVIM_HOME/utils/config/Brewfile

echo "**************************************************************************"
echo "*********************Change shell to zsh...*******************************"
echo "**************************************************************************"
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s "$(command -v zsh)" "${USER}"


echo "**************************************************************************"
echo "*********************PIP3 install...***************************************"
echo "**************************************************************************"
pip3 install pynvim --user


echo "Almost Done! Just do that: https://blog.birkhoff.me/make-sudo-authenticate-with-touch-id-in-a-tmux/"
