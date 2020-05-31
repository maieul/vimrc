" Vim Configuration - Maïeul Rouquette
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'http://github.com/ciaranm/detectindent'
Plug 'https://github.com/chrisbra/vim-xml-runtime.git'
Plug 'scrooloose/nerdcommenter'
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'http://github.com/mattn/emmet-vim.git'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'https://github.com/plasticboy/vim-markdown.git'
Plug 'https://github.com/dkarter/bullets.vim.git'

Plug 'https://github.com/ap/vim-css-color.git'
Plug 'https://github.com/hail2u/vim-css3-syntax.git'
Plug 'https://github.com/groenewege/vim-less.git'
Plug 'https://github.com/elzr/vim-json.git'

Plug 'https://github.com/stephpy/vim-yaml.git'

Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://github.com/junegunn/vim-easy-align.git'
Plug 'https://github.com/gagoar/StripWhiteSpaces.git'

Plug 'https://github.com/vim-scripts/cmdline-completion.git'

Plug 'https://github.com/haya14busa/incsearch.vim.git'
Plug 'https://github.com/pelodelfuego/vim-swoop.git'
Plug 'https://github.com/brooth/far.vim.git'

Plug 'https://github.com/mhinz/vim-signify.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/christoomey/vim-conflicted.git'
Plug 'https://github.com/jreybert/vimagit.git'


Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/FelikZ/ctrlp-py-matcher.git'

Plug 'https://github.com/terryma/vim-multiple-cursors.git'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'
Plug 'https://github.com/gioele/vim-autoswap.git'

Plug 'https://github.com/machakann/vim-highlightedyank.git'

Plug 'https://github.com/vim-latex/vim-latex.git'
Plug 'https://github.com/vim-voom/VOoM.git'

Plug 'https://github.com/nathanaelkane/vim-indent-guides.git'
Plug 'francoiscabrol/ranger.vim'

Plug 'StanAngeloff/php.vim'
Plug 'tobyS/pdv'
Plug 'tobyS/vmustache'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()
filetype plugin indent on

" Annule la compatibilite avec l'ancetre Vi : totalement indispensable
set nocompatible

" Fichier de swap
set dir=~/.vimswp

"Affichage
set title                 " Met a jour le titre de votre fenetre ou de
                          " votre terminal
set number                " Affiche le numero des lignes
set ruler                 " Affiche la position actuelle du curseur
set wrap                  " Affiche les lignes trop longues sur plusieurs
                          " lignes
set linebreak
set scrolloff=3           " Affiche un minimum de 3 lignes autour du curseur
                          " (pour le scroll)

" Coloration syntaxique
syntax enable
" Active les comportements specifiques aux types de fichiers comme la syntaxe et l'indentation
filetype plugin on
"
"Indentation
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
:autocmd BufReadPost * :DetectIndent


" -- Recherche
set ignorecase            " Ignore la casse lors d'une recherche
set smartcase             " Si une recherche contient une majuscule,
                          " re-active la sensibilite a la casse
set incsearch             " Surligne les resultats de recherche pendant la
                          " saisie
set hlsearch              " Surligne les resultats de recherche

" -- Beep
set visualbell            " Empeche Vim de beeper
set noerrorbells          " Empeche Vim de beeper

" Active le comportement 'habituel' de la touche retour en arriere
set backspace=indent,eol,start

" Cache les fichiers lors de l'ouverture d'autres fichiers
set hidden


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"		SWOOP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:swoopWindowsVerticalLayout = 1
" Réglages spécifiques monde tex

augroup filetypedetect
	au! BufRead,BufNewFile *.bbx	setfiletype tex
	au! BufRead,BufNewFile *.dbx	setfiletype tex
	au! BufRead,BufNewFile *.lbx	setfiletype tex
	au! BufRead,BufNewFile *.cbx	setfiletype tex
augroup END
let g:tex_flavor='latex'
" Utilise la version sombre de Solarized
set background=dark
"colorscheme solarized

"Police

set guifont=Monaco:h16

" Réglages pour l'édition
" Avoir de l'UTF-8 par défaut

set encoding=utf-8

" Les , sont rarement utilises l’un a la suite de l’autre
imap ,, <Esc>l:w<CR>
map ,, <Esc>

"Orthographe

"Copier-coller vers vrai presse papier

map cc "+y
map vv "+p

"Pour tjr remonter à gauche avec voom

let g:voom_always_allow_move_left = 1

function Chercher(pattern)
	execute "w"
	execute "vimgrep /".a:pattern."/ %"
	execute "copen"
endfunction

command! -nargs=* Ch :call Chercher(<q-args>)

"PHP https://github.com/StanAngeloff/php.vim
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" Activer les caractères invisibles
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
command Inv set list
command NoInv set nolist

"Activer la souris
set mouse=a

"Désactiver le bip bisuel
set novb

" vimrc local
set exrc
set secure
"cls

augroup filetypedetect
    au BufRead,BufNewFile *.cls set filetype=tex
augroup EN
"Lang
set spelllang=fr
au BufNewFile,BufRead *.dtx  set spelllang=en
"snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
