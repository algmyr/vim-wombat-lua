hi clear

set background=dark
if exists('syntax on')
    syntax reset
endif

let g:colors_name='wombat_lua'

lua package.loaded.wombat_lua = nil
lua require('wombat_lua')
