" vim:fdm=marker
let mapleader = "\\"

nmap <leader>v :e $MYVIMRC<CR>
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" ======================= General Mappings ============================== {{{
vnoremap <silent> jj <ESC>
inoremap <silent> jj <ESC>

nnoremap j gj
nnoremap k gk
nnoremap $ g$
nnoremap 0 g0

" Center Scrolling
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz
noremap <C-f> <C-f>zz
noremap <C-b> <C-b>zz

" Move Visual Selected Lines up and down
nnoremap <A-j> :m .+1<R>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <CR> :nohl<CR>

" prevent entering ex mode accidentally
nnoremap Q <Nop>
"
" Tab/shift-tab to indent/outdent in visual mode.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
"
" Keep selection when indenting/outdenting.
vnoremap > >gv
vnoremap < <gv

"
nnoremap Y y$
"
" Terminal Mapping
tnoremap <Esc> <C-\><C-n>
tnoremap <c-h> <C-\><C-n><C-w>h
tnoremap <c-j> <C-\><C-n><C-w>j
tnoremap <c-k> <C-\><C-n><C-w>k
tnoremap <c-l> <C-\><C-n><C-w>l

"
noremap ]t :tabnext<CR>
noremap ]T :tablast<CR>
noremap [t :tabprev<CR>
noremap [T :tabfirst<CR>
noremap tq :tabclose<CR>

" Toggle vertical/horizontal spli
"set splitbelow
"set splitright
"noremap <leader>th <C-w>K
"noremap <leader>tv <C-w>H

vmap \h :s/\d\+/\=printf("0x%04x", submatch(0))<CR>

" }}}
"
" ======================= Control '^' Mappings ============================== {{{

noremap  <silent> <C-s>  :update<CR>
vnoremap <silent> <C-s>  <C-C>:update<CR><ESC>
inoremap <silent> <C-s>  <C-O>:update<CR><ESC>

" Map ctrl-q to save the buffer  and quit
noremap  <silent> <C-q>  :update<CR>:q<CR>
vnoremap <silent> <C-q>  <C-C>:update<CR>:q<CR>
inoremap <silent> <C-q>  <ESC>

inoremap <silent> <C-[>  <ESC>
"
"
" }}}
"
"

" =======================  'g' Mappings        ============================== {{{
" Use K to show documentation in preview window
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next-error)
nmap <silent> ]c  <Plug>(coc-fix-current)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gc :GCheckout<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gh :call <SID>show_documentation()<CR>
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gn <Plug>(coc-diagnostic-next)
nmap <silent> gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)

" }}}

" =======================  '\' Mappings        ============================== {{{
"|    Key       | Description                   |                                                             |
"|--------------|-------------------------------|-------------------------------------------------------------|
"|   \\         | Maximize this view            | nmap \\ :only<cr>                                          |
"|   \cd        | cd to this file's directory   | nmap \cd :cd %:p:h<cr>:pwd<cr>                             |
"|   \w         | Search <cword> recursive      | nmap \w :execute "Rg "."<C-r><C-w>"<cr>                    |
"|   \d         | LSP dignostic                 | nmap \d :CocList diagnostics<cr>                           |
"|   \br        | LSP rename                    | nmap \br <Plug>(coc-rename)                                |
"|   \r         | LSP rename <cword> recursive  | nmap \r :CocSearch <c-r>=expand("<cword>")<cr><cr>         |
"|   \r         | Refresh COC                   | imap <expr> \r coc#refresh()                               |
"|   \d         | Show LSP diagnistics          | nmap \d  :CocList diagnostics<cr>                          |
"|   \f         | Show LSP outline in finder    | nmap \f :Vista finder coc<CR>                              |
"|   \t         | Show LSP outline              | nmap \t :Vista coc<CR>                                     |
"|   \q         | Close LSP outline             | nmap \q  :Vista!<CR>

nmap \\ :only<cr>
nmap \cd :cd %:p:h<cr>:pwd<cr>
nmap \w :execute "Rg "."<C-r><C-w>"<cr>

augroup lsp
  au!
  au FileType go,rst,sh,java nmap \d  :CocList diagnostics<cr>
  au FileType go,rst,sh,java nmap \br <Plug>(coc-rename)
  au FileType go,rst,sh,java nmap \r  :CocSearch <c-r>=expand("<cword>")<cr><cr>
  au FileType go,rst,sh,java imap <expr> \r  coc#refresh()
  au FileType go,rst,sh,java nmap \f  :Vista finder coc<CR>
  au FileType go,rst,sh,java nmap \t  :Vista coc<CR>
  au FileType go,rst,sh,java nmap \q  :Vista!<CR>
augroup END


" }}}

" ======================= Space ' ' Mappings ============================== {{{
" |    Key       | Description                |                                                              |
" |--------------|----------------------------|--------------------------------------------------------------|
" | <space> a    | Alternative/last File      | nmap <space>a  <c-^>                                         |
" | <space> b    | Show buffers in fzf        | nmap <space>b  :Buffers<CR>                                  |
" | <space> c    | Show git commits           | nmap <space>c  :GV<CR>                                       |
" | <space> d    | Fetch content via http     | nmap <space>d  :r! links -dump <space>                       |
" | <space> r    | Search with rip grep       | nmap <space>r  :<C-u>Rg<CR>                                  |
" | <space> rw   | Search cword with ripgrep  | nmap <space>rw :execute "Rg "."<C-r><C-w>"<CR>               |
" | <space> gf   | Merge pick from target     | nmap <space>gf :diffget //2<CR>                              |
" | <space> gj   | Merge pick from remote     | nmap <space>gj :diffget //3<CR>                              |
" | <space> h    | Show History in fzf        | nmap <space>h  :History<CR>                                  |
" | <space> l    | Toggle none printable char | nmap <space>l  :set list!<CR>                                |
" | <space> s    | Git show status            | nmap <space>s  :Gstatus<CR>                                  |
" | <space> T    | Toggle terminal vertical   | nmap <silent>  <space>T :vertical botright Ttoggle<cr><C-w>l |
" | <space> t    | Toggle terminal horizontal | nmap <silent>  <space>t :botright Ttoggle<cr><C-w>j          |
" | <space> u    | Show undo tree             | nmap <space>u  :UndotreeToggle<CR>                           |
" | <space> vf   | Vista finder               | nmap <Space>vf  :Vista finder<CR>                            |
" | <space> vq   | Vista close                | nmap <Space>vq  :Vista focus<CR>:close<CR>                   |
" | <space> vs   | Vista show                 | nmap <Space>vs  :Vista show<CR>                              |
" | <space> vv   | Vista focus                | nmap <Space>vv  :Vista focus<CR>                             |
" | <space> w    | Remove trailing w-spaces   | nmap <space>w  :%s/\s\+$//e<CR>                              |
" | <space> y    | OCS52 copy visual select   | nmap <space>y  "+y                                           |
" | <space> Y    | OCS52 copy whole file      | nmap <space>Y  gg"+yG                                        |

nmap <space>a  <c-^>
nmap <space>b  :Buffers<CR>
nmap <space>c  :GV<CR>
nmap <space>d  :r! links -dump <space>

nmap <space>gf :diffget //2<CR>
nmap <space>gj :diffget //3<CR>
nmap <space>h  :History<CR>
nmap <space>l  :set list!<CR>
nmap <silent>  <space>T :vertical botright Ttoggle<cr><C-w>l
nmap <silent>  <space>t :botright Ttoggle<cr><C-w>j
nmap <space>s  :Gstatus<CR>
nmap <space>u  :UndotreeToggle<CR>
nmap <space>w  :%s/\s\+$//e<CR>
nmap <space>y  "+y
nmap <space>Y  gg"+yG
noremap p ""p
nmap <space>/ :Rg<space>
" }}}

"
"
" zoom a vim pane, <C-w> = to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
