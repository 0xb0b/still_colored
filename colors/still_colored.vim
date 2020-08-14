hi clear
if exists("syntax_on")
  syntax reset
endif

let s:is_dark = (&background == 'dark')

let s:almostblack = '#1a1a1a'
let s:darkergray = '#363330'
let s:gray = '#78716b'
let s:lightergray = '#a3a3a3'
let s:almostwhite = '#f8f8f8'
let s:fadedblue = '#83a598'
let s:green = '#9fa65b'
let s:amber = '#ffbf00'
let s:yellow = '#ffc24b'
let s:screaminred = '#ff3600'
let s:red = '#cc421b'

" emacs colors
" http://www.raebear.net/computers/emacs-colors/
" as seen on yt in Xah Lee videos
" https://www.youtube.com/channel/UCXEJNKH9I4xsoyUNN3IL96A
let s:honeydew = '#f0fbed'
let s:honeydew3 = '#c1cdc1'
let s:redmarker = '#E9C2B6'
let s:redmarker2 = '#EF9189'
let s:yellowmarker = '#EFF789'
let s:bluemarker = '#ACDCF4'
let s:darkmarker = '#a4aea4'
let s:firebrick = '#b22222'
let s:violetred = '#8b475d'
let s:purple = '#a020f0'
let s:blue = '#0000ff'
let s:forestgreen = '#228b22'
let s:darkcyan = '#008b8b'
" let s:darkslateblue = '#483d8b'
" let s:seagreen = '#2e8b57'
" let s:chartreuse = '#458b00'

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
  call s:hl('Normal', s:lightergray, s:almostblack, s:none)
  call s:hl('Comment', s:gray, s:none, s:none)
  call s:hl('String', s:green, s:none, s:none)
  call s:hl('Constant', s:red, s:none, s:none)
  call s:hl('Todo', s:almostwhite, s:none, s:none)
  call s:hl('Macro', s:fadedblue, s:none, s:none)

  call s:hl('Search', s:amber, s:darkergray, s:none)
  call s:hl('IncSearch', s:amber, s:none, s:inverse)

  call s:hl('Visual', s:none, s:none, s:inverse)

  call s:hl('Error', s:screaminred, s:none, s:none)
  call s:hl('WarningMsg', s:yellow, s:none, s:none)

  call s:hl('NonText', s:darkergray, s:none, s:none)

  call s:hl('CursorLineNr', s:almostwhite, s:darkergray, s:none)

  call s:hl('StatusLine', s:lightergray, s:darkergray, s:none)
  call s:hl('StatusLineNC', s:gray, s:darkergray, s:none)

  call s:hl('ColorColumn', s:none, s:darkergray, s:none)

  " Popup menu: normal item
  call s:hl('Pmenu', s:none, s:darkergray, s:none)
  " Popup menu: selected item
  call s:hl('PmenuSel', s:almostwhite, s:none, s:none)
  " Popup menu: scrollbar
  call s:hl('PmenuSbar', s:none, s:darkergray, s:none)
  " Popup menu: scrollbar thumb
  call s:hl('PmenuThumb', s:none, s:almostblack, s:none)
else
  call s:hl('Normal', s:almostblack, s:honeydew, s:none)
  call s:hl('Comment', s:gray, s:none, s:none)
  call s:hl('String', s:forestgreen, s:none, s:none)
  call s:hl('Constant', s:firebrick, s:none, s:none)
  call s:hl('Todo', s:gray, s:yellowmarker, s:none)
  call s:hl('Macro', s:darkcyan, s:none, s:none)

  call s:hl('Search', s:none, s:redmarker, s:none)
  call s:hl('IncSearch', s:honeydew, s:almostblack, s:none)

  call s:hl('Visual', s:none, s:bluemarker, s:none)

  call s:hl('NonText', s:violetred, s:none, s:none)

  call s:hl('Error', s:none, s:redmarker2, s:none)
  call s:hl('WarningMsg', s:none, s:yellowmarker, s:none)

  hi! link CursorLineNr Normal

  call s:hl('StatusLine', s:none, s:honeydew3, s:none)
  call s:hl('StatusLineNC', s:gray, s:honeydew3, s:none)

  call s:hl('ColorColumn', s:none, s:honeydew3, s:none)

  " Popup menu: normal item
  call s:hl('Pmenu', s:none, s:honeydew3, s:none)
  " Popup menu: selected item
  " call s:hl('PmenuSel', s:none, s:amber, s:none)
  hi! link PmenuSel WarningMsg
  " Popup menu: scrollbar
  call s:hl('PmenuSbar', s:none, s:honeydew3, s:none)
  " Popup menu: scrollbar thumb
  call s:hl('PmenuThumb', s:none, s:darkmarker, s:none)

  " Titles for output from :set all, :autocmd, etc.
  call s:hl('Title', s:purple, s:none, s:none)
endif

call s:hl('LineNr', s:gray, s:none, s:none)

call s:hl('Cursor', s:none, s:none, s:inverse)
call s:hl('CursorLine', s:none, s:none, s:none)

call s:hl('VertSplit', s:none, s:none, s:none)


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

