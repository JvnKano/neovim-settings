
------------------------------key mappings------------------------------

local map = vim.keymap.set
local options = { noremap = true, silent = true }

function HlsearchOnOff()
   local hl = vim.api.nvim_get_option_value(("hlsearch"), {}) if hl then
      vim.opt.hlsearch = false
   else
      vim.opt.hlsearch = true
   end
end

function CopenOnOff()
   local vf = vim.fn
   local q_flag = vf.filter(vf.getwininfo(), 'v:val.quickfix')

   if (vf.empty(q_flag) == 1) then
      vim.cmd"copen"
   else
      vim.cmd"cclose"
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

--map("n", "<leader>w", ":w<cr>", { noremap = true, silent = true });
map("n", "<leader>ww", ":WhichKey<cr>", { noremap = true, silent = false });
map("n", "<c-z>", "<NOP>", options)
map("n", "[f", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", options)
map("n", "]f", "<cmd>lua require('harpoon.ui').nav_next()<cr>", options)
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

--map("i", "<c-f>", function() return Myfunc() end, options);
map("n", "<leader>m", "<cmd>mkview<CR>", options);
map("n", "<leader>l", "<cmd>loadview<CR>", options);
map("n", "*", "<cmd>let @/='\\<'.expand('<cword>').'\\>'<cr>", options);
--map("n", "<c-s>", "<cmd>Fern . -drawer -toggle<CR>", options);
map("x", "<leader>p", "\"_dP", options); --map("n", "<c-s>", "<cmd>Fern %:h -drawer -toggle<CR>", options); map("n", "<F7>", "<cmd>DapToggleRepl<CR>", options);
map("x", ".", "\"_dPgn", options);
map("x", ">", ">gv", options);
map("x", "<", "<gv", options);

--map("x", "K", ":move'<-2<CR>gv=gv", options);
--map("x", "J", ":move'>+1<CR>gv=gv", options); map("n", "<c-s>", "<cmd>Fern %:h -drawer -toggle<CR>", options); map("n", "<F7>", "<cmd>DapToggleRepl<CR>", options); map("n", "<F8>", "<cmd>DapContinue<CR>", options);
--map("n", "<F9>", "<cmd>DapStepOver<CR>", options);
--map("v","<M-k>","<Cmd>lua require('dapui').eval()<CR>", {})
--
--
--

function Myfunc()
   local closers = {")", "}", "\"" }
   local line = vim.api.nvim_get_current_line()
   local row, col = unpack(vim.api.nvim_win_get_cursor(0))
   local after = line:sub(col + 1, -1)
   local closer_col = #after + 1
   local closer_i = nil

   for i, closer in ipairs(closers) do
      local cur_index, _ = after:find(closer)
      if cur_index and (cur_index < closer_col) then
         closer_col = cur_index
         closer_i = i
      end
   end
   if closer_i then
      vim.api.nvim_win_set_cursor(0, {row, col + closer_col})
   else
      vim.api.nvim_win_set_cursor(0, {row, col + 1})
   end
end
