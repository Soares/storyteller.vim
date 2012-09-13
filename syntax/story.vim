" Vim syntax file
" Language:     Story (see storyteller)
" Maintainer:   Nate Soares <nate@so8r.es>
" Filenames:    *.story
" Last Change:	2012 Sept 12

if exists("b:current_syntax")
  finish
endif
syn case ignore

syn match storyEscape "\\[\\/*^~`$=%@&|\[\]{}<> ]"

syn cluster storyInlineBase contains=storyCode,storySuper,storySub,storyMath,storyTodo,storyCheck,storyAnnotation,storyMode
syn cluster storyInline     contains=@storyInlineBase,storyItalic,storyBold

syn region storyHeading matchgroup=storyHeadingDelimiter start="^\s*#\+" end="#*\s*$" keepend oneline contains=@storyInline
syn region storyQuote   matchgroup=storyQuoteDelimiter   start="^>" end="$" keepend oneline contains=@storyInline nextgroup=storyQuote,storyAttribution skipnl
syn match  storyAttribution excludenl "^-.*$" contained contains=@storyInline

syn region storyItalic start="\/" end="\/" oneline keepend contains=storyItalicBold,@storyInlineBase
syn region storyBold   start="\*" end="\*" oneline keepend contains=storyBoldItalic,@storyInlineBase
syn region storyCode   start="`"  end="`"  oneline keepend contains=@storyInline
syn region storySuper  start="\^" end="\^" oneline keepend contains=@storyInline
syn region storySub    start="\~" end="\~" oneline keepend contains=@storyInline
syn region storyMath   start="\$" end="\$" oneline keepend contains=@storyInline

syn region storyItalicBold start="\*" end="\*" contained oneline keepend
syn region storyBoldItalic start="\/" end="\/" contained oneline keepend

syn region storyTodo    start="{!" end="!}" oneline contains=storyTodo
syn region storyNote    start="{-" end="-}" oneline contains=storyNote
syn region storyComment start="{#" end="#}"         contains=storyComment

syn region storyInclude matchgroup=storyIncludeDelimiter start="{+" end="+}" transparent contains=storyIncludeParam
syn match  storyIncludeParam "|" contained

syn match storyRule "^ *\* *\* *\*[ *]*$"
syn match storyRule "^ *- *- *-[ -]*$"

syn region storyScene matchgroup=storySceneDelimiter start="^=" end="$" transparent contains=storySceneTag
syn match  storySceneTag "@\(\w\|-\)\+" contained nextgroup=storyCategory skipwhite
syn match  storyCategory "#\(\w\|-\)\+" contained nextgroup=storyCategory skipwhite

syn region storyPlace matchgroup=storyPlaceDelimiter start="^%" end="$" transparent contains=storyHashTag
syn region storyTime  matchgroup=storyTimeDelimiter  start="^@" end="$" transparent contains=storyHashTag
syn region storyNote  matchgroup=storyNoteDelimiter  start="^&" end="$" transparent contains=@storyInline
syn match  storyHashTag "@\(\w\|-\)\+" contained

syn region storyAnnotation matchgroup=storyAnnotationDelimiter start="\[" end="\]" transparent contains=storyAnnotationArg,@storyInline
syn match  storyAnnotationArg excludenl "\(\\.\|[^\\\[|]\)*|" contained contains=storyEscape,storyHashTag nextgroup=@storyInline skipwhite

syn region storyMode matchgroup=storyModeDelimiter start="<" end=">" transparent contains=storyModeArg,@storyInline
syn match  storyModeArg excludenl "\(\\.\|[^\\|<]\)*|" contained contains=storyEscape,storyHashTag nextgroup=@storyInline skipwhite

syn region storyCheck matchgroup=storyCheckDelimiter start="|" end="|" transparent contains=storyCheckArg,@storyInline
syn match  storyCheckArg excludenl "\(\\.\|[^\\=|]\)*=" contained contains=storyEscape,storyItalicHashTag nextgroup=@storyInline skipwhite
syn match  storyItalicHashTag "@\(\w\|-\)\+" contained

hi def storyItalic        term=italic      cterm=italic      gui=italic
hi def storyBold          term=bold        cterm=bold        gui=bold
hi def storyItalicBold    term=bold,italic cterm=bold,italic gui=bold,italic
hi def storyBoldItalic    term=bold,italic cterm=bold,italic gui=bold,italic

hi def link storyEscape              Special
hi def link storyHeadingDelimiter    PreProc
hi def link storyQuoteDelimiter      Constant
hi def link storyAttribution         Underlined
hi def link storyCode                PreProc
hi def link storySuper               PreProc
hi def link storySub                 PreProc
hi def link storyMath                Special
hi def link storyRule                Constant
hi def link storyTodo                Todo
hi def link storyNote                Comment
hi def link storyComment             Comment
hi def link storyIncludeDelimiter    Type
hi def link storyIncludeParam        Type
hi def link storySceneDelimiter      Identifier
hi def link storyPlaceDelimiter      Type
hi def link storyTimeDelimiter       Constant
hi def link storyNoteDelimiter       Statement
hi def link storyHashTag             Statement
hi def link storySceneTag            Statement
hi def link storyCategory            PreProc
hi def link storyAnnotationDelimiter Constant
hi def link storyAnnotationArg       Constant
hi def link storyModeDelimiter       Identifier
hi def link storyModeArg             Identifier
hi def link storyCheckDelimiter      Comment
hi def link storyCheckArg            Comment

hi def storyItalicHashTag term=italic ctermfg=2 cterm=italic guifg=2 gui=italic

let b:current_syntax = "story"
