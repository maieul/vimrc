" point -> sauvegarde auto + 
imap . .<CR><Esc>:w<CR>a
" Double {{ et autres
call IMAP('::', '::', 'tex')
call IMAP('{{', '{{', 'tex')
call IMAP('((', '((', 'tex')
call IMAP('[[', '[[', 'tex')
call IMAP('$$', '$$', 'tex')


