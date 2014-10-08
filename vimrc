" Vim Configuration - Maïeul Rouquette
" Inspiré de VIM Configuration - Vincent Jousse
call pathogen#infect()

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

set scrolloff=3           " Affiche un minimum de 3 lignes autour du curseur
                          " (pour le scroll)

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

" Coloration syntaxique
syntax enable
" Active les comportements specifiques aux types de fichiers comme la syntaxe et l'indentation
filetype on
filetype plugin on
filetype indent on
set ai "indentation automatique"

" Réglages spécifiques monde tex

augroup filetypedetect
	au! BufRead,BufNewFile *.bbx	setfiletype tex
	au! BufRead,BufNewFile *.dbx	setfiletype tex
	au! BufRead,BufNewFile *.lbx	setfiletype tex
	au! BufRead,BufNewFile *.cbx	setfiletype tex
let g:tex_flavor='latex'
" Utilise la version sombre de Solarized
set background=dark
"colorscheme solarized

"Police

set guifont=Monaco:h16
set antialias

" Réglages pour l'édition
" Avoir de l'UTF-8 par défaut

set encoding=utf-8
" avoir w qui renvoie vers W, utile pour TeX. \command constitue un seul mot
nmap w W

" Les , sont rarement utilises l’un a la suite de l’autre
imap ,, <Esc>:w<CR>
map ,, <Esc>
