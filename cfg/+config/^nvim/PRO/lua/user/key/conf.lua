-- key/map_base
--
-- https://github.com/folke/which-key.nvim
-- :checkhealth which-key
-- :h which-key

WhichKeyOk, WhichKey = pcall(require, "which-key")
if not WhichKeyOk then return end

vim.keymap.del('n', 'yss')
vim.keymap.del('n', 'ySs')
vim.keymap.del('n', 'ySS')
vim.keymap.del('n', 'm?')
vim.keymap.del('n', 'm<BS>')
vim.keymap.del('n', 'm/')
vim.keymap.del('n', 'm.')
vim.keymap.del('n', 'm,')
vim.keymap.del('n', 'm-')
vim.keymap.del('n', 'm<Space>')
-- vim.keymap.del('n', '<Space><Space>b3')

local setup = {
  plugins = {
    marks     = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling  = {
      enabled     = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20,   -- how many suggestions should be shown in the list?
    },
    presets = {             -- adds help for a bunch of default keybindings in Neovim. No actual key bindings are created.
      operators    = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions      = true,  -- adds help for motions
      text_objects = true,  -- help for text objects triggered after entering an operator
      windows      = true,  -- default bindings on <c-w>
      nav          = true,  -- misc bindings to work with windows
      z            = true,  -- bindings for folds, spelling and others prefixed with z
      g            = true,  -- bindings for prefixed with g
    },
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator  = "➜", -- symbol used between a key and it's label
    group      = "+", -- symbol prepended to a group
  },
  delay = 500,        -- delay to generate popup
}

WhichKey.setup(setup)
