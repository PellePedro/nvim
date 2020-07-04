" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/site/plugged')
" Plugins  {{{
"
Plug 'jiangmiao/auto-pairs'
"
" Theme ==================================
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/gruvbox-material'
" Atom One Dark theme.
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'


"Git
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-fugitive'
Plug 'zivyangll/git-blame.vim'
Plug 'mhinz/vim-signify'
Plug 'ctrlpvim/ctrlp.vim'

"Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Go
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Python
Plug 'davidhalter/jedi-vim', {'for': ['python']}

" Docker
Plug 'ekalinin/Dockerfile.vim'

" Terraform

Plug 'hashivim/vim-terraform'

" markdown
Plug 'tpope/vim-markdown', {'for': ['markdown', 'md']}
Plug 'rhysd/vim-grammarous', { 'for': ['text', 'markdown']}
Plug 'ron89/thesaurus_query.vim', { 'for': ['text', 'markdown']}
Plug 'chrisbra/unicode.vim', { 'for': ['text', 'markdown']}

" Essentials
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/vim-peekaboo'
Plug 'justinmk/vim-sneak'
Plug 'mbbill/undotree'
Plug 'ntpeters/vim-better-whitespace'

Plug 'airblade/vim-rooter'
Plug 'stefandtw/quickfix-reflector.vim'

Plug 'christoomey/vim-tmux-navigator'


Plug 'vifm/vifm.vim'
" Copying
" Plug 'ShikChen/osc52.vim'

Plug 'kassio/neoterm'
"
Plug 'liuchengxu/vista.vim'
call plug#end()
"}}}
"
"
"
let g:better_whitespace_enabled=1
"let g:strip_whitespace_on_save=1


