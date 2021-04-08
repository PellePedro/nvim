


# Nvim Configuration

## Install

## Get the latest version of Neovim

```bash
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
- After installation run `nvim` and then `:PackerInstall`

## LSP

To install a supported language server:

``` bash
  :LspInstall go
```

