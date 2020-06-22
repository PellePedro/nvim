g Nvim Configuration



## Install Neovim and Prerequsits

- Fedora

cat <<-EOF | sudo bash
	dnf update  -y
	dnf install -y direnv ripgrep fzf zsh git
	dnf install -y tree wget xz
	dnf install -y gcc make git
	dnf install -y vifm ShellCheck
	dnf install -y python3 python3-pip python3-devel
	dnf install -y ruby ruby-devel rubygems
	dnf install -y neovim nodejs
	EOF


cat <<-EOF | bash
	pip3 install --user --upgrade pynvim
	npm i -g neovim
	EOF
  ```


## Clone this repo into your config

```
git clone --depth=0 https://github.com/pellepedro/nvim.git ~/.config/nvim
```


# Key Bindings



## Language Server 

|   Key	 | Description  	|
|--------|------------------|
| \ + o  |  View Outline    |


## Vista Mappings 

|   Key	       | Description            	|                                                |
|--------------|----------------------------|------------------------------------------------|
| <space> vo   | Start Vista                | nnoremap <space>vo  :Vista coc<CR>             |                                                |
| <space> vf   | Vista finder               | nnoremap <Space>vf  :Vista finder<CR>          |
| <space> vq   | Vista close                | nnoremap <Space>vq  :Vista focus<CR>:close<CR> |
| <space> vs   | Vista show                 | nnoremap <Space>vs  :Vista show<CR>            |
| <space> vv   | Vista focus                | nooremap <Space>vv  :Vista focus<CR>           |    

