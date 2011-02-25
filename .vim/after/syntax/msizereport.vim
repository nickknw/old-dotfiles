"Matches
syn match all_text /.*/			    contains=ALL
syn match header /^.*:$/		    contains=foldername 
syn match foldername /.*\/\zs.*\(:\)\@=/    

syn match methodCount /^.\dm/		    
syn match lineCount /\d\d*L/		    
syn match filename /\(\/\)\@<=[^\/]\{-1,}\(\.\)\@=/	    


"Colors
hi def all_text ctermfg=gray guifg=gray

hi def header cterm=bold gui=bold ctermfg=gray guifg=gray
hi def foldername cterm=bold gui=bold ctermfg=black guifg=black

hi def methodCount ctermfg=darkblue guifg=darkblue
hi def lineCount ctermfg=darkcyan guifg=darkcyan
hi def filename ctermfg=black guifg=black
