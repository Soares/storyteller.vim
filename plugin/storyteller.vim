augroup story
	autocmd BufEnter *.story call SetStory()
augroup end

function! SetStory()
	setf story
	setlocal wrap linebreak nolist
	setlocal display+=lastline
	noremap  <buffer> <silent> k gk
	noremap  <buffer> <silent> j gj
	set spell
	set nornu nonu
endfunction
