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
   {
      "windwp/nvim-ts-autotag",
      config = function ()
         require('nvim-ts-autotag').setup({
            opts = {
               -- Defaults
               enable_close = true, -- Auto close tags
               enable_rename = true, -- Auto rename pairs of tags
               enable_close_on_slash = false -- Auto close on trailing </
            },
            -- Also override individual filetype configs, these take priority.
            -- Empty by default, useful if one of the "opts" global settings
            -- doesn't work well in a specific filetype
            -- per_filetype = {
            --    ["html"] = {
            --       enable_close = false
            --    }
            -- }
         })

      end
   },
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
      config = function ()
         require("flash").setup({
            -- labels = "abcdefghijklmnopqrstuvwxyz",
            labels = "asdfghjklqwertyuiopzxcvbnm",
            search = {
               -- search/jump in all windows
               multi_window = true,
               -- search direction
               forward = true,
               -- when `false`, find only matches in the given direction
               wrap = true,
               ---@type Flash.Pattern.Mode
               -- Each mode will take ignorecase and smartcase into account.
               -- * exact: exact match
               -- * search: regular search
               -- * fuzzy: fuzzy search
               -- * fun(str): custom function that returns a pattern
               --   For example, to only match at the beginning of a word:
               --   mode = function(str)
               --     return "\\<" .. str
               --   end,
               mode = "exact",
               -- behave like `incsearch`
               incremental = false,
               -- Excluded filetypes and custom window filters
               ---@type (string|fun(win:window))[]
               exclude = {
                  "notify",
                  "cmp_menu",
                  "noice",
                  "flash_prompt",
                  function(win)
                     -- exclude non-focusable windows
                     return not vim.api.nvim_win_get_config(win).focusable
                  end,
               },
               -- Optional trigger character that needs to be typed before
               -- a jump label can be used. It's NOT recommended to set this,
               -- unless you know what you're doing
               trigger = "",
               -- max pattern length. If the pattern length is equal to this
               -- labels will no longer be skipped. When it exceeds this length
               -- it will either end in a jump or terminate the search
               max_length = false, ---@type number|false
            },
            jump = {
               -- save location in the jumplist
               jumplist = true,
               -- jump position
               pos = "start", ---@type "start" | "end" | "range"
               -- add pattern to search history
               history = false,
               -- add pattern to search register
               register = false,
               -- clear highlight after jump
               nohlsearch = false,
               -- automatically jump when there is only one match
               autojump = false,
               -- You can force inclusive/exclusive jumps by setting the
               -- `inclusive` option. By default it will be automatically
               -- set based on the mode.
               inclusive = nil, ---@type boolean?
               -- jump position offset. Not used for range jumps.
               -- 0: default
               -- 1: when pos == "end" and pos < current position
               offset = nil, ---@type number
            },
            label = {
               -- allow uppercase labels
               uppercase = true,
               -- add any labels with the correct case here, that you want to exclude
               exclude = "",
               -- add a label for the first match in the current window.
               -- you can always jump to the first match with `<CR>`
               current = true,
               -- show the label after the match
               after = true, ---@type boolean|number[]
               -- show the label before the match
               before = false, ---@type boolean|number[]
               -- position of the label extmark
               style = "overlay", ---@type "eol" | "overlay" | "right_align" | "inline"
               -- flash tries to re-use labels that were already assigned to a position,
               -- when typing more characters. By default only lower-case labels are re-used.
               reuse = "lowercase", ---@type "lowercase" | "all" | "none"
               -- for the current window, label targets closer to the cursor first
               distance = true,
               -- minimum pattern length to show labels
               -- Ignored for custom labelers.
               min_pattern_length = 0,
               -- Enable this to use rainbow colors to highlight labels
               -- Can be useful for visualizing Treesitter ranges.
               rainbow = {
                  enabled = false,
                  -- number between 1 and 9
                  shade = 5,
               },
               -- With `format`, you can change how the label is rendered.
               -- Should return a list of `[text, highlight]` tuples.
               ---@class Flash.Format
               ---@field state Flash.State
               ---@field match Flash.Match
               ---@field hl_group string
               ---@field after boolean
               ---@type fun(opts:Flash.Format): string[][]
               format = function(opts)
                  return { { opts.match.label, opts.hl_group } }
               end,
            },
            highlight = {
               -- show a backdrop with hl FlashBackdrop
               backdrop = true,
               -- Highlight the search matches
               matches = true,
               -- extmark priority
               priority = 5000,
               groups = {
                  match = "FlashMatch",
                  current = "FlashCurrent",
                  backdrop = "FlashBackdrop",
                  label = "FlashLabel",
               },
            },
            -- action to perform when picking a label.
            -- defaults to the jumping logic depending on the mode.
            ---@type fun(match:Flash.Match, state:Flash.State)|nil
            action = nil,
            -- initial pattern to use when opening flash
            pattern = "",
            -- When `true`, flash will try to continue the last search
            continue = false,
            -- Set config to a function to dynamically change the config
            config = nil, ---@type fun(opts:Flash.Config)|nil
            -- You can override the default options for a specific mode.
            -- Use it with `require("flash").jump({mode = "forward"})`
            ---@type table<string, Flash.Config>
            modes = {
               -- options used when flash is activated through
               -- a regular search with `/` or `?`
               search = {
                  -- when `true`, flash will be activated during regular search by default.
                  -- You can always toggle when searching with `require("flash").toggle()`
                  enabled = false,
                  highlight = { backdrop = false },
                  jump = { history = true, register = true, nohlsearch = true },
                  search = {
                     -- `forward` will be automatically set to the search direction
                     -- `mode` is always set to `search`
                     -- `incremental` is set to `true` when `incsearch` is enabled
                  },
               },
               -- options used when flash is activated through
               -- `f`, `F`, `t`, `T`, `;` and `,` motions
               char = {
                  enabled = false,
                  -- dynamic configuration for ftFT motions
                  config = function(opts)
                     -- autohide flash when in operator-pending mode
                     opts.autohide = opts.autohide or (vim.fn.mode(true):find("no") and vim.v.operator == "y")

                     -- disable jump labels when not enabled, when using a count,
                     -- or when recording/executing registers
                     opts.jump_labels = opts.jump_labels
                     and vim.v.count == 0
                     and vim.fn.reg_executing() == ""
                     and vim.fn.reg_recording() == ""

                     -- Show jump labels only in operator-pending mode
                     -- opts.jump_labels = vim.v.count == 0 and vim.fn.mode(true):find("o")
                  end,
                  -- hide after jump when not using jump labels
                  autohide = false,
                  -- show jump labels
                  jump_labels = false,
                  -- set to `false` to use the current line only
                  multi_line = true,
                  -- When using jump labels, don't use these keys
                  -- This allows using those keys directly after the motion
                  label = { exclude = "hjkliardc" },
                  -- by default all keymaps are enabled, but you can disable some of them,
                  -- by removing them from the list.
                  -- If you rather use another key, you can map them
                  -- to something else, e.g., { [";"] = "L", [","] = H }
                  keys = { "f", "F", "t", "T", ";", "," },
                  ---@alias Flash.CharActions table<string, "next" | "prev" | "right" | "left">
                  -- The direction for `prev` and `next` is determined by the motion.
                  -- `left` and `right` are always left and right.
                  char_actions = function(motion)
                     return {
                        [";"] = "next", -- set to `right` to always go right
                        [","] = "prev", -- set to `left` to always go left
                        -- clever-f style
                        [motion:lower()] = "next",
                        [motion:upper()] = "prev",
                        -- jump2d style: same case goes next, opposite case goes prev
                        -- [motion] = "next",
                        -- [motion:match("%l") and motion:upper() or motion:lower()] = "prev",
                     }
                  end,
                  search = { wrap = false },
                  highlight = { backdrop = true },
                  jump = { register = false },
               },
               -- options used for treesitter selections
               -- `require("flash").treesitter()`
               treesitter = {
                  labels = "abcdefghijklmnopqrstuvwxyz",
                  jump = { pos = "range" },
                  search = { incremental = false },
                  label = { before = true, after = true, style = "inline" },
                  highlight = {
                     backdrop = false,
                     matches = false,
                  },
               },
               treesitter_search = {
                  jump = { pos = "range" },
                  search = { multi_window = true, wrap = true, incremental = false },
                  remote_op = { restore = true },
                  label = { before = true, after = true, style = "inline" },
               },
               -- options used for remote flash
               remote = {
                  remote_op = { restore = true, motion = true },
               },
            },
            -- options for the floating window that shows the prompt,
            -- for regular jumps
            prompt = {
               enabled = true,
               prefix = { { "⚡", "FlashPromptIcon" } },
               win_config = {
                  relative = "editor",
                  width = 1, -- when <=1 it's a percentage of the editor width
                  height = 1,
                  row = -1, -- when negative it's an offset from the bottom
                  col = 0, -- when negative it's an offset from the right
                  zindex = 1000,
               },
            },
            -- options for remote operator pending mode
            remote_op = {
               -- restore window views and cursor position
               -- after doing a remote operation
               restore = false,
               -- For `jump.pos = "range"`, this setting is ignored.
               -- `true`: always enter a new motion when doing a remote operation
               -- `false`: use the window's cursor position and jump target
               -- `nil`: act as `true` for remote windows, `false` for the current window
               motion = false,
            },
         })
      end,
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
   },
   {
      'nvimdev/lspsaga.nvim',
      config = function()
         require('lspsaga').setup({})
      end,
      dependencies = {
         'nvim-treesitter/nvim-treesitter', -- optional
         'nvim-tree/nvim-web-devicons',     -- optional
      },
   },
   {
      "monaqa/dial.nvim",
      config = function()
         local augend = require("dial.augend")
         require("dial.config").augends:register_group{
            -- default augends used when no group name is specified
            default = {
               augend.integer.alias.decimal,   -- nonnegative decimal number (0, 1, 2, 3, ...)
               augend.integer.alias.hex,       -- nonnegative hex number  (0x01, 0x1a1f, etc.)
               augend.date.alias["%Y/%m/%d"],  -- date (2022/02/19, etc.)
            },
         }
      end,
      -- keys = {
      --    {
      --       vim.keymap.set( "n", "<C-a>", function()
      --          require("dial.map").manipulate("increment", "normal")
      --       end)
      --    },
      --    {
      --       vim.keymap.set("n", "<C-x>", function()
      --          require("dial.map").manipulate("decrement", "normal")
      --       end)
      --    },
      -- }

   },
   {
      "shellRaining/hlchunk.nvim",
      event = { "BufReadPre", "BufNewFile" },
      config = function()
         require("hlchunk").setup(
         {
            chunk = {
               enable = false,
               style = {},
               notify = false,
               priority = 0,
               exclude_filetypes = {
                  aerial = true,
                  dashboard = true,
                  -- some other filetypes
               }

            },
         }
         )
      end
   },
   -- {
   --    "RRethy/nvim-treesitter-textsubjects"
   -- },
   {
      'stevearc/overseer.nvim',
      opts = {},
   },
   {
      "kazhala/close-buffers.nvim",
      config = function()
         require('close_buffers').setup({
            preserve_window_layout = { 'this' },
            next_buffer_cmd = function(windows)
               require('bufferline').cycle(1)
               local bufnr = vim.api.nvim_get_current_buf()

               for _, window in ipairs(windows) do
                  vim.api.nvim_win_set_buf(window, bufnr)
               end
            end,
         })
      end,
      keys = {
         {
            "<leader>th",
            mode = {"n"},
            "<CMD>lua require('close_buffers').delete({type = 'hidden'})<CR>",
            { noremap = true, silent = true }, desc = "close_buffers_hidden"
         },
         {
            "<leader>tu",
            mode = {"n"},
            "<CMD>lua require('close_buffers').delete({type = 'nameless'})<CR>", { noremap = true, silent = true }, desc = "close_buffers_nameless" }, {
               "<leader>tc",
               mode = {"n"},
               "<CMD>lua require('close_buffers').delete({type = 'this'})<CR>",
               { noremap = true, silent = true }, desc = "close_buffers_this"
            },
         }

      },
      {
         'nvim-lualine/lualine.nvim',
         dependencies = { 'nvim-tree/nvim-web-devicons' }
      },
      {
         "epwalsh/pomo.nvim",
         version = "*",  -- Recommended, use latest release instead of latest commit
         lazy = true,
         cmd = { "TimerStart", "TimerRepeat" },
         dependencies = {
            -- Optional, but highly recommended if you want to use the "Default" timer
            "rcarriga/nvim-notify",
         },
         opts = {
            -- See below for full list of options 👇
         },
      },
      {
         'romgrk/barbar.nvim',
         dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons },
            init = function() vim.g.barbar_auto_setup = false end,
            opts = {
               -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
               -- animation = true,
               -- …etc.
            },
            version = '^1.0.0', -- optional: only update when a new 1.x version is released
         },
         keys = {
            -- Move to previous/next
            {'<A-,>', mode = {'n'}, '<Cmd>BufferPrevious<CR>', {noremap = true, silent = true}},
            {'<A-.>', mode = {'n'}, '<Cmd>BufferNext<CR>', {noremap = true, silent = true}},
            -- Re-order to previous/next
            {'<A-<>', mode = {'n'}, '<Cmd>BufferMovePrevious<CR>', {noremap = true, silent = true}},
            {'<A->>', mode = {'n'}, '<Cmd>BufferMoveNext<CR>', {noremap = true, silent = true}},
            -- Goto buffer in position...
            {'<A-1>', mode = {'n'}, '<Cmd>BufferGoto 1<CR>', {noremap = true, silent = true}},
            {'<A-2>', mode = {'n'}, '<Cmd>BufferGoto 2<CR>', {noremap = true, silent = true}},
            {'<A-3>', mode = {'n'}, '<Cmd>BufferGoto 3<CR>', {noremap = true, silent = true}},
            {'<A-4>', mode = {'n'}, '<Cmd>BufferGoto 4<CR>', {noremap = true, silent = true}},
            --{'<A-5>', mode = {'n'}, '<Cmd>BufferGoto 5<CR>', {noremap = true, silent = true}},
            {'<A-6>', mode = {'n'}, '<Cmd>BufferGoto 6<CR>', {noremap = true, silent = true}},
            {'<A-7>', mode = {'n'}, '<Cmd>BufferGoto 7<CR>', {noremap = true, silent = true}},
            {'<A-8>', mode = {'n'}, '<Cmd>BufferGoto 8<CR>', {noremap = true, silent = true}},
            {'<A-9>', mode = {'n'}, '<Cmd>BufferGoto 9<CR>', {noremap = true, silent = true}},
            {'<A-0>', mode = {'n'}, '<Cmd>BufferLast<CR>', {noremap = true, silent = true}},
            -- Pin/unpin buffer
            {'<A-p>', mode = {'n'}, '<Cmd>BufferPin<CR>', {noremap = true, silent = true}},
            -- Close buffer
            {'<A-c>', mode = {'n'}, '<Cmd>BufferClose<CR>', {noremap = true, silent = true}},
            -- Wipeout buffer
            --                 :BufferWipeout
            -- Close commands
            --                 :BufferCloseAllButCurrent
            --                 :BufferCloseAllButPinned
            --                 :BufferCloseAllButCurrentOrPinned
            --                 :BufferCloseBuffersLeft
            --                 :BufferCloseBuffersRight
            -- Magic buffer-picking mode
            {'<leader>q', mode = {'n'}, '<Cmd>BufferPick<CR>', {noremap = true, silent = true}},
            -- Sort automatically by...
            {'<Space>bb', mode = {'n'}, '<Cmd>BufferOrderByBufferNumber<CR>', {noremap = true, silent = true}},
            {'<Space>bn', mode = {'n'}, '<Cmd>BufferOrderByName<CR>', {noremap = true, silent = true}},
            {'<Space>bd', mode = {'n'}, '<Cmd>BufferOrderByDirectory<CR>', {noremap = true, silent = true}},
            {'<Space>bl', mode = {'n'}, '<Cmd>BufferOrderByLanguage<CR>', {noremap = true, silent = true}},
            {'<Space>bw', mode = {'n'}, '<Cmd>BufferOrderByWindowNumber<CR>', {noremap = true, silent = true}},

            -- Other:
            -- :BarbarEnable - enables barbar (enabled by default)
            -- :BarbarDisable - very bad command, should never be used
         },
         lazy = false,
      },
      -- {
      --    "nvim-treesitter/nvim-treesitter-textobjects",
      --    dependencies = {
      --       "nvim-treesitter/nvim-treesitter",
      --    },
      -- },
      {
         "RRethy/nvim-treesitter-textsubjects",
      },
      {
         'echasnovski/mini.nvim',
         version = false,
         config = function ()
            require("mini.indentscope").setup(
            {
               symbol = "│",
               options = { try_as_border = true },
            }
            )
            vim.api.nvim_create_autocmd("FileType", {
               pattern = {
                  "help",
                  "alpha",
                  "dashboard",
                  "neo-tree",
                  "Trouble",
                  "trouble",
                  "lazy",
                  "mason",
                  "notify",
                  "toggleterm",
                  "lazyterm",
                  "NvimTree",
               },
               callback = function()
                  vim.b.miniindentscope_disable = true
               end,
            })

            vim.api.nvim_create_autocmd("ColorScheme", {
               pattern = "*",
               callback = function()
                  --vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { link = "@lsp.type.comment" })
                  vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#393836"})
               end,
            })

         end
      },
      {
         "catppuccin/nvim",
      },
      {
         'akinsho/toggleterm.nvim',
         version = "*",
         config = true,
      },
   })
