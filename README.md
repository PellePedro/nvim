# Nvim Configuration
This Configuration is based on Christian Chiarulli's [nvcode](https://github.com/ChristianChiarulli/nvcode) 


## Install the nightly version of Neovim

### Ubuntu
```bash
!#/bin/bash

sudo apt install -y  cmake clang gettext  gperf luajit luarocks libuv1-dev libluajit-5.1-dev libunibilium-dev libmsgpack-dev libtermkey-dev libvterm-dev libutf8proc-dev
sudo luarocks build mpack
sudo luarocks build lpeg
sudo luarocks build inspect

cd ~
sudo rm -r neovim
git clone https://github.com/neovim/neovim
cd neovim
sudo make CMAKE_BUILD_TYPE=Release install
cd ~
sudo rm -r neovim

```

## OSX

### Install Iterm2
[Iterm2](https://iterm2.com)


### Download and Install Fira Code Fonts
```
cat <<- EOF | sh
	curl -L https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Light/complete/Fira%20Code%20Light%20Nerd%20Font%20Complete.ttf?raw=true -o FiraCode-Light.ttf
	curl -L https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Medium/complete/Fira%20Code%20Medium%20Nerd%20Font%20Complete.ttf?raw=true -o FiraCode-Medium.ttf
	curl -L https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf?raw=true -o FiraCode-Regular.ttf
	curl -L https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Retina/complete/Fira%20Code%20Retina%20Nerd%20Font%20Complete.ttf?raw=true -o FiraCode-Retina.ttf
EOF

```


### Install Homebrew Formulas and NVIM on MAC
```
bash <( curl -s  https://raw.githubusercontent.com/PellePedro/nvim/nvcode/utils/installer/install_mac.sh)

```

### Clone Repository

```
git clone --depth=0 --single-branch --branch nvcode https://github.com/pellepedro/nvim.git ~/.config/nvim

```

Launch nvim and run commands: 
- `:PackerInstall`
- ':PackerCompile'
- ':LspInstall go'
- ':LspInstall python'
