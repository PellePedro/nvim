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

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gh :call <SID>show_documentation()<CR>
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
vnoremap <silent> <C-s>  <C-C>:update<CR>
inoremap <silent> <C-s>  <C-O>:update<CR>

" Map ctrl-q to save the buffer  and quit
noremap  <silent> <C-q>  :update<CR>:q<CR>
vnoremap <silent> <C-q>  <C-C>:update<CR>:q<CR>
inoremap <silent> <C-q>  <ESC>

inoremap <silent> <C-[>  <esc>
"
"
" }}}
"
" <leader> i.e. \ mappigs {{{
"|    Key       | Description                |                                                                  |
"|--------------|----------------------------|------------------------------------------------------------------|
"|   \cd        | cd to this file's directory   | nnoremap \cd :cd %:p:h<CR>:pwd<CR>                               |
"|   \f         | Show current file in explorer | nnnnoremap \f  :NERDTreeFind<CR>                                 |
"|   \n         | Toggle Nerd Tree              | nnnnoremap \n  :NERDTreeToggle<CR>                               |
"|   \\         | Maximize this view            | nnnnoremap \\ :only<CR>                                          |
"|   K          | Show documentation            | nnnnoremap <silent> K :call <SID>show_documentation()<CR>        |
"|   \d         | COC dignostic                 | nnnnoremap \d :CocList diagnostics<CR>                           |
"|   \r         | Refresh COC                   | nninoremap <expr> \r coc#refresh()                               |
"|   [g         | Goto next diagnostic          | nnnnoremap [g <Plug>(coc-diagnostic-prev)                        |
"|   ]g         | Goto previous diagnostic      | nnnnoremap ]g <Plug>(coc-diagnostic-next)                        |
"|   gd         | Goto definition               | nnnnoremap gd <Plug>(coc-definition)                             |
"|   gi         | Goto inplementation           | nnnnoremap gi <Plug>(coc-implementation)                         |
"|   gr         | Goto reference                | nnnnoremap gr <Plug>(coc-references)                             |
"|   gy         | Goto type definition          | nnnnoremap gy <Plug>(coc-type-definition)                        |
"|   \rf        | COC refactor                  | nnnnoremap \rf <Plug>(coc-refactor)                              |
"|   \cr        | Coc Rename                    | nnnnoremap \cr <Plug>(coc-rename)                                |
"|   \cf        | Coc fix current               | nnnnoremap \cf <Plug>(coc-fix-current)                           |


nnoremap \f  :NERDTreeFind<CR>
nnoremap \n  :NERDTreeToggle<CR>
nnoremap \\ :only<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap \d :CocList diagnostics<CR>
inoremap <expr> \r coc#refresh()
nnoremap [g <Plug>(coc-diagnostic-prev)
nnoremap ]g <Plug>(coc-diagnostic-next)
nnoremap gd <Plug>(coc-definition)
nnoremap gi <Plug>(coc-implementation)
nnoremap gr <Plug>(coc-references)
nnoremap \rf <Plug>(coc-refactor)
nnoremap gy <Plug>(coc-type-definition)
nnoremap \cr <Plug>(coc-rename)
nnoremap \cf <Plug>(coc-fix-current)
"" change dir to current file's dir

"
" }}}

" ======================= Space ' ' Mappings ============================== {{{
" |    Key       | Description                |                                                                  |
" |--------------|----------------------------|------------------------------------------------------------------|
" | <space> a    | Alternative/last File      | nnoremap <space>a  <c-^>                                         |
" | <space> b    | Show buffers in fzf        | nnoremap <space>b  :Buffers<CR>                                  |
" | <space> c    | Show git commits           | nnoremap <space>c  :GV<CR>                                       |
" | <space> d    | Fetch content via http     | nnoremap <space>d  :r! links -dump <space>                       |
" | <space> r    | Search with rip grep       | nnoremap <space>r  :<C-u>Rg<CR>                                  |
" | <space> rw   | Search cword with ripgrep  | nnoremap <space>rw :execute "Rg "."<C-r><C-w>"<CR>               |
" | <space> gf   | Merge pick from target     | nnoremap <space>gf :diffget //2<CR>                              |
" | <space> gj   | Merge pick from remote     | nnoremap <space>gj :diffget //3<CR>                              |
" | <space> h    | Show History in fzf        | nnoremap <space>h  :History<CR>                                  |
" | <space> l    | Toggle none printable char | nnoremap <space>l  :set list!<CR>                                |
" | <space> s    | Git show status            | nnoremap <space>s  :Gstatus<CR>                                  |
" | <space> T    | Toggle terminal vertical   | nnoremap <silent>  <space>T :vertical botright Ttoggle<cr><C-w>l |
" | <space> t    | Toggle terminal horizontal | nnoremap <silent>  <space>t :botright Ttoggle<cr><C-w>j          |
" | <space> u    | Show undo tree             | nnoremap <space>u  :UndotreeToggle<CR>                           |
" | <space> vf   | Vista finder               | nnoremap <Space>vf  :Vista finder<CR>                            |
" | <space> vq   | Vista close                | nnoremap <Space>vq  :Vista focus<CR>:close<CR>                   |
" | <space> vs   | Vista show                 | nnoremap <Space>vs  :Vista show<CR>                              |
" | <space> vv   | Vista focus                | nnoremap <Space>vv  :Vista focus<CR>                             |
" | <space> w    | Remove trailing w-spaces   | nnoremap <space>w  :%s/\s\+$//e<CR>                              |
" | <space> y    | OCS52 copy visual select   | nnoremap <space>y  "+y                                           |
" | <space> Y    | OCS52 copy whole file      | nnoremap <space>Y  gg"+yG                                        |

nnoremap <space>a  <c-^>
nnoremap <space>b  :Buffers<CR>
nnoremap <space>c  :GV<CR>
nnoremap <space>d  :r! links -dump <space>
nnoremap <space>r  :<C-u>Rg<CR>
nnoremap <space>rw :execute "Rg "."<C-r><C-w>"<CR>
nnoremap <space>gf :diffget //2<CR>
nnoremap <space>gj :diffget //3<CR>
nnoremap <space>h  :History<CR>
nnoremap <space>l  :set list!<CR>
nnoremap <space>s  :Gstatus<CR>
nnoremap <silent>  <space>T :vertical botright Ttoggle<cr><C-w>l
nnoremap <silent>  <space>t :botright Ttoggle<cr><C-w>j
nnoremap <space>u  :UndotreeToggle<CR>
nnoremap <Space>vf :Vista finder<CR>
nnoremap <Space>vq :Vista focus<CR>:close<CR>
nnoremap <Space>vs :Vista show<CR>
nnoremap <Space>vv :Vista focus<CR>
nnoremap <space>w  :%s/\s\+$//e<CR>
nnoremap <space>y  "+y
nnoremap <space>Y  gg"+yG
" }}}
"
"
"
" zoom a vim pane, <C-w> = to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
