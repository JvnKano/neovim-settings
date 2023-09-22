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
require("tokyonight").setup({
   transparent = false,
   styles = {
      sidebars = "transparent",
      floats = "transparent",
   },
})


vim.cmd("colorscheme tokyonight-night")

