" pour insérer automatiquement les compteurs de page/colonnes/lignes
" les compteurs
let g:l = 0
let g:c = 0
let g:col = 1
let g:p = 0
let g:folio = "v"

" les commandes d'insertion/d'incrémentation
function PB_content()
	if g:folio == "r"
		let g:folio = "v"
	else
		let g:folio = "r"
		let g:p = g:p + 1
	endif
	let g:c = 0
	return '<pb n="'.g:p.g:folio.'" />'.CB_content()
endfunction

function CB_content()
	if g:col == 1
		let g:c = g:c + 1
		let g:l = 0
		return '<cb n="'.g:c.'" />'.LB_content()
	endif
	return LB_content()
endfunction

function LB_content()
	let g:l = g:l + 1
	return '<lb n="'.g:l.'" />'
endfunction


command PB exe":normal a".PB_content()
command CB exe":normal a".CB_content()
command LB exe":normal a".LB_content()

