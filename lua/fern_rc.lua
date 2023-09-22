vim.cmd[[
function! s:init_fern() abort
" Write custom code here
nmap <buffer> g? <Plug>(fern-action-help)
nmap <buffer> <leader>r <Plug>(fern-action-choice)
endfunction


augroup my-fern
autocmd! *
autocmd FileType fern call s:init_fern()
augroup END


]]

