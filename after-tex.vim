" Chargé par ~/vim/after/ftpplugin/tex.vim
" 80 à l'affichage

set columns=80
" point -> sauvegarde auto +
"Si je tape .~, cela m'insère juste un point puis un ~
"Si je tape juste un point, cela me sauvegarde et fait un retour ligne
imap .~ <C-V>046~
imap . .<CR><Esc>:w<CR>a

command! Plan Voom latex

" Citation et note de bas de page
:call IMAP('fn', '\footnote{<++>}<++>','tex')
:call IMAP('fc', '\footcite[<++>]{<++>}<++>', 'tex')
" Double {{ et autres (annulation de commande défini en standard)
call IMAP('::', '::', 'tex')
call IMAP('{{', '{{', 'tex')
call IMAP('((', '((', 'tex')
call IMAP('[[', '[[', 'tex')
call IMAP('$$', '$$', 'tex')

