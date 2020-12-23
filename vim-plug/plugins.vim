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
Plug 'gruvbox-community/gruvbox'
" Atom One Dark theme.
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'tjdevries/colorbuddy.vim'
Plug 'tjdevries/gruvbuddy.nvim'

"Git
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-fugitive'
Plug 'zivyangll/git-blame.vim'
Plug 'mhinz/vim-signify'

" Test
Plug 'vim-test/vim-test'

" java
Plug 'tpope/vim-classpath'
Plug 'uiiaoo/java-syntax.vim'
Plug 'puremourning/vimspector'
"
"Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Go
Plug 'fatih/vim-go'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'nvim-lua/lsp-status.nvim'

" Extentions to built-in LSP, for example, providing type inlay hints
Plug 'tjdevries/lsp_extensions.nvim'


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
Plug 'justinmk/vim-dirvish'
Plug 'vifm/vifm.vim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'junegunn/fzf', { 'do': { -> fxf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
"
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
" Automatically install missing plugins on startup
autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif
"
let g:better_whitespace_enabled=1
"let g:strip_whitespace_on_save=1


