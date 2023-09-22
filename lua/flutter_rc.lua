require("flutter-tools").setup {} -- use defaults


vim.cmd[[

augroup FlutterAutoReload
au!
au BufRead,BufNewFile *.dart lua vim.keymap.set("n", "<leader>w", ":w<cr>:FlutterReload<cr>", {buffer = true, noremap = true, silent = true})
augroup END 
]]
