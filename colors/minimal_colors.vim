set background=dark

hi clear
if exists("syntax_on")
  syntax reset
endif


let s:almost_black = '#1e1e1e'
let s:dark_gray = '#363330'
let s:gray = '#968d84'
let s:light_gray = '#c7c7c7'
let s:almost_white = '#f8f8f8'
" let s:aqua = '#689d6a'
let s:blue = '#83a598'
let s:green = '#b5bd68'
let s:amber = '#ffbf00'
let s:yellow = '#ffc24b'
let s:dark_yellow = '#3d2e12'
let s:red = '#ff3600'

let s:none = 'NONE'
let s:inverse = 'inverse'


function! s:hl(group, fg, bg, fx)
  " TODO calculate cterm colors as closest to gui colors
  let chunks = ['hi', a:group, 'guifg=' . a:fg, 'ctermfg=' . s:none,
              \ 'guibg=' . a:bg, 'ctermbg=' . s:none,
              \ 'gui=' . a:fx, 'cterm=' . a:fx]
  execute join(chunks, ' ')
endfunction


call s:hl('Normal', s:light_gray, s:almost_black, s:none)
call s:hl('Comment', s:gray, s:none, s:none)
call s:hl('Constant', s:amber, s:none, s:none)
call s:hl('String', s:green, s:none, s:none)
call s:hl('Todo', s:almost_white, s:none, s:none)
call s:hl('Error', s:red, s:none, s:none)
call s:hl('Macro', s:blue, s:none, s:none)
call s:hl('Visual', s:none, s:none, s:inverse)

call s:hl('WarningMsg', s:yellow, s:none, s:none)
hi! link ErrorMsg Error

call s:hl('Search', s:amber, s:dark_yellow, s:none)
call s:hl('IncSearch', s:amber, s:none, s:inverse)
hi! link MatchParen Search

call s:hl('LineNr', s:gray, s:none, s:none)
call s:hl('CursorLineNr', s:almost_white, s:dark_gray, s:none)

call s:hl('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

call s:hl('ColorColumn', s:none, s:amber, s:none)


call s:hl('NonText', s:dark_gray, s:none, s:none)
hi! link SpecialKey NonText

call s:hl('VertSplit', s:none, s:none, s:none)
call s:hl('StatusLine', s:almost_white, s:dark_gray, s:none)
call s:hl('StatusLineNC', s:light_gray, s:dark_gray, s:none)

" Popup menu: normal item
call s:hl('Pmenu', s:none, s:dark_gray, s:none)
" Popup menu: selected item
call s:hl('PmenuSel', s:yellow, s:none, s:none)
" Popup menu: scrollbar
call s:hl('PmenuSbar', s:none, s:dark_gray, s:none)
" Popup menu: scrollbar thumb
call s:hl('PmenuThumb', s:none, s:almost_black, s:none)

" Generic statement
hi! link Statement Normal
" if, then, else, endif, swicth, etc.
hi! link Conditional Normal
" for, do, while, etc.
hi! link Repeat Normal
" case, default, etc.
hi! link Label Normal
" try, catch, throw
hi! link Exception Normal
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword Normal

" Variable name
hi! link Identifier Normal
" Function name
hi! link Function Normal

" Generic preprocessor
hi! link PreProc Macro
" Preprocessor #include
hi! link Include Macro
" Preprocessor #define
hi! link Define Macro
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit Macro

" Character constant: 'c', '/n'
hi! link Character String
" Boolean constant: TRUE, false
hi! link Boolean Normal
" Number constant: 234, 0xff
hi! link Number Constant
" Floating point constant: 2.3e10
hi! link Float Constant

" Generic type
hi! link Type Normal
" static, register, volatile, etc
hi! link StorageClass Normal
" struct, union, enum, etc.
hi! link Structure Normal
" typedef
hi! link Typedef Normal

hi! link Special Normal
hi! link VisualNOS Visual

