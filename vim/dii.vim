" Vim syntax file
" Language:	Load File Protocol (.dii) for Ipro, kCura Relativity, etc
" Version Info: @(#)dii.vim 0.1 2012/07/28 10:41:42
" Author:       Noah Birnel <nbirnel@teris.com>
" Maintainer:   Noah Birnel <nbirnel@teris.com>
" Version Info: Sat, 28 Jul 2012 10:41:42 +1000

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" shut case off
syntax case ignore

"syntax keyword diiFunction im vn io is bf in lc of oi ot rS rt sr vf rp br ck da dt fn ft ia rr
syntax match diiRecordNum /^;\s\s*Record\s\s*[0-9][0-9]*/
hi default diiRecordNum ctermfg=DarkBlue guifg=white guibg=DarkBlue 
" syntax match diiField /[^,;]\+/
syntax match diiDelimiter /[,;]/

" syn region done start=/\*\*DONE/ end=/\*\*/ 

syn match diiIM /^im/
hi default  diiIM ctermfg=LightBlue guifg=white guibg=LightBlue

syn match diiVN /^vn/
hi default diiVN ctermfg=DarkRed guifg=white guibg=DarkRed 

syn match diiBF /^bf/
hi default diiBF ctermfg=DarkGreen guifg=white guibg=DarkGreen 

syn match diiBM /^bm/ 
hi default diiBM ctermfg=DarkGreen guifg=White guibg=DarkGreen

syn match diiIN /^in/
hi default diiIN ctermfg=DarkBlue guifg=white guibg=DarkBlue 

syn match diiLC /^lc/
hi default diiLC ctermfg=LightBlue guifg=white guibg=LightBlue 

syn match diiIA /^ia/
hi default diiIA ctermfg=LightYellow guifg=white guibg=LightYellow 

syn match diiIO /^io/
hi default diiIO ctermfg=LightYellow guifg=white guibg=LightYellow 

syn match diiIS /^is/
hi default diiIS ctermfg=LightYellow guifg=white guibg=LightYellow 

syn match diiOF /^of/
hi default diiOF ctermfg=DarkYellow guifg=white guibg=DarkYellow 

syn match diiOI /^oi/
hi default diiOI ctermfg=Brown guifg=white guibg=Brown 

syn match diiOT /^ot/
hi default diiOT ctermfg=DarkGreen guifg=white guibg=DarkGreen 

syn match diiRS /^rs/
hi default diiRS ctermfg=Magenta guifg=white guibg=Magenta 

syn match diiRT /^rt/
hi default diiRT ctermfg=LightRed guifg=white guibg=LightRed 

syn match diiSR /^sr/
hi default diiSR ctermfg=DarkGray guifg=white guibg=DarkGray 

syn match diiVF /^vf/
hi default diiVF ctermfg=DarkCyan guifg=white guibg=DarkCyan 

syn match diiRP /^rp/
hi default diiRP ctermfg=Cyan guifg=white guibg=Cyan 

syn match diiBR /^br/
hi default diiBR ctermfg=Black guifg=white guibg=Black 

syn match diiCK /^ck/
hi default diiCK ctermfg=DarkGreen guifg=white guibg=DarkGreen 

syn match diiDA /^da/
hi default diiDA ctermfg=LightMagenta guifg=white guibg=LightMagenta 

syn match diiDT /^dt/
hi default diiDT ctermfg=DarkMagenta guifg=white guibg=DarkMagenta 

syn match diiFN /^fn/
hi default diiFN ctermfg=LightGray guifg=white guibg=LightGray 

syn match diiFT /^ft/
hi default diiFT ctermfg=DarkGreen guifg=white guibg=DarkGreen 

syn match diiRR /^rr.*/
hi default diiRR ctermfg=DarkRed guifg=white guibg=DarkRed 

"syn match diiBreak /[SBFDC]/
"hi default diiBreak ctermfg=LightBlue guifg=white guibg=LightBlue 

syn match diiVolume /@[A-Za-z_0-9]*/
hi default diiVolume ctermfg=DarkBlue guifg=white guibg=DarkBlue 


" hi link tododone tDone
" hi link done tDone

if version >= 508 || !exists("did_halibut_syn_inits")
  if version < 508
    let did_dii_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink diiComment     Comment
  HiLink diiFunction     Function

  HiLink diiDelimiter   Delimiter


  delcommand HiLink
endif

" b: local to current buffer
let b:current_syntax = "dii"
