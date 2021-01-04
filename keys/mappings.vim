" vim:fdm=marker
let mapleader = "\\"

nmap \v :e $MYVIMRC<CR>
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" ======================= General Mappings ============================== {{{
vnoremap <silent> jj <ESC>
inoremap <silent> jj <ESC>

" stay on current word
nnoremap * *``

nnoremap j gj
nnoremap k gk
nnoremap $ g$
nnoremap 0 g0

" Center Scrolling
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz
noremap <C-f> <C-f>zz
noremap <C-b> <C-b>zz

noremap zz zzzr
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
tnoremap <space>a <C-\><C-n><c-^>


" ===
" === Tab management
" ===
" Create a new tab, next, previous, close
noremap tu :tabe<CR>
noremap tn :tabn<CR>
noremap tp :tabp<CR>
noremap tq :tabc<CR>

" Toggle vertical/horizontal split
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

noremap  <silent> <C-q>  :q<CR>
tnoremap <silent> <C-q>  :q<CR>

inoremap <silent> <C-[>  <ESC>
nnoremap <C-t> :Ttoggle<CR>i
noremap  <silent> <C-w>  :Vifm<CR>
"
" }}}
"
"

" =======================  'g' Mappings        ============================== {{{{{{
" Use K to show documentation in preview window
nmap <silent> gb :GBranches<CR>
nmap <silent> gc :GV<CR>
nmap <silent> gs :Gstatus<CR>
" }}}}}}

" =======================  '\' Mappings        ============================== {{{{{{

nmap \\ :only<cr>
nmap \b  :Buffers<CR>
nmap \cd :cd %:p:h<cr>:pwd<cr>
nmap \w :execute "Rg "."<C-r><C-w>"<cr>
nmap \q :cclose<CR>
nnoremap \t :Ttoggle<CR>i
" Count number of matches of word under cursor
nmap \n *<C-O>:%s///gn<CR>``


" }}}}}}

" ======================= Space ' ' Mappings ============================== {{{

nmap <space>a  <c-^>
nmap <space>b  :Buffers<CR>
nmap <space>d  :r! links -dump <space>

nmap <space>gf :diffget //2<CR>
nmap <space>gj :diffget //3<CR>
nmap <space>h  :History<CR>
nmap <space>l  :set list!<CR>
nmap <silent>  <space>t :Ttoggle<CR>
nmap <silent>  <space>T :botright Ttoggle<cr><C-w>j
nmap <space>s  :Gstatus<CR>
nmap <space>u  :UndotreeToggle<CR>
nmap <space>w  :%s/\s\+$//e<CR>
nmap <space>y  "+y
nmap <space>Y  gg"+yG
noremap p ""p
nmap <space>/ :Rg<space>
" }}}

" ======================= 't' Mappings    ================================= {{{
"
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
" }}}
"
" zoom a vim pane, <C-w> = to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Open up lazygit
noremap \g :tabe<CR>:-tabmove<CR>:term lazygit<CR>
