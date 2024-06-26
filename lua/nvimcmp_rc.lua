-- Set up nvim-cmp.
local cmp = require'cmp'

local kind_icons = {
   Text = "󰉿",
   Method = "m",
   Function = "󰊕",
   Constructor = "",
   Field = "",
   Variable = "󰆧",
   Class = "󰌗",
   Interface = "",
   Module = "",
   Property = "",
   Unit = "",
   Value = "󰎠",
   Enum = "",
   Keyword = "󰌋",
   Snippet = "",
   Color = "󰏘",
   File = "󰈙",
   Reference = "",
   Folder = "󰉋",
   EnumMember = "",
   Constant = "󰇽",
   Struct = "",
   Event = "",
   Operator = "󰆕",
   TypeParameter = "󰊄",
}

cmp.setup({
   snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
         require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
   },
   window = {
      --completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
   },

   mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
   }),
   formatting = {
      fields = {"kind", "abbr", "menu"},
      format = function(entry, vim_item)
         vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
         vim_item.menu = ({
            luasnip = "LuaSnip",
            nvim_lua = "[NVim Lua]",
            nvim_lsp = "[LSP]",
            buffer = "[Buffer]",
            path = "[Path]",
         })[entry.source.name]
         return vim_item
      end,
   },
   --   sources = cmp.config.sources({
   sources = ({
      { name = 'luasnip' },
      { name = 'nvim_lsp' },
      { name = 'nvim_lua', max_item_count = 6 },
      { name = 'path' },
      { name = 'buffer', max_item_count = 6 },
   }),
   {name = "luasnip"},
   confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
   },
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
   sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
   }, {
      { name = 'buffer' },
   })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
   mapping = cmp.mapping.preset.cmdline(),
   sources = {
      { name = 'buffer' }
   }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
   mapping = cmp.mapping.preset.cmdline(),
   sources = cmp.config.sources({
      { name = 'path' }
   }, {
      { name = 'cmdline' }
   })
})
