-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
--vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
--vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
   -- Enable completion triggered by <c-x><c-o>
   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
   -- Mappings.
   -- See `:help vim.lsp.*` for documentation on any of the below functions
   --
   local bufopts = { noremap=true, silent=true, buffer=bufnr }
   vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
   vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
   vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
   vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
   --vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
   vim.keymap.set('n', '<C-k>', vim.diagnostic.open_float, bufopts)
   vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
   vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
   vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
   end, bufopts)
   vim.keymap.set('n', '<npace>D', vim.lsp.buf.type_definition, bufopts)
   vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
   vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
   vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
   vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, bufopts)
   vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, bufopts)
end

local config = {
   virtual_text = false
}

vim.diagnostic.config(config);

local lsp_flags = {
   -- This is the default in Nvim 0.7+
   debounce_text_changes = 150,
}
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig')['clangd'].setup{
   on_attach = on_attach,
   flags = lsp_flags,
   capabilities = capabilities
}

require('lspconfig')["lua_ls"].setup {
   on_attach = on_attach,
   settings = {
      Lua = {
         runtime = {
            version = 'LuaJIT',
            path = {
               completion = {
                  callSnippet = "Both",
                  keywordSnippet = "Both",
                  showWord = "Enable",
               }
            }
         },
         diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim', 'append'},
         },
         workspace = {
            -- Make the server aware of Neovim runtime files
            --library = vim.api.nvim_get_runtime_file("", true),
            library = vim.list_extend(vim.api.nvim_get_runtime_file("lua", true), {
               "${3rd}/luv/library",
               "${3rd}/busted/library",
               "${3rd}/luassert/library",
            }),
            checkThirdParty = false,
         },
         -- Do not send telemetry data containing a randomized but unique identifier
         telemetry = {
            enable = false,
         },
      },
   },
   capabilities = capabilities;
}

require('lspconfig')['tsserver'].setup{
   on_attach = on_attach,
   flags = lsp_flags,
   capabilities = capabilities,
   cmd = {
      "typescript-language-server", "--stdio"
   },
   filetypes = {
      "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"
   },
   init_options = {
      hostInfo = "neovim"
   },

   completionDisableFilterText = true,
   single_file_support = true,
   detached = false

}

require('lspconfig')['html'].setup{
   on_attach = on_attach,
   flags = lsp_flags,
   capabilities = capabilities,
   init_options = {
      configurationSection = {
         "html", "css", "javascript"
      },
      embeddedLanguages = {
         css = true,
         javascript = true
      },
      provideFormatter = true
   },
   single_file_support = true,
}

require('lspconfig')['pyright'].setup{
   on_attach = on_attach,
   capabilities = capabilities,
   --	  on_attach = on_attach,
   --     flags = lsp_flags,
   --     cmd = { "pyright-langserver", "--stdio" },
   --     filetypes = { "python" },
   --     settings = {
   --        python = {
   --           analysis = {
   --              autoSearchPaths = true,
   --              diagnosticMode = "workspace",
   --              useLibraryCodeForTypes = true
   --           }
   --        }
   --     },
   --     single_file_support = true,
}


require('lspconfig')['vimls'].setup{
   on_attach = on_attach,
   capabilities = capabilities,
   filetypes = {"vim"},
   init_options = {
      diagnostic = {
         enable = true
      },
      indexes = {
         count = 3,
         gap = 100,
         projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
         runtimepath = true
      },
      isNeovim = true,
      iskeyword = "@,48-57,_,192-255,-#",
      runtimepath = "",
      suggest = {
         fromRuntimepath = true,
         fromVimruntime = true
      },
      vimruntime = ""
   },

   single_file_support = true,
}

require('lspconfig')['bashls'].setup{
   on_attach = on_attach,
   capabilities = capabilities,
   --	  on_attach = on_attach,
   --     flags = lsp_flags,
   --     cmd = { "pyright-langserver", "--stdio" },
   --     filetypes = { "python" },
   --     settings = {
   --        python = {
   --           analysis = {
   --              autoSearchPaths = true,
   --              diagnosticMode = "workspace",
   --              useLibraryCodeForTypes = true
   --           }
   --        }
   --     },
   --     single_file_support = true,
}

-- for cursor autocmd

vim.cmd[[
augroup hightlight
autocmd!
set updatetime=2000
autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
augroup END
]]

