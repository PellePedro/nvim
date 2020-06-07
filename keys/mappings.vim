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
" copy to system clipboard
noremap gy "+y
" copy whole file to system clipboard
nnoremap gY gg"+yG
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
"
" <leader> i.e. \ mappigs
nnoremap <leader>f  :NERDTreeFind<CR>
nnoremap <leader>n  :NERDTreeToggle<CR>
noremap  <leader><leader> :only<CR>
inoremap <silent><expr> <leader>r coc#refresh()
nnoremap <leader>rn <Plug>(coc-rename)
nnoremap <silent> <leader>j <Plug>(coc-diagnostic-prev)
nnoremap <silent> <leader>k <Plug>(coc-diagnostic-next)
nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <leader>rr <Plug>(coc-refactor)
nnoremap <silent> <leader>z  :EditVifm<CR>
"
" }}}
"
" ======================= Space ' ' Mappings ============================== {{{

nnoremap <space>a <c-^>
nnoremap <space>b :Buffers<CR>
nnoremap <space>c :GV<CR>
nnoremap <space>d :r! links -dump <space>
nnoremap <space>f :execute "Rg "."<C-r><C-w>"<CR>
nnoremap <space>fr :<C-u>Rg<CR>
nnoremap <space>fd :execute "Rg "."<C-r>"0<CR>
nnoremap <space>h :History<CR>
nnoremap <space>l :set list!<CR>

" quickly toggle term
nnoremap <silent> <space>T :vertical botright Ttoggle<cr><C-w>l
nnoremap <silent> <space>t :botright Ttoggle<cr><C-w>j
nnoremap <space>s :Gstatus<CR>
nnoremap <space>gf :diffget //2<CR>
nnoremap <space>gj :diffget //3<CR>
nnoremap <space>q  :q<CR>
nnoremap <space>w  :w<CR>
nnoremap <space>v  :%s/\s\+$//e<CR>
nnoremap <space>gm <Plug>(git-messenger)
nnoremap <Leader>gb :<C-u>call gitblame#echo()<CR>
"nnoremap <silent> <expr> <space><space> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
" }}}
"
"
"
"" change dir to current file's dir
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
" zoom a vim pane, <C-w> = to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
