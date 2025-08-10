vim.opt.background = 'dark'
vim.g.colors_name = 'wombat_lua'

package.loaded['wombat_lua.wombat_template'] = nil

require('lush')(require('wombat_lua.wombat'))
