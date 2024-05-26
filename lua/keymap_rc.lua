
------------------------------key mappings------------------------------

local map = vim.keymap.set
local options = { noremap = true, silent = true }

function HlsearchOnOff()
   local hl = vim.api.nvim_get_option("hlsearch")
   if hl then
      vim.opt.hlsearch = false
   else
      vim.opt.hlsearch = true
   end
end


map("n", "<leader>w", ":w<cr>", { noremap = true, silent = true });
--
map("n", "<c-p>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", options)
map("n", "<c-n>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", options)
--map("n", "R", ":FlutterReload<cr>", options)
map("n", "<F5>", ":lua HlsearchOnOff()<cr>", options)
map("n", "]q", "<cmd>cn<cr>", options)
map("n", "[q", "<cmd>cp<cr>", options)
map("", "<leader>\\", "<cmd>lua require'hop'.hint_words()<cr>", options)
map("n", "<leader>e", "<cmd>w<CR><cmd>make<CR>", options);
map("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", options);
map("n", "<leader>he", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", options);

--map("n", "<leader>w", ":w<cr>", options);

map("n", "<leader>m", "<cmd>mkview<CR>", options);
map("n", "<leader>l", "<cmd>loadview<CR>", options);
map("n", "*", "*N", options);
--map("n", "<c-s>", "<cmd>Fern . -drawer -toggle<CR>", options);
map("x", "<leader>p", "\"_dP", options);
--map("n", "<c-s>", "<cmd>Fern %:h -drawer -toggle<CR>", options);
--map("n", "<F7>", "<cmd>DapToggleRepl<CR>", options);
--map("n", "<F8>", "<cmd>DapContinue<CR>", options);
--map("n", "<F9>", "<cmd>DapStepOver<CR>", options);
--map("v","<M-k>","<Cmd>lua require('dapui').eval()<CR>", {})
