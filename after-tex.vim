" Chargé par ~/.vim/.after/ftplugin/tex.vim
" 80 à l'affichage
echo "sncf"
set columns=80
" point -> sauvegarde auto +
"Si je tape .~, cela m'insère juste un point puis un ~
"Si je tape juste un point, cela me sauvegarde et fait un retour ligne
imap .~ <C-V>046~
imap . .<CR><Esc>:w<CR>a
if expand('%:e')=='dtx'
	command! Plan Voom latexDtx
else
	command! Plan Voom latex
endif

" Citation et note de bas de page
:call IMAP('fn', '\footnote{}','tex')
:call IMAP('fc', '\footcite[<++>]{<++>}<++>', 'tex')
" Double {{ et autres (annulation de commande défini en standard)
call IMAP('::', '::', 'tex')
call IMAP('{{', '{{', 'tex')
call IMAP('((', '((', 'tex')
call IMAP('[[', '[[', 'tex')
call IMAP('$$', '$$', 'tex')


" orthographe
syntax on
syntax spell toplevel
