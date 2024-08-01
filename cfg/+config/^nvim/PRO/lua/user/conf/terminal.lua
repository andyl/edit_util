-- term/base

vim.cmd [[

" terminal auto init with insert mode
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave             term://* stopinsert

" turn off line numbers in terminal mode
augroup TerminalStuff
  au!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

]]

function TermCmd(command)
  local opts = {
    cmd = command,
    hidden = true,
    dir = "git_dir",
    direction = "tab",
  }
  local term = require('toggleterm.terminal').Terminal:new(opts)
  term:toggle()
end

-- Lazygit Command

vim.api.nvim_create_user_command('LazyGit', function()
  vim.cmd('tabnew')                 -- Open a new tab
  vim.cmd('wincmd o')               -- Set the buffer to full width
  vim.fn.termopen('lazygit', {      -- Open terminal and run lazygit
    on_exit = function(_, _, _)
      local events = require("neo-tree.events")
      events.fire_event(events.GIT_EVENT)
      vim.cmd('tabclose')           -- Close the tab when lazygit exits
      vim.cmd("echo 'bye'")
    end
  })

  vim.api.nvim_win_set_width(0, vim.o.columns)            -- Take the full width
  vim.api.nvim_win_set_option(0, 'number', false)         -- Remove line numbers
  vim.api.nvim_win_set_option(0, 'relativenumber', false) -- Remove line numbers
  vim.cmd('startinsert')                                  -- Switch to insert mode
end, {})

-- vim.api.nvim_create_autocmd({ "BufLeave" }, {
-- 	group    = vim.api.nvim_create_augroup("git_refresh_neotree", {clear = true}),
-- 	pattern  = { "*lazygit*" },
-- 	callback = function()
--     vim.cmd("echo 'LEAVE'")
--     -- https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/1253#discussioncomment-9971975
--     local events = require("neo-tree.events")
--     events.fire_event(events.GIT_EVENT)
-- 	end,
-- })

