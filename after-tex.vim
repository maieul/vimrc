" 80 à l'affichage

set columns=80
" point -> sauvegarde auto + 
"Si je tape .., cela m'insère juste un point
"Si je tape juste un point, cela me sauvegarde et fait un retour ligne
imap .~ <C-V>046~
imap . .<CR><Esc>:w<CR>a

" 
command Plan Voom latex
" Double {{ et autres
call IMAP('::', '::', 'tex')
call IMAP('{{', '{{', 'tex')
call IMAP('((', '((', 'tex')
call IMAP('[[', '[[', 'tex')
call IMAP('$$', '$$', 'tex')


