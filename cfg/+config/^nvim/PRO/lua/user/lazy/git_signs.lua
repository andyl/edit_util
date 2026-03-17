-- git_signs
--
-- Git integration
--
-- https://github.com/lewis6991/gitsigns.nvim

local opts = {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup({
      nav_hunk = { target = 'all' },
    })
  end
}

return opts
