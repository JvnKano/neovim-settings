require("lazy_rc")
require("options")
require("telescope_rc")
require("mason").setup()
require("lspconfig_rc")
require("keymap_rc")
require("nvimcmp_rc")
require("luasnip_rc")
require("treesitter_rc")
require("marks_rc")
require("flutter_rc")
require("sudowrite")
require("treesitter_context_rc")
require("aerial_rc")
require("neorg_rc")
require("gitsigns_rc")
require("lsp_signature_rc")
require("oil_rc")
require("treesj_rc")
require("ufo").setup()
require("nvim_ufo_rc")
require("tokyonight").setup({
   transparent = false,
   styles = { sidebars = "transparent",
      floats = "transparent",
   }, }) vim.cmd [[
augroup InitLua
au!
au BufWritePost ~/.config/nvim/init.lua bufdo source ~/.config/nvim/init.lua
augroup END
]]

vim.cmd [[
augroup LuaFile
au!
au BufEnter *.lua lua vim.keymap.set("n", "<leader>e", "<cmd>w<cr><cmd>so %<cr>",{buffer = true})
augroup END
]]

vim.cmd("colorscheme tokyonight-night")
