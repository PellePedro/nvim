# Nvim Configuration
This Configuration is based on Christian Chiarulli's [nvcode](https://github.com/ChristianChiarulli/nvcode) 

## Install

## Complile the latest version of Neovim

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

### Clone Repository

```
git clone --depth=0 --single-branch --branch nvcode https://github.com/pellepedro/nvim.git ~/.config/nvim

```
- Launch nvim and run `:PackerInstall`


## LSP

To install a supported language server:

```
  :LspInstall go
  :LspInstall python
  :LspInstall rust
```

