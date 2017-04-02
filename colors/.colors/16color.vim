" =============================================================================
" Filename: autoload/lightline/colorscheme/16color.vim
" Version: 0.0
" Author: itchyny
" License: MIT License
" Last Change: 2014/01/02 10:04:03.
" =============================================================================
let s:base02 = [ '#000000', 0 ]  " yellow
let s:red = [ '#800000', 1 ]     " dark red
let s:green = [ '#008000', 2 ]   " dark green
let s:yellow = [ '#808000', 3 ]  " dark yellow
let s:blue = [ '#000080', 4 ]    " dark blue
let s:magenta = [ '#800080', 5 ] " dark magenta
let s:cyan = [ '#008080', 6 ]    " dark cyan
let s:base2 = [ '#c0c0c0', 7 ]   " black
let s:base03 = [ '#808080', 8 ]  " white
let s:orange = [ '#ff0000', 9 ]  " light red
let s:base01 = [ '#00ff00', 10 ] " light cyan
let s:base00 = [ '#ffff00', 11 ] " light blue
let s:base0 = [ '#0000ff', 12 ]  " white
let s:violet = [ '#ff00ff', 13 ] " gray
let s:base1 = [ '#00ffff', 14 ]  " light green
let s:base3 = [ '#ffffff', 15 ]  " light magenta
if &background ==# 'light'
  let [s:base03, s:base3] = [s:base3, s:base03]
  let [s:base02, s:base2] = [s:base2, s:base02]
  let [s:base01, s:base1] = [s:base1, s:base01]
  let [s:base00, s:base0] = [s:base0, s:base00]
endif
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base02, s:blue ], [ s:base2, s:cyan ] ]
let s:p.normal.right = [ [ s:base2, s:base0 ], [ s:base2, s:cyan ] ]
let s:p.inactive.right = [ [ s:blue, s:base01 ], [ s:yellow, s:blue ] ]
let s:p.inactive.left =  [ [ s:base0, s:magenta ], [ s:base00, s:base02 ] ]
let s:p.insert.left = [ [ s:base3, s:green ], [ s:magenta, s:base01 ] ]
let s:p.replace.left = [ [ s:magenta, s:yellow ], [ s:magenta, s:base01 ] ]
let s:p.visual.left = [ [ s:magenta, s:orange ], [ s:magenta, s:base01 ] ]
let s:p.normal.middle = [ [ s:base02, s:base2 ] ]
let s:p.inactive.middle = [ [ s:base0, s:base02 ] ]
let s:p.tabline.left = [ [ s:base2, s:base01 ] ]
let s:p.tabline.tabsel = [ [ s:base2, s:base02 ] ]
let s:p.tabline.middle = [ [ s:base01, s:base2 ] ]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:base2, s:red ] ]
let s:p.normal.warning = [ [ s:base02, s:yellow ] ]

let g:lightline#colorscheme#16color#palette = lightline#colorscheme#flatten(s:p)
