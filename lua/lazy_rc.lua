local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct


require("lazy").setup({
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
  "EdenEast/nightfox.nvim",
  'neovim/nvim-lspconfig',
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  { 'saadparwaiz1/cmp_luasnip'},

  {
     "L3MON4D3/LuaSnip",
       lazy = false,
       dependencies = { "rafamadriz/friendly-snippets" },
     -- follow latest release.
     version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
     -- install jsregexp (optional!).
     build = "make install_jsregexp"
  },

  {
     'windwp/nvim-autopairs',
     event = "InsertEnter",
     opts = {map_c_h = true} -- this is equalent to setup({}) function
  },

	"machakann/vim-sandwich",
	"windwp/nvim-ts-autotag",
	"nvim-treesitter/nvim-treesitter",
   {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
   },
   "chentoast/marks.nvim",

   -- init.lua:
    {
       'nvim-telescope/telescope.nvim', tag = '0.1.2',
       -- or                              , branch = '0.1.x',
       dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
       'akinsho/flutter-tools.nvim',
       lazy = false,
       dependencies = {
          'nvim-lua/plenary.nvim',
          'stevearc/dressing.nvim', -- optional for vim.ui.select
       },
       config = true,
    },
    {
  'stevearc/aerial.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
}

 })
