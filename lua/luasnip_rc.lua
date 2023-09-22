local ls = require("luasnip")


vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})



vim.keymap.set({"i", "s"}, "<C-E>", function()
   if ls.choice_active() then
      ls.change_choice(1)
   end
end, {silent = true})


require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/luasnippets/"})


vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]]) --}}}

vim.keymap.set({ "i", "s"}, "<a-p>", function()
   if ls.expand_or_jumpable() then
      ls.expand()
   end
end, { silent = true })

vim.keymap.set({ "i", "s"}, "<a-l>", function()
   if ls.choice_active() then
      ls.change_choice(1)
   end
end)

vim.keymap.set({"i", "s"}, "<a-h>", function()
   if ls.choice_active() then
      ls.change_choice(-1)
   end
end)


require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/luasnippets/"})
--require("luasnip").config.setup({ store_selection_keys = "<A-p>" })
vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]]) --}}}

vim.keymap.set({ "i", "s"}, "<a-p>", function()
   if ls.expand_or_jumpable() then
      ls.expand()
   end
end, { silent = true })

vim.keymap.set({ "i", "s"}, "<a-l>", function()
   if ls.choice_active() then
      ls.change_choice(1)
   end
end)

vim.keymap.set({"i", "s"}, "<a-h>", function()
   if ls.choice_active() then
      ls.change_choice(-1)
   end
end)
