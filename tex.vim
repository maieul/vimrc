"Les alt
set winaltkeys=no

"Pour le passage de mot en mot

set iskeyword+=\
"Pour utiliser le @"

imap <Alt-B> <Plug>Tex_MathBF
set grepprg=grep\ -nH\ $*
"taille de l'indentation"

set sw=2

"Pouvoir frapper des é

imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine

"Replis"

set foldmethod=syntax
" lorsqu'on frappe un point, sauvegarder automatiquement

imap . .<Esc>:w<CR>a
