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



" =======================  '\' Mappings        ============================== {{{
"|    Key       | Description                   |                                                             |
"|--------------|-------------------------------|-------------------------------------------------------------|
"|   \\         | Maximize this view            | nmap \\ :only<cr>                                          |
"|   \cd        | cd to this file's directory   | nmap \cd :cd %:p:h<cr>:pwd<cr>                              |
"|   \w         | Search <cword> recursive      | nmap \w :execute "Rg "."<C-r><C-w>"<cr>                     |
"|   \d         | COC dignostic                 | nmap \d :CocList diagnostics<cr>                            |
"|   \rr        | COC rename                    | nmap \rr <Plug>(coc-rename)                                 |
"|   \prr       | COC rename <cword> recursive  | nmap \prr :CocSearch <c-r>=expand("<cword>")<cr><cr>        |
"|   \r         | Refresh COC                   | imap <expr> \r coc#refresh()                               |
"
"| <space> a    | Alternative/last File      | nmap <space>a  <c-^>                                         |
"| <space> b    | Show buffers in fzf        | nmap <space>b  :Buffers<CR>                                  |
"| <space> c    | Show git commits           | nmap <space>c  :GV<CR>                                       |
"| <space> d    | Fetch content via http     | nmap <space>d  :r! links -dump <space>                       |
"| <space> r    | Search with rip grep       | nmap <space>r  :<C-u>Rg<CR>                                  |
"| <space> rw   | Search cword with ripgrep  | nmap <space>rw :execute "Rg "."<C-r><C-w>"<CR>               |
"| <space> gf   | Merge pick from target     | nmap <space>gf :diffget //2<CR>                              |
"| <space> gj   | Merge pick from remote     | nmap <space>gj :diffget //3<CR>                              |
"| <space> h    | Show History in fzf        | nmap <space>h  :History<CR>                                  |
"| <space> l    | Toggle none printable char | nmap <space>l  :set list!<CR>                                |
"| <space> s    | Git show status            | nmap <space>s  :Gstatus<CR>                                  |
"| <space> T    | Toggle terminal vertical   | nmap <silent>  <space>T :vertical botright Ttoggle<cr><C-w>l |
"| <space> t    | Toggle terminal horizontal | nmap <silent>  <space>t :botright Ttoggle<cr><C-w>j          |
"| <space> u    | Show undo tree             | nmap <space>u  :UndotreeToggle<CR>                           |
"| <space> vf   | Vista finder               | nmap <Space>vf  :Vista finder<CR>                            |
"| <space> vq   | Vista close                | nmap <Space>vq  :Vista focus<CR>:close<CR>                   |
"| <space> vs   | Vista show                 | nmap <Space>vs  :Vista show<CR>                              |
"| <space> vv   | Vista focus                | nmap <Space>vv  :Vista focus<CR>                             |
"| <space> w    | Remove trailing w-spaces   | nmap <space>w  :%s/\s\+$//e<CR>                              |
"| <space> y    | OCS52 copy visual select   | nmap <space>y  "+y                                           |
"| <space> Y    | OCS52 copy whole file      | nmap <space>Y  gg"+yG                                        |

nmap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next-error)
nmap <silent> gn <Plug>(coc-diagnostic-next)
nmap <silent> gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> dg <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gc <Plug>(coc-fix-current)
nmap gs  :Gstatus<CR>
