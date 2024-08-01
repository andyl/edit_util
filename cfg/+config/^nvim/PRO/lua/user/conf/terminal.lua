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

  vim.bo.bufhidden = 'wipe'
  vim.wo.winfixwidth = true
  vim.wo.winfixheight = true

  vim.cmd('wincmd o')               -- Set the buffer to full width
  vim.fn.termopen('lazygit', {      -- Open terminal and run lazygit
    on_exit = function(_, _, _)
      local events = require("neo-tree.events")
      events.fire_event(events.GIT_EVENT)                 -- Reset git/neo-tree
      vim.cmd('tabclose')                                 -- Close the terminal tab
    end
  })

  vim.api.nvim_win_set_width(0, vim.o.columns)            -- Take the full width
  vim.api.nvim_win_set_height(0, vim.o.lines - 1)

  vim.api.nvim_win_set_option(0, 'number', false)         -- Remove line numbers
  vim.api.nvim_win_set_option(0, 'relativenumber', false) -- Remove line numbers
  vim.api.nvim_win_set_option(0, 'signcolumn', 'no')      -- TBD

  vim.cmd('startinsert')                                  -- Switch to insert mode
end, {})

