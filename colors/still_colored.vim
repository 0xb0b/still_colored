hi clear
if exists("syntax_on")
  syntax reset
endif

let s:is_dark = (&background == 'dark')

let s:almost_black = '#1a1a1a'
let s:darker_gray = '#363330'
let s:gray = '#78716b'
let s:lighter_gray = '#a3a3a3'
let s:almost_white = '#f8f8f8'
" let s:aqua = '#689d6a'
let s:blue = '#283ebc'
let s:faded_blue = '#83a598'
let s:dark_green = '#7d8248'
let s:green = '#9fa65b'
let s:light_green = '#edfbed'
let s:amber = '#ffbf00'
let s:yellow = '#ffc24b'
let s:screaming_red = '#ff3600'
let s:darker_red = '#9e3011'
let s:red = '#cc421b'

let s:none = 'NONE'
let s:inverse = 'inverse'


function! s:hl(group, fg, bg, fx)
  " TODO calculate cterm colors as closest to gui colors
  let chunks = ['hi', a:group, 'guifg=' . a:fg, 'ctermfg=' . s:none,
              \ 'guibg=' . a:bg, 'ctermbg=' . s:none,
              \ 'gui=' . a:fx, 'cterm=' . a:fx]
  execute join(chunks, ' ')
endfunction


if s:is_dark
  call s:hl('Normal', s:lighter_gray, s:almost_black, s:none)
  call s:hl('String', s:green, s:none, s:none)
  call s:hl('Constant', s:red, s:none, s:none)
  call s:hl('Todo', s:almost_white, s:none, s:none)

  call s:hl('NonText', s:darker_gray, s:none, s:none)
else
  call s:hl('Normal', s:almost_black, s:light_green, s:none)
  call s:hl('String', s:blue, s:none, s:none)
  call s:hl('Constant', s:darker_red, s:none, s:none)
  call s:hl('Todo', s:yellow, s:lighter_gray, s:none)

  call s:hl('NonText', s:lighter_gray, s:none, s:none)
endif
  call s:hl('Comment', s:gray, s:none, s:none)
  call s:hl('Error', s:screaming_red, s:none, s:none)
  call s:hl('Macro', s:faded_blue, s:none, s:none)
  call s:hl('Visual', s:none, s:none, s:inverse)

  call s:hl('Search', s:amber, s:darker_gray, s:none)
  call s:hl('IncSearch', s:amber, s:none, s:inverse)

  call s:hl('WarningMsg', s:yellow, s:none, s:none)

  call s:hl('LineNr', s:gray, s:none, s:none)
  call s:hl('CursorLineNr', s:almost_white, s:darker_gray, s:none)

  call s:hl('Cursor', s:none, s:none, s:inverse)
  call s:hl('CursorLine', s:none, s:none, s:none)

  call s:hl('ColorColumn', s:none, s:darker_gray, s:none)


  call s:hl('VertSplit', s:none, s:none, s:none)
  call s:hl('StatusLine', s:lighter_gray, s:darker_gray, s:none)
  call s:hl('StatusLineNC', s:gray, s:darker_gray, s:none)

  " Popup menu: normal item
  call s:hl('Pmenu', s:none, s:darker_gray, s:none)
  " Popup menu: selected item
  call s:hl('PmenuSel', s:almost_white, s:none, s:none)
  " Popup menu: scrollbar
  call s:hl('PmenuSbar', s:none, s:darker_gray, s:none)
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

hi! link MatchParen Search

hi! link Special Normal
hi! link VisualNOS Visual

hi! link ErrorMsg Error
hi! link NvimInternalError Error

hi! link SpecialKey NonText

" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

hi! link CursorColumn CursorLine

hi! link Directory Macro

" 'Press enter' prompt and yes/no questions
hi! link Question Normal

