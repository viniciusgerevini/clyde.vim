" Vim syntax file
" Language: Clyde Dialogue Language
" Maintainer: Vinicius Gerevini
" Latest Revision: 27 January 2021

if exists("b:current_syntax")
  finish
endif

" Match TODO comments
syn keyword clydeTodo contained TODO XXX FIXME NOTE
syn match clydeComment "--.*$" contains=clydeTodo


" Default
syn match clydeEscape "\v(\\\#|\\\$|\\\:)"
syn match clydeBlockName "\v[A-Za-z0-9_ ]+" contained
syn match clydeDivert "->" nextgroup=clydeBlockName
syn match clydeParentDivert "<-"
syn match clydeTag "\v\#[A-Za-z0-9_]+"
syn match clydeLineId "\v\$[A-Za-z0-9_]+"
syn match clydeSpeaker "\v[A-Za-z0-9_ ]+:"
syn match clydeBlock "^==.*$" contains=clydeBlockName
syn match clydeOptionSymbols "\v^[ 	]*[*+>]"
syn keyword clydeLogicConstants contained OPTIONS_COUNT
syn keyword clydeLogicKeywords contained set trigger when

syn keyword clydeOperators contained and AND or OR is IS isnt ISNT not NOT
syn match clydeOperators "!=\|==\|&&\|||\|<=\|>=\|<\|>" contained
syn match clydeOperators "=\|+=\|-=\|*=\|/=\|^=\|%=\|+\|-\|*\|/\|%\|\^\|!" contained

" Logic types
syn keyword clydeBoolean contained true false
syn match clydeNumber "\v\d+" contained
syn match clydeNumber "\v\d+\\.\d+" contained
syn match clydeVariable "[A-Za-z][A-Za-z0-9_]*" contained

syn match clydeStringVar "[%][A-Za-z][A-Za-z0-9_]*[%]"
syn region clydeString start=/"/ skip=/\\"/ end=/"/ contained contains=clydeStringVar

syn region clydeLogicBlock start="\v\{" end="\v\}" fold transparent contains=clydeLogicKeywords,clydeBoolean,clydeNumber,clydeString,clydeOperators,clydeLogicConstants,clydeVariable

syn match clydeVariationsMarker "[-]" contained
syn keyword clydeVariationsType contained shuffle once sequence cycle
syn region clydeVariationsBlock start="(" end=")" fold transparent contains=clydeVariationsType,clydeVariationsMarker

" Set highlights
hi default link clydeTodo Todo
hi default link clydeComment Comment
hi default link clydeBoolean Boolean
hi default link clydeOperators Operator
hi default link clydeNumber Number
hi default link clydeString String
hi default link clydeStringVar Delimiter
hi default link clydeLogicKeywords Keyword
hi default link clydeLogicConstants Constant
hi default link clydeOptionSymbols Delimiter
hi default link clydeVariable Identifier

hi default link clydeBlockName Identifier
hi default link clydeBlock Operator
hi default link clydeDivert Special
hi default link clydeParentDivert Special
hi default link clydeTag Special
hi default link clydeLineId Identifier
hi default link clydeSpeaker Special
hi default link clydeVariationsType Special
hi default link clydeVariationsMarker Delimiter

let b:current_syntax = "clyde"

