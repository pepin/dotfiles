" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	James Pepin <james@bluestatedigital.com>
" Last Change:	2003 May 02

" hi clear

set background=dark
set bg=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "james"
hi Comment	 	    ctermfg=34 term=none cterm=none						  	guifg=#55bb00
hi Constant	 	    ctermfg=250			   cterm=none 	guifg=#ff6600				  gui=none
hi Identifier 	    ctermfg=DarkCyan cterm=none term=none				  	guifg=#00bbbb
" Statement and PreProc are identical
hi Statement  	    ctermfg=33 term=none			   cterm=none 	guifg=#53A6A6	gui=none
hi PreProc	 	    ctermfg=31 term=none						  	guifg=#53A6A6	
hi Function         ctermfg=33 term=none                         guifg=DarkCyan
hi Special	 	    ctermfg=12						  	guifg=#9999cc
hi Error					ctermbg=9								guibg=#ff0000
" Type and Boolean are the same
hi Type	 		    ctermfg=51 cterm=none					  	guifg=#66FFFF	
hi Boolean	        ctermfg=10						  	guifg=#66FFFF	
hi Todo		 	    ctermfg=118	ctermbg=58			  	guifg=Green
hi Directory  	    ctermfg=2						  	guifg=#00c000
hi StatusLine 	    ctermfg=10  cterm=none term=bold 	guifg=#ffff00 	guibg=#0000ff gui=none
hi Search			ctermfg=235 ctermbg=245								guibg=#c0c000
hi IncSearch      	ctermfg=200	ctermbg=245 guifg=#000000 guibg=#FFFFFF
hi CursorLine 	    guibg=#333311 ctermbg=DarkGrey
hi Operator         ctermfg=7   term=none guifg=white
hi Delimiter        ctermfg=250 
hi phpVarSelector   ctermfg=3                guifg=#ffcc00 
hi String           ctermfg=166             cterm=none term=none guifg=#ff6600 gui=none
hi Float            ctermfg=241
hi Number	        ctermfg=244
hi Label	        ctermfg=156
"this
hi SpecialKey      term=bold ctermfg=21
hi NonText         term=bold cterm=bold ctermfg=26
hi ErrorMsg        term=standout cterm=bold ctermfg=7 ctermbg=1
hi MoreMsg         term=bold ctermfg=2
hi ModeMsg         term=bold cterm=bold
hi LineNr          term=underline ctermfg=3
hi Question        term=standout ctermfg=2
"hi StatusLine      term=bold,reverse cterm=bold,reverse
hi StatusLineNC    term=reverse cterm=reverse
hi VertSplit       term=reverse cterm=reverse
hi Title           term=bold ctermfg=5
hi Visual          term=reverse cterm=reverse
hi VisualNOS       term=bold,underline cterm=bold,underline
hi WarningMsg      term=standout ctermfg=1
hi WildMenu        term=standout ctermfg=0 ctermbg=3
hi Folded          term=standout ctermfg=17 ctermbg=244
hi FoldColumn      term=standout ctermfg=21 ctermbg=7
hi DiffAdd         term=bold ctermbg=46
hi DiffChange      term=bold ctermbg=5
hi DiffDelete      term=bold cterm=bold ctermfg=196 ctermbg=6
hi DiffText        term=reverse cterm=bold ctermbg=1
hi Underlined      term=underline cterm=underline ctermfg=5
hi Ignore          cterm=bold ctermfg=7
hi Error           term=reverse cterm=bold ctermfg=7 ctermbg=1
hi bsdFunctions    ctermfg=33 term=none
hi Pmenu           ctermfg=0 ctermbg=179

