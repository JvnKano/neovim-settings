local builtin = require('telescope.builtin')
local utils = require('telescope.utils')


--vim.keymap.set('n', '<leader>fj', require('telescope').utils.buffer_dir(), {})
--vim.keymap.set('n', '<leader>fj', builtin.current_buffer_fuzzy_find, {})

function new_find_files()
   builtin.find_files({ cwd = utils.buffer_dir()})
end

function new_live_grep()
   builtin.live_grep({ cwd = utils.buffer_dir()})
end


vim.keymap.set('n', '<leader>fj', new_find_files, {})
vim.keymap.set('n', '<leader>fk', new_live_grep, {})

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

