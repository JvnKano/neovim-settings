
vim.cmd[[
function! s:sudo_write_buffer() abort
if has('nvim')
   let s:askpass_path = tempname()
   let s:password = inputsecret("Enter Password:")
   let $SUDO_ASKPASS = s:askpass_path

   try
   call delete(s:askpass_path)
   call writefile(['#!/bin/sh'], s:askpass_path, 'a')
   call writefile(["echo '". s:password . "'"], s:askpass_path, 'a')
   call setfperm(s:askpass_path, "rwx------")
   write ! sudo -A tee > /dev/null %
   finally 
   unlet s:password
   call delete(s:askpass_path)
   endtry
else
   write ! sudo tee  > /dev/null cindent %
   endif
   endfunction

   command! SudoWrite call s:sudo_write_buffer()

   ]]
   local ls  = require("luasnip")

   ls.config.set_config {
      history = true,
      updateevents = "TextChanged, TextChangedI",
      enable_autosnippets = true,
--      ext_opts = {
--         [require("luasnip.util.types").choiceNode] = {
--            active = {
--               virt_text = { {"〇"}}
--            },
--         },
--      },


   }
