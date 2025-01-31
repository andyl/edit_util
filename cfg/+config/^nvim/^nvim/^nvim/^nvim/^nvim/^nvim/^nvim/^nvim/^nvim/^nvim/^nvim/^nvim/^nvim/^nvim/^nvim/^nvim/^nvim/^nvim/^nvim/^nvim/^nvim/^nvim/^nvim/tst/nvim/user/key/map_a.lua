-- key/map_a

-- at = align table
-- usage: vipat
-- ac = align character
-- usage: vipac
-- af = align format
-- usage: vipaf

vim.cmd ":nmap at :EasyAlign *\\|<cr>"
vim.cmd ":vmap at :EasyAlign *\\|<cr>"
vim.cmd ":nmap ac :EasyAlign "
vim.cmd ":vmap ac :EasyAlign "
vim.cmd ":nmap af :MixFormat"

