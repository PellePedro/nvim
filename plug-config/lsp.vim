" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing extra messages when using completion
set shortmess+=


nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap K :lua vim.lsp.buf.signature_help()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap \r :lua vim.lsp.buf.rename()<CR>
nnoremap K :lua vim.lsp.buf.hover()<CR>
nnoremap \a :lua vim.lsp.buf.code_action()<CR>
nnoremap gR :lua require('telescope.builtin').lsp_references({})<CR>
nnoremap \p :lua require('telescope.builtin').git_files()<CR>
"nnoremap \pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>

inoremap <C-c> <esc>

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Configure lsp
" https://github.com/neovim/nvim-lspconfig#rust_analyzer
lua <<EOF

local vim = vim

vim.cmd [[autocmd BufEnter * lua require'completion'.on_attach()]]
vim.cmd [[autocmd BufEnter * lua require'diagnostic'.on_attach()]]

-- icons
local w_sign = ""
local e_sign = ""
local h_sign = "ﯦ"

-- hilight
vim.fn.sign_define("LspDiagnosticsErrorSign", {text = e_sign, texthl = "LspDiagnosticsError"})
vim.fn.sign_define("LspDiagnosticsWarningSign", {text = w_sign, texthl = "LspDiagnosticsWarning"})
vim.fn.sign_define("LspDiagnosticsHintSign", {text = h_sign, texthl = "LspDiagnosticsHint"})

-- dignostic
vim.api.nvim_set_var("diagnostic_enable_virtual_text", 1)
vim.api.nvim_set_var("diagnostic_virtual_text_prefix", "")


local ok, lsputil = pcall(require, "lsputil.codeAction")
if ok then
  vim.lsp.callbacks["textDocument/codeAction"] = lsputil.code_action_handler
  --vim.lsp.callbacks["textDocument/references"] = lsputil.references_handler
  --vim.lsp.callbacks["textDocument/definition"] = lsputil.definition_handler
  --vim.lsp.callbacks["textDocument/declaration"] = lsputil.declaration_handler
  --vim.lsp.callbacks["textDocument/typeDefinition"] = lsputil.typeDefinition_handler
  --vim.lsp.callbacks["textDocument/implementation"] = lsputil.implementation_handler
  vim.lsp.callbacks["textDocument/documentSymbol"] = lsputil.document_handler
  vim.lsp.callbacks["workspace/symbol"] = lsputil.workspace_handler
end

-- nvim_lsp object
local nvim_lsp = require'nvim_lsp'

-- function to attach completion and diagnostics
-- when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
    require'diagnostic'.on_attach(client)
end

-- Enable rust_analyzer
-- nvim_lsp.gopls.setup({ on_attach=on_attach })
nvim_lsp.gopls.setup{}
nvim_lsp.pyls_ms.setup{}
nvim_lsp.jdtls.setup{}
nvim_lsp.bashls.setup{}



nvim_lsp.rust_analyzer.setup {
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy"
        }
      },
      capabilities = {
        offsetEncoding = {"utf-8", "utf-16"},
        textDocument = {
          codeAction = {
            codeActionLiteralSupport = {
              codeActionKind = {
                valueSet = {}
              }
            },
            dynamicRegistration = false
          },
          completion = {
            completionItem = {
              commitCharactersSupport = false,
              deprecatedSupport = false,
              documentationFormat = {"markdown", "plaintext"},
              preselectSupport = false,
              snippetSupport = false
            },
            completionItemKind = {
              valueSet = {
                1,
                2,
                3,
                4,
                5,
                6,
                7,
                8,
                9,
                10,
                11,
                12,
                13,
                14,
                15,
                16,
                17,
                18,
                19,
                20,
                21,
                22,
                23,
                24,
                25
              }
            },
            contextSupport = false,
            dynamicRegistration = false
          },
          declaration = {
            linkSupport = true
          },
          definition = {
            linkSupport = true
          },
          documentHighlight = {
            dynamicRegistration = false
          },
          documentSymbol = {
            dynamicRegistration = false,
            hierarchicalDocumentSymbolSupport = true,
            symbolKind = {
              valueSet = {
                1,
                2,
                3,
                4,
                5,
                6,
                7,
                8,
                9,
                10,
                11,
                12,
                13,
                14,
                15,
                16,
                17,
                18,
                19,
                20,
                21,
                22,
                23,
                24,
                25,
                26
              }
            }
          },
          hover = {
            contentFormat = {"markdown", "plaintext"},
            dynamicRegistration = false
          },
          implementation = {
            linkSupport = true
          },
          references = {
            dynamicRegistration = false
          },
          signatureHelp = {
            dynamicRegistration = false,
            signatureInformation = {
              documentationFormat = {"markdown", "plaintext"}
            }
          },
          synchronization = {
            didSave = true,
            dynamicRegistration = false,
            willSave = false,
            willSaveWaitUntil = false
          },
          typeDefinition = {
            linkSupport = true
          }
        },
        workspace = {
          applyEdit = true,
          symbol = {
            dynamicRegistration = false,
            hierarchicalWorkspaceSymbolSupport = true,
            symbolKind = {
              valueSet = {
                1,
                2,
                3,
                4,
                5,
                6,
                7,
                8,
                9,
                10,
                11,
                12,
                13,
                14,
                15,
                16,
                17,
                18,
                19,
                20,
                21,
                22,
                23,
                24,
                25,
                26
              }
            }
          }
        }
      }
    }
  }
EOF



" Trigger completion with <tab>
" found in :help completion
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction


"inoremap <silent><expr> <TAB>
"  \ pumvisible() ? "\<C-n>" :
"  \ <SID>check_back_space() ? "\<TAB>" :
"  \ completion#trigger_completion()

nmap <tab> <Plug>(completion_smart_tab)
nmap <s-tab> <Plug>(completion_smart_s_tab)

" Visualize diagnostics
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_trimmed_virtual_text = '40'
" Don't show diagnostics while in insert mode
let g:diagnostic_insert_delay = 1

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hover
autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>PrevDiagnosticCycle<cr>
nnoremap <silent> g] <cmd>NextDiagnosticCycle<cr>

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment" }
