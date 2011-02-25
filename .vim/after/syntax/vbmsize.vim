set ft=vbnet
syn match method_name /\s\+\zs\w\+\s\=\((\)\@=/		containedin=ALL

hi def method_name gui=bold guibg=LemonChiffon guifg=black
hi def type_name guibg=lightgreen guifg=black gui=bold

let typeNameMatch = matchadd("type_name", '\v\sAs\s(\w+\.)*\zs\w+')
