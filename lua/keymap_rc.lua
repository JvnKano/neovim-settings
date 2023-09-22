
------------------------------key mappings------------------------------

local map = vim.keymap.set
local options = { noremap = true, silent = true }

map("n", "<leader>w", ":w<cr>", { noremap = true, silent = true });
--
map("n", "<c-p>", ":bp<cr>", options)
map("n", "<c-n>", ":bn<cr>", options)
map("n", "<a-c>", ":so ~/.config/nvim/init.lua<cr>", options)

map("n", "R", ":FlutterReload<cr>", options)

map("n", "<F5>", "<cmd>source $MYVIMRC<cr>", options)
map("n", "<F6>", "<cmd>!ctags -f .tags -R * <cr>", options)
--map("n", "<c-n>", "<cmd>cn<cr>", options)
--map("n", "<c-p>", "<cmd>cp<cr>", options)
map("", "<leader><leader>", "<cmd>lua require'hop'.hint_words()<cr>", options)
map("n", "<leader>e", "<cmd>w<CR><cmd>make<CR>", options);

--map("n", "<leader>w", ":w<cr>", options);

map("n", "<leader>m", "<cmd>mkview<CR>", options);
map("n", "<leader>l", "<cmd>loadview<CR>", options);
--map("n", "<c-s>", "<cmd>Fern . -drawer -toggle<CR>", options);
map("x", "<leader>p", "\"_dP", options);
--map("n", "<c-s>", "<cmd>Fern %:h -drawer -toggle<CR>", options);
--map("n", "<F7>", "<cmd>DapToggleRepl<CR>", options);
--map("n", "<F8>", "<cmd>DapContinue<CR>", options);
--map("n", "<F9>", "<cmd>DapStepOver<CR>", options);
--map("v","<M-k>","<Cmd>lua require('dapui').eval()<CR>", {})
