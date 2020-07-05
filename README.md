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


|    Key       | Description                |                                                                  |
|--------------|----------------------------|------------------------------------------------------------------|
| <space> a    | Alternative/last File      | nnoremap <space>a  <c-^>                                         |
| <space> b    | Show buffers in fzf        | nnoremap <space>b  :Buffers<CR>                                  |
| <space> c    | Show git commits           | nnoremap <space>c  :GV<CR>                                       |
| <space> d    | Fetch content via http     | nnoremap <space>d  :r! links -dump <space>                       |
| <space> r    | Search with rip grep       | nnoremap <space>r  :<C-u>Rg<CR>                                  |
| <space> rw   | Search cword with ripgrep  | nnoremap <space>rw :execute "Rg "."<C-r><C-w>"<CR>               |
| <space> gf   | Merge pick from target     | nnoremap <space>gf :diffget //2<CR>                              |
| <space> gj   | Merge pick from remote     | nnoremap <space>gj :diffget //3<CR>                              |
| <space> h    | Show History in fzf        | nnoremap <space>h  :History<CR>                                  |
| <space> l    | Toggle none printable char | nnoremap <space>l  :set list!<CR>                                |
| <space> s    | Git show status            | nnoremap <space>s  :Gstatus<CR>                                  |
| <space> T    | Toggle terminal vertical   | nnoremap <silent>  <space>T :vertical botright Ttoggle<cr><C-w>l |
| <space> t    | Toggle terminal horizontal | nnoremap <silent>  <space>t :botright Ttoggle<cr><C-w>j          |
| <space> u    | Show undo tree             | nnoremap <space>u  :UndotreeToggle<CR>                           |
| <space> w    | Remove trailing w-spaces   | nnoremap <space>w  :%s/\s\+$//e<CR>                              |
