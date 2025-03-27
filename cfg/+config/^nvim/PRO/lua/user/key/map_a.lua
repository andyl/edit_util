-- key/map_a

-- at = align table
-- usage: vipat
-- ad = align dash
-- usage: vipad
-- ac = align character
-- usage: vipac
-- af = align format
-- usage: vipaf

vim.cmd ":nmap at :EasyAlign *\\|<cr>"
vim.cmd ":vmap at :EasyAlign *\\|<cr>"
vim.cmd ":nmap ad :EasyAlign */\\-/<cr>"
vim.cmd ":vmap ad :EasyAlign */\\-/<cr>"
vim.cmd ":nmap ac :EasyAlign "
vim.cmd ":vmap ac :EasyAlign "
vim.cmd ":nmap af :MixFormat"

-- dash alignment isn't working properly
-- don't align on first dash
-- align -> like a single dash
