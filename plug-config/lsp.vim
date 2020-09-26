set completeopt=menuone,noinsert,noselect
set shortmess+=c

nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap K :lua vim.lsp.buf.signature_help()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap \r :lua vim.lsp.buf.rename()<CR>
"nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
"nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap gR :lua require('telescope.builtin').lsp_references({})<CR>

nnoremap \r :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string()<CR>
nnoremap \p :lua require('telescope.builtin').git_files()<CR>
nnoremap \pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>

inoremap <C-c> <esc>

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua require'nvim_lsp'.gopls.setup{ on_attach=require'completion'.on_attach }
"lua require'nvim_lsp'.jdtls.setup{ on_attach=require'completion'.on_attach }

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END
