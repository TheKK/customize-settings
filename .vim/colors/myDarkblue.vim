" Vim color file
" Maintainer:	Bohdan Vlasyuk <bohdan@vstu.edu.ua>
" Last Change:	2008 Jul 18

" Modifier:     KK <thumbd03803@gmail.com>

" myDarkblue -- for those who prefer dark background
" [note: looks bit uglier with come terminal palettes,
" but is fine on default linux console palette.]

hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "myDarkblue"

hi Normal		guifg=#c0c0c0 guibg=#000040						ctermfg=gray
hi ErrorMsg		guifg=#ffffff guibg=#287eff						ctermfg=black ctermbg=lightblue
hi Visual		guifg=#8080ff guibg=fg		gui=reverse				ctermfg=black ctermbg=75
hi VisualNOS	guifg=#8080ff guibg=fg		gui=reverse,underline	ctermfg=lightblue ctermbg=fg cterm=reverse,underline
hi Todo			guifg=#d14a14 guibg=#1248d1						ctermfg=red	ctermbg=darkblue
hi Search		guifg=#90fff0 guibg=#2050d0						ctermfg=white ctermbg=98 cterm=bold term=underline
hi IncSearch	guifg=#b0ffff guibg=#2050d0							ctermfg=darkblue ctermbg=gray

hi SpecialKey		guifg=cyan			ctermfg=226 cterm=bold
hi Directory		guifg=cyan			ctermfg=cyan
hi Title			guifg=magenta gui=none ctermfg=magenta cterm=bold
hi WarningMsg		guifg=red			ctermfg=red
hi WildMenu			guifg=yellow guibg=black ctermfg=yellow ctermbg=black cterm=none term=none
hi ModeMsg			guifg=#22cce2		ctermfg=lightblue
hi MoreMsg			ctermfg=darkgreen	ctermfg=darkgreen
hi Question			guifg=green gui=none ctermfg=green cterm=none
hi NonText			guifg=#0030ff		ctermfg=33

hi spellBad	ctermbg=none cterm=underline,bold
hi StatusLine	guifg=blue guibg=darkgray gui=none		ctermfg=blue ctermbg=gray term=none cterm=none
hi StatusLineNC	guifg=black guibg=darkgray gui=none		ctermfg=black ctermbg=gray term=none cterm=none
hi VertSplit	guifg=black guibg=darkgray gui=none		ctermfg=gray term=none cterm=bold

hi Folded	guifg=#808080 guibg=#000040			ctermfg=darkgrey ctermbg=black cterm=bold term=bold
hi FoldColumn	guifg=#808080 guibg=#000040			ctermfg=darkgrey ctermbg=black cterm=bold term=bold
hi LineNr	guifg=#90f020 ctermbg=235 ctermfg=gray cterm=none
hi CursorLineNr 	ctermbg=235 ctermfg=white cterm=bold

hi DiffAdd	guibg=darkblue	ctermbg=darkblue term=none cterm=none
hi DiffChange	guibg=darkmagenta ctermbg=magenta cterm=none
hi DiffDelete	ctermfg=blue ctermbg=cyan gui=bold guifg=Blue guibg=DarkCyan
hi DiffText	cterm=bold ctermbg=red gui=bold guibg=Red

hi Cursor	guifg=black guibg=yellow ctermfg=black ctermbg=yellow
hi lCursor	guifg=black guibg=white ctermfg=black ctermbg=white

hi ColorColumn	ctermbg=235

hi Comment	guifg=#80a0ff ctermfg=darkred cterm=bold
hi Constant	ctermfg=magenta guifg=#ffa0a0 cterm=none
hi Special	ctermfg=brown guifg=Orange cterm=none gui=none
hi Identifier	ctermfg=cyan guifg=#40ffff cterm=none
hi Statement	ctermfg=33 cterm=none guifg=#ffff60 gui=none
hi PreProc	ctermfg=13 guifg=#ff80ff gui=none cterm=none
hi Underlined	cterm=underline term=underline

hi SpellCap ctermfg=red ctermbg=black cterm=bold,underline

"TagHighlight config
	"c:CTagsClass
	"d:CTagsDefinedName
	"e:CTagsEnumerationValue
	"f:CTagsFunction
	"g:CTagsEnumerationName
	"k:CTagsConstant
	"l:CTagsLocalVariable
	"m:CTagsMember
	"n:CTagsNamespace
	"p:CTagsFunction
	"s:CTagsStructure
	"t:CTagsType
	"u:CTagsUnion
	"v:CTagsGlobalVariable
	"x:CTagsExtern
hi Class 		ctermfg=252 cterm=underline
hi DefinedName		ctermfg=5
hi Function		ctermfg=98
hi EnumerationName	ctermfg=cyan
hi EnumerationValue	ctermfg=magenta
hi Extern		ctermfg=brown
hi GlobalVariable	ctermfg=green
hi Member		ctermfg=202
hi LocalVariable	ctermfg=45
hi Structure		ctermfg=27
hi Type			ctermfg=243 guifg=#60ff60 gui=none cterm=none
hi Constant		ctermfg=41
hi Namespace		ctermfg=246
hi link Union struct

" suggested by tigmoid, 2008 Jul 18
hi Pmenu guifg=#c0c0c0 guibg=#404080 ctermfg=black ctermbg=105
hi PmenuSel guifg=#c0c0c0 guibg=#2050d0 ctermfg=black ctermbg=99
hi PmenuSbar guifg=blue guibg=darkgray
hi PmenuThumb guifg=#c0c0c0
