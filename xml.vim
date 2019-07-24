" pour insérer automatiquement les compteurs de page/colonnes/lignes
" les compteurs
let g:l = 0
let g:c = 0
let g:p = 0
let g:f = "v"
let g:m = 1
let g:sm = 0

" les booleens
let g:col = 1
let g:folio = 1
let g:submilestone = 1


" les commandes d'insertion/d'incrémentation

function MS_content()
	if g:submilestone == 0
		let g:m = g:m+1
		let ms = g:m
	else
		let g:sm = g:sm+1
		" quand on arrive à la fin de l'introduction de BHL 985 (je sais pas
		" faire des tests booléens en vim)
		if g:m == 1
			if g:sm == 34
				let g:sm = 2
				let g:m = 2
			endif
		endif
		"Pas de de § 21 et 22 dans BHL983
		if g:m == 2
			if g:sm == 20
				let g:sm = 22
				let ms = g:m.'.'.g:sm
			endif
			if g:sm == 25
				let g:m = "epilogue"
				let g:submilestone = 0
				let ms = g:m
			endif
		endif
	endif
	return "<milestone n=\"".ms."\" />\n\r"
endfunction


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
command MS exe":normal a".MS_content()
