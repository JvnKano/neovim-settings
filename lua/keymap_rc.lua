
------------------------------key mappings------------------------------

local map = vim.keymap.set
local options = { noremap = true, silent = true }

function HlsearchOnOff()
   local hl = vim.api.nvim_get_option_value(("hlsearch"), {})
   if hl then
      vim.opt.hlsearch = false
   else
      vim.opt.hlsearch = true
   end
end



function Diffkeymap()
   local flag = vim.api.nvim_get_option_value(("diff"), {})
   if flag then
      map("n", "<c-h>", ":diffget<cr>", { noremap = true, silent = true, buffer = true });
      map("n", "<c-l>", ":diffput<cr>", { noremap = true, silent = true, buffer = true });
   else
      map("n", "<c-h>", "<BS>", { noremap = true, silent = true, buffer = true });
      map("n", "<c-l>", "<Cmd>nohlsearch|diffupdate|normal! <C-L><CR>", { noremap = true, silent = true, buffer = true });
   end
end

vim.cmd[[

augroup DiffAuto
au!
au OptionSet diff lua Diffkeymap()
augroup END

]]
--map("n", "<c-h>", ":diffget<cr>", { noremap = true, silent = true });
--map("n", "<c-l>", ":diffput<cr>", { noremap = true, silent = true });
--

map("n", "<leader>w", ":w<cr>", { noremap = true, silent = true });
map("n", "<c-z>", "<NOP>", options)
map("n", "<c-p>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", options)
map("n", "<c-n>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", options)
map({"c", "i"}, "<c-r><c-r>", "\"", {noremap = true})
--map("n", "R", ":FlutterReload<cr>", options)
map("n", "<a-q>", ":lua CopenOnOff()<cr>", options)
map("n", "<a-5>", ":lua HlsearchOnOff()<cr>", options)
map("n", "]q", "<cmd>cn<cr>", options)
map("n", "[q", "<cmd>cp<cr>", options)
map("", "<leader>\\", "<cmd>lua require'hop'.hint_words()<cr>", options)
map("n", "<leader>e", "<cmd>w<CR><cmd>make<CR>", options);
map("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", options);
map("n", "<leader>he", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", options);
-- map("n", "<a-h>", "<c-w><", options);
-- map("n", "<a-l>", "<c-w>>", options);
-- map("n", "<a-j>", "<c-w>+", options);
-- map("n", "<a-k>", "<c-w>-", options);

--map("n", "<leader>w", ":w<cr>", options);

map("n", "<leader>m", "<cmd>mkview<CR>", options);
map("n", "<leader>l", "<cmd>loadview<CR>", options);
map("n", "*", "<cmd>let @/='\\<'.expand('<cword>').'\\>'<cr>", options);
--map("n", "<c-s>", "<cmd>Fern . -drawer -toggle<CR>", options);
map("x", "<leader>p", "\"_dP", options); --map("n", "<c-s>", "<cmd>Fern %:h -drawer -toggle<CR>", options); map("n", "<F7>", "<cmd>DapToggleRepl<CR>", options);

--map("n", "<F8>", "<cmd>DapContinue<CR>", options);
--map("n", "<F9>", "<cmd>DapStepOver<CR>", options);
--map("v","<M-k>","<Cmd>lua require('dapui').eval()<CR>", {})
