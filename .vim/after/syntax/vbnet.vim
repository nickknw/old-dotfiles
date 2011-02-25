call clearmatches()

if &background == "light"
    hi Conditional guifg=purple3 gui=bold
    hi String guifg=firebrick
    hi Number guifg=firebrick

    hi def vbnetReturnEx guifg=DarkOrange2 gui=bold
    hi def vbnetLoopEx guifg=red2 gui=bold
    hi def vbnetMethodNameEx guibg=LemonChiffon guifg=black gui=bold
    hi def vbnetElseEx guifg=LightSalmon4 gui=bold
    hi def vbnetSelectEx guifg=DarkViolet gui=bold
    hi def vbnetThrowExceptions guifg=DarkOrange2 gui=bold
else
    hi Conditional guifg=LimeGreen gui=bold
    "hi String guifg=firebrick
    "hi Number guifg=firebrick

    hi def vbnetReturnEx guifg=DarkOrange1 gui=bold
    hi def vbnetLoopEx guifg=orangered gui=bold
    hi def vbnetMethodNameEx guifg=mediumpurple gui=bold
    hi def vbnetElseEx guifg=YellowGreen gui=bold
    hi def vbnetSelectEx guifg=mediumspringgreen gui=bold
    hi def vbnetThrowExceptions guifg=DarkOrange2 gui=bold
endif




let returnMatch = matchadd("vbnetReturnEx", "Return")

let loopMatch = matchadd("vbnetLoopEx", "For Each")
let loopMatch = matchadd("vbnetLoopEx", " In ")
let loopMatch = matchadd("vbnetLoopEx", " Next")
let loopMatch = matchadd("vbnetLoopEx", " While ")
let loopMatch = matchadd("vbnetLoopEx", " End While")

let loopMatch = matchadd("vbnetLoopEx", " Loop")
let loopMatch = matchadd("vbnetLoopEx", " Do While")
let loopMatch = matchadd("vbnetLoopEx", "For ")

let breakContinueMatch = matchadd("vbnetLoopEx", '\(Exit\|Continue\)\s\+\(For\|While\)')

let funcMatch = matchadd("vbnetMethodNameEx", '\(Sub\|Function\)\s\+\zs\w\+\s\=\((\)\@=', -1)

let elseMatch = matchadd("vbnetElseEx", ' Else')
let elseIfMatch = matchadd("vbnetElseEx", ' ElseIf')

let selectMatch = matchadd("vbnetSelectEx", 'Select Case')
let caseMatch = matchadd("vbnetSelectEx", ' Case ')
let caseElseMatch = matchadd("vbnetSelectEx", ' Case Else')
let endSelectMatch = matchadd("vbnetSelectEx", ' End Select')

let throwMatch = matchadd("vbnetThrowExceptions", '\<Throw\>')
