local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
   vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release lazypath,
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
      'nvim-telescope/telescope.nvim', branch = 'master',
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
   },
   {
      "phaazon/hop.nvim",
      branch = "v2",
      config = function ()
         require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
      end

   },

   {
      "vhyrro/luarocks.nvim",
      priority = 1000, -- We'd like this plugin to load first out of the rest
      config = true, -- This automatically runs `require("luarocks-nvim").setup()`
   },
   {
      "nvim-neorg/neorg",
      dependencies = { "luarocks.nvim" },
      version = "*",
      config = function()
         require("neorg").setup {
            load = {
               ["core.defaults"] = {},
               ["core.concealer"] = {},
               ["core.dirman"] = {
                  config = {
                     workspaces = {
                        notes = "~/notes",
                     },
                     default_workspace = "notes",
                  },
               },
            },
         }

         vim.wo.foldlevel = 99
         vim.wo.conceallevel = 2
      end,
   },
   {
      "nvim-neorg/lua-utils.nvim"
   },
   { "nvim-neotest/nvim-nio" },
   {
      'MunifTanjim/nui.nvim'
   },

   {
      'pysan3/pathlib.nvim'
   },
   {
      "lewis6991/gitsigns.nvim"
   },
   {
      "ThePrimeagen/harpoon"
   },
   {
      "nvim-telescope/telescope-frecency.nvim",
      config = function()
         require("telescope").load_extension "frecency"
      end,
   },
   {
      "folke/flash.nvim",
      event = "VeryLazy",
      opts = {},
      -- stylua: ignore
      keys = {
         { "<leader>s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
         { "<leader>S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
         { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
         { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
         { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      },
   },
   {"shortcuts/no-neck-pain.nvim", version = "*"},
   {
      "ray-x/lsp_signature.nvim",
      event = "VeryLazy",
      opts = {},
      config = function(_, opts) require'lsp_signature'.setup(opts) end
   },
   {
      "danielfalk/smart-open.nvim",
      branch = "0.2.x",
      config = function()
         require("telescope").load_extension("smart_open")
      end,
      dependencies = {
         "kkharji/sqlite.lua",
         -- Only required if using match_algorithm fzf
         { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
         -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
         { "nvim-telescope/telescope-fzy-native.nvim" },
      },
   },
   {
     "nvim-treesitter/nvim-treesitter-context"
   },
   {'kevinhwang91/nvim-bqf'},
   {
      "kevinhwang91/nvim-ufo",
      dependencies = { 'kevinhwang91/promise-async' },
   },
   {
      "j-hui/fidget.nvim",
      opts = {
         -- options
      },
   },
   {
      'stevearc/oil.nvim',
      opts = {},
      -- Optional dependencies
      dependencies = { "nvim-tree/nvim-web-devicons" },
   },
   {
      "gabrielpoca/replacer.nvim",
      keys = {
         {"<leader>h", mode = {"n"}, function () require("replacer").run({save_on_write = false, rename_files = false}) end, desc = "replacer"},
         {"<leader>H", mode = {"n"}, function () require("replacer").save({save_on_write = false, rename_files = false}) end, desc = "replacer"}
      }
   },
   {
      'Wansmer/treesj',
      keys = {
         {'<space>m', mode = {"n"}, function() require("treesj").toggle() end, desc = "treesj"},
         {'<space>j', mode = {"n"}, function() require("treesj").join() end, desc = "treesj"},
         {'<space>v', mode = {"n"}, function() require("treesj").split() end, desc = "treesj"},
      },
      dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
      config = function()
         require('treesj').setup({--[[ your config ]]})
      end,
   },
   {
      "folke/trouble.nvim",
      opts = {}, -- for default options, refer to the configuration section for custom setup.
      cmd = "Trouble",
      keys = {
         {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
         },
         {
            "<leader>xX",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
         },
         {
            "<leader>cs",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
         },
         {
            "<leader>cl",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
         },
         {
            "<leader>xL",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
         },
         {
            "<leader>xQ",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Quickfix List (Trouble)",
         },
      },
   }
})
