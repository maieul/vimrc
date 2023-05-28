let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"
nnoremap <leader>p :call pdv#DocumentWithSnip()<CR>
"autocmd BufEnter * call ncm2#enable_for_buffer()
"#set completeopt=noinsert,menuone,noselect

let g:syntastic_php_checkers=['php', 'phpcs']
