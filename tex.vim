"Les alt
set winaltkeys=no

"Pour le passage de mot en mot

set iskeyword+=\
"Pour utiliser le @"

imap <Alt-B> <Plug>Tex_MathBF
set grepprg=grep\ -nH\ $*

"pour pas plus de 80 caractère par ligne visuellement
set textwidth=79

"taille de l'indentation"
set sw=2

"Pouvoir frapper des é

imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine

"Replis"

set foldmethod=syntax
" supprimer le \ldots auto, que de toute facon je
" n'utilise pas

let g:Tex_SmartKeyDot=0

"Raccourci pour environment

let g:Tex_PromptedEnvironments = 'itemize,enumerate,slide,frame'

"Frapper les guillemets rapidement
let g:Tex_SmartQuoteOpen="\\enquote{"
let g:Tex_SmartQuoteClose="}"

