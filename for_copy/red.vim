set background=dark
source $VIMRUNTIME/colors/vim.lua 
let g:colors_name = 'blood_black'
let s:t_Co = &t_Co
if (has('termguicolors') && &termguicolors) || has('gui_running')
  let g:terminal_ansi_colors = ['#000000', '#cd0000', '#00cd00', '#cdcd00', '#0000ee', '#cd00cd', '#00cdcd', '#e5e5e5', '#7f7f7f', '#ff0000', '#00ff00', '#ffff00', '#5c5cff', '#ff00ff', '#00ffff', '#ffffff']
  " Nvim uses g:terminal_color_{0-15} instead
  for i in range(g:terminal_ansi_colors->len())
    let g:terminal_color_{i} = g:terminal_ansi_colors[i]
  endfor
endif

hi Normal guifg=#ff0000 guibg=#000000 gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#200000 gui=NONE cterm=NONE
hi Pmenu guifg=#ffffff guibg=#400000 gui=NONE cterm=NONE
hi PmenuSel guifg=#400000 guibg=#ffffff gui=NONE cterm=NONE
hi PmenuMatch guifg=#ff0000 guibg=#400000 gui=NONE cterm=NONE
hi PmenuMatchSel guifg=#ff0000 guibg=#ffffff gui=NONE cterm=NONE
hi QuickFixLine guifg=#000000 guibg=#ff0000 gui=NONE cterm=NONE
hi ColorColumn guifg=NONE guibg=#300000 gui=NONE cterm=NONE
hi Conceal guifg=#600000 guibg=NONE gui=NONE cterm=NONE
hi Cursor guifg=#000000 guibg=#ff0000 gui=NONE cterm=NONE
hi CursorColumn guifg=NONE guibg=#200000 gui=NONE cterm=NONE
hi CursorIM guifg=#000000 guibg=#ff0000 gui=NONE cterm=NONE
hi CursorLineNr guifg=#ff0000 guibg=#200000 gui=bold cterm=NONE
hi EndOfBuffer guifg=#600000 guibg=#000000 gui=NONE cterm=NONE
hi Error guifg=#00ff00 guibg=#000000 gui=reverse cterm=reverse
hi ErrorMsg guifg=#00ff00 guibg=#000000 gui=NONE cterm=NONE
hi FoldColumn guifg=#600000 guibg=NONE gui=NONE cterm=NONE
hi Folded guifg=#ff0000 guibg=#300000 gui=NONE cterm=NONE
hi IncSearch guifg=#ff0000 guibg=#000000 gui=standout cterm=reverse
hi LineNr guifg=#800000 guibg=NONE gui=NONE cterm=NONE
hi MatchParen guifg=#ff8080 guibg=NONE gui=italic cterm=NONE
hi ModeMsg guifg=#ff0000 guibg=#000000 gui=NONE cterm=NONE
hi MoreMsg guifg=#ff0000 guibg=NONE gui=NONE cterm=NONE
hi NonText guifg=#600000 guibg=NONE gui=NONE cterm=NONE
hi PmenuSbar guifg=NONE guibg=#400000 gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE guibg=#800000 gui=NONE cterm=NONE
hi Question guifg=#ff0000 guibg=NONE gui=NONE cterm=NONE
hi Search guifg=#ff0000 guibg=#000000 gui=reverse cterm=reverse
hi SignColumn guifg=#600000 guibg=NONE gui=NONE cterm=NONE
hi SpecialKey guifg=#800000 guibg=NONE gui=NONE cterm=NONE
hi SpellBad guifg=#ff0000 guibg=NONE guisp=#ff0000 gui=undercurl cterm=underline
hi SpellCap guifg=#ff0000 guibg=NONE guisp=#ff0000 gui=undercurl cterm=underline
hi SpellLocal guifg=#ff0000 guibg=NONE guisp=#ff0000 gui=undercurl cterm=underline
hi SpellRare guifg=#ff0000 guibg=NONE guisp=#ff0000 gui=undercurl cterm=underline
hi StatusLine guifg=#ff0000 guibg=NONE gui=NONE cterm=NONE
hi StatusLineNC guifg=#ff0000 guibg=#800000 gui=NONE cterm=NONE
hi ToolbarButton guifg=#ffffff guibg=#600000 gui=NONE cterm=NONE
hi ToolbarLine guifg=NONE guibg=#400000 gui=NONE cterm=NONE
hi VertSplit guifg=#600000 guibg=NONE gui=NONE cterm=NONE
hi Visual guifg=#ff0000 guibg=#800000 gui=NONE cterm=NONE
hi VisualNOS guifg=#800000 guibg=NONE gui=NONE cterm=NONE
hi WarningMsg guifg=#00a000 guibg=NONE gui=NONE cterm=NONE
hi WildMenu guifg=#ff0000 guibg=NONE gui=NONE cterm=NONE
hi debugBreakpoint guifg=#ff0000 guibg=#000000 gui=reverse cterm=reverse
hi debugPC guifg=#ff0000 guibg=#000000 gui=reverse cterm=reverse
hi Directory guifg=#ff0000 guibg=NONE gui=NONE cterm=NONE
hi Title guifg=#ff0000 guibg=NONE gui=NONE cterm=NONE

hi Comment guifg=#800000 guibg=NONE gui=NONE cterm=NONE
hi Constant guifg=#ff5000 guibg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#ff0050 guibg=NONE gui=italic cterm=NONE
hi Ignore guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi PreProc guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi Special guifg=#ff00f0 guibg=NONE gui=NONE cterm=NONE
hi Statement guifg=#ff0050 guibg=NONE gui=italic cterm=NONE
hi Todo guifg=#0000ff guibg=NONE gui=NONE cterm=NONE
hi Type guifg=#ff0080 guibg=NONE gui=NONE cterm=NONE
hi Underlined guifg=#ffffff guibg=NONE gui=NONE
hi Label guifg=#ffffff guibg=NONE gui=NONE cterm=NONE

hi! link Terminal Normal
hi! link PopupSelected PmenuSel
hi! link Debug Special
hi! link Added String
hi! link Removed WarningMsg
hi! link diffOnly WarningMsg
hi! link diffNoEOL WarningMsg
hi! link diffIsA WarningMsg
hi! link diffIdentical WarningMsg
hi! link diffDiffer WarningMsg
hi! link diffCommon WarningMsg
hi! link diffBDiffer WarningMsg
hi! link lCursor Cursor
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link CurSearch Search
hi! link CursorLineNr CursorLine
hi! link CursorLineFold CursorLine
hi! link CursorLineSign CursorLine
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link TabLine StatusLineNC
hi! link TabLineFill StatusLineNC
hi! link TabLineSel StatusLine
hi! link Boolean Constant
hi! link Character Constant
hi! link Conditional Statement
hi! link Define PreProc
hi! link Delimiter Special
hi! link Exception Statement
hi! link Float Constant
hi! link Function Identifier
hi! link Include PreProc
hi! link Keyword Statement
hi! link Macro PreProc
hi! link Number Constant
hi! link Operator Type
hi! link PreCondit PreProc
hi! link Repeat Statement
hi! link SpecialChar Special
hi! link SpecialComment Special
hi! link StorageClass Type
hi! link String Constant
hi! link Structure Type
hi! link Tag Special
hi! link Typedef Type
hi! link MessageWindow Pmenu
hi! link PopupNotification Todo

hi DiffAdd guifg=#00ff00 guibg=NONE gui=NONE cterm=NONE
hi DiffChange guifg=#ffff guibg=NONE gui=NONE cterm=NONE
hi DiffText guifg=#ff0000 guibg=NONE gui=NONE cterm=NONE
hi DiffDelete guifg=#ff00ff guibg=NONE gui=NONE cterm=NONE

if s:t_Co >= 256
  hi Normal ctermfg=196 ctermbg=16 cterm=NONE
  hi CursorLine ctermfg=NONE ctermbg=52 cterm=NONE
  hi Pmenu ctermfg=231 ctermbg=52 cterm=NONE
  hi PmenuSel ctermfg=52 ctermbg=231 cterm=NONE
  hi PmenuMatch ctermfg=196 ctermbg=52 cterm=NONE
  hi PmenuMatchSel ctermfg=196 ctermbg=231 cterm=NONE
  hi QuickFixLine ctermfg=16 ctermbg=196 cterm=NONE
  hi ColorColumn ctermfg=NONE ctermbg=52 cterm=NONE
  hi Conceal ctermfg=88 ctermbg=NONE cterm=NONE
  hi Cursor ctermfg=16 ctermbg=196 cterm=NONE
  hi CursorColumn ctermfg=NONE ctermbg=52 cterm=NONE
  hi CursorIM ctermfg=16 ctermbg=196 cterm=NONE
  hi CursorLineNr ctermfg=196 ctermbg=52 cterm=NONE
  hi EndOfBuffer ctermfg=88 ctermbg=16 cterm=NONE
  hi Error ctermfg=196 ctermbg=16 cterm=reverse
  hi ErrorMsg ctermfg=231 ctermbg=88 cterm=NONE
  hi FoldColumn ctermfg=88 ctermbg=NONE cterm=NONE
  hi Folded ctermfg=196 ctermbg=52 cterm=NONE
  hi IncSearch ctermfg=196 ctermbg=16 cterm=reverse
  hi LineNr ctermfg=88 ctermbg=NONE cterm=NONE
  hi MatchParen ctermfg=NONE ctermbg=NONE cterm=reverse
  hi ModeMsg ctermfg=16 ctermbg=196 cterm=NONE
  hi MoreMsg ctermfg=196 ctermbg=NONE cterm=NONE
  hi NonText ctermfg=88 ctermbg=NONE cterm=NONE
  hi PmenuSbar ctermfg=NONE ctermbg=52 cterm=NONE
  hi PmenuThumb ctermfg=NONE ctermbg=88 cterm=NONE
  hi Question ctermfg=196 ctermbg=NONE cterm=NONE
  hi Search ctermfg=196 ctermbg=16 cterm=reverse
  hi SignColumn ctermfg=88 ctermbg=NONE cterm=NONE
  hi SpecialKey ctermfg=88 ctermbg=NONE cterm=NONE
  hi SpellBad ctermfg=196 ctermbg=NONE cterm=underline
  hi SpellCap ctermfg=196 ctermbg=NONE cterm=underline
  hi SpellLocal ctermfg=196 ctermbg=NONE cterm=underline
  hi SpellRare ctermfg=196 ctermbg=NONE cterm=underline
  hi StatusLine ctermfg=16 ctermbg=196 cterm=NONE
  hi StatusLineNC ctermfg=16 ctermbg=88 cterm=NONE
  hi ToolbarButton ctermfg=231 ctermbg=88 cterm=NONE
  hi ToolbarLine ctermfg=NONE ctermbg=52 cterm=NONE
  hi VertSplit ctermfg=88 ctermbg=NONE cterm=NONE
  hi Visual ctermfg=231 ctermbg=88 cterm=NONE
  hi VisualNOS ctermfg=88 ctermbg=231 cterm=NONE
  hi WarningMsg ctermfg=196 ctermbg=NONE cterm=NONE
  hi WildMenu ctermfg=16 ctermbg=196 cterm=NONE
  hi debugBreakpoint ctermfg=196 ctermbg=16 cterm=reverse
  hi debugPC ctermfg=196 ctermbg=16 cterm=reverse
  hi Directory ctermfg=196 ctermbg=NONE cterm=NONE
  hi Title ctermfg=196 ctermbg=NONE cterm=NONE
  hi Comment ctermfg=88 ctermbg=NONE cterm=NONE
  hi Constant ctermfg=196 ctermbg=NONE cterm=NONE
  hi Identifier ctermfg=196 ctermbg=NONE cterm=NONE
  hi Ignore ctermfg=88 ctermbg=NONE cterm=NONE
  hi PreProc ctermfg=196 ctermbg=NONE cterm=NONE
  hi Special ctermfg=196 ctermbg=NONE cterm=NONE
  hi Statement ctermfg=196 ctermbg=NONE cterm=NONE
  hi Todo ctermfg=196 ctermbg=16 cterm=reverse
  hi Type ctermfg=196 ctermbg=NONE cterm=NONE
  hi Underlined ctermfg=196 ctermbg=NONE cterm=underline
  hi Label ctermfg=196 ctermbg=NONE cterm=NONE
  hi! link Terminal Normal
  hi! link PopupSelected PmenuSel
  hi! link Debug Special
  hi! link Added String
  hi! link Removed WarningMsg
  hi! link diffOnly WarningMsg
  hi! link diffNoEOL WarningMsg
  hi! link diffIsA WarningMsg
  hi! link diffIdentical WarningMsg
  hi! link diffDiffer WarningMsg
  hi! link diffCommon WarningMsg
  hi! link diffBDiffer WarningMsg
  hi! link lCursor Cursor
  hi! link LineNrAbove LineNr
  hi! link LineNrBelow LineNr
  hi! link CurSearch Search
  hi! link CursorLineNr CursorLine
  hi! link CursorLineFold CursorLine
  hi! link CursorLineSign CursorLine
  hi! link StatusLineTerm StatusLine
  hi! link StatusLineTermNC StatusLineNC
  hi! link TabLine StatusLineNC
  hi! link TabLineFill StatusLineNC
  hi! link TabLineSel StatusLine
  hi! link Boolean Constant
  hi! link Character Constant
  hi! link Conditional Statement
  hi! link Define PreProc
  hi! link Delimiter Special
  hi! link Exception Statement
  hi! link Float Constant
  hi! link Function Identifier
  hi! link Include PreProc
  hi! link Keyword Statement
  hi! link Macro PreProc
  hi! link Number Constant
  hi! link Operator Type
  hi! link PreCondit PreProc
  hi! link Repeat Statement
  hi! link SpecialChar Special
  hi! link SpecialComment Special
  hi! link StorageClass Type
  hi! link String Constant
  hi! link Structure Type
  hi! link Tag Special
  hi! link Typedef Type
  hi! link Terminal Normal
  hi! link MessageWindow Pmenu
  hi! link PopupNotification Todo
  hi DiffAdd ctermfg=231 ctermbg=52 cterm=NONE
  hi DiffChange ctermfg=231 ctermbg=88 cterm=NONE
  hi DiffText ctermfg=16 ctermbg=196 cterm=NONE
  hi DiffDelete ctermfg=231 ctermbg=88 cterm=NONE
  unlet s:t_Co
  finish
endif