" pour insérer automatiquement les compteurs de page/colonnes/lignes
" les compteurs
let g:l = 0
let g:c = 0
let g:p = 0
let g:f = "v"

" les booleens
let g:col = 1
let g:folio = 1

" les commandes d'insertion/d'incrémentation
function PB_content()
	if g:folio == 1
		if g:f == "r"
			let g:f = "v"
		else
			let g:f = "r"
			let g:p = g:p + 1
		endif
		let g:c = 0
		return '<pb n="'.g:p.g:f.'" />'.CB_content()
	else
		let g:p = g:p + 1
		let g:c = 0
		return '<pb n="'.g:p.'" />'.CB_content()
endfunction

function CB_content()
	if g:col > 0
		let g:c = g:c + 1
		let g:l = 0
		return '<cb n="'.g:c.'" />'.LB_content()
	else
		let g:l = 0
		return LB_content()
	endif
endfunction

function LB_content()
	let g:l = g:l + 1
	if Test_caractere_suivant_espace() == 1
		echom "oui"
		return '<lb n="'.g:l."\" />\r\n"
	else
		return '<lb n="'.g:l.'" />'
endfunction

function Test_caractere_suivant_espace()
"Test si le caractère suivant est une espace"
	let position = getcurpos()
	let ligne = getline(position[1])
	let car_suivant = ligne[position[2]]
	if car_suivant == ' '
		return 1
	else 
		return 0
endfunction

command PB exe":normal a".PB_content()
command CB exe":normal a".CB_content()
command LB exe":normal a".LB_content()

"balisage complexe et fréquent
function Prae()
	let s="\r\n<choice>\r\n"
	let s=s."<abbr type=\"tachy\">p̅</abbr>\r\n"
	let s=s."<expan cert=\"high\">prae</expan>\r\n"
	let s=s."<expan cert=\"high\">pre</expan>\r\n"
	let s=s."</choice>\r\n"
	return s
endfunction

command PRAE exe":normal a".Prae()
