-- conf/terminal

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
  vim.cmd('tabnew')              -- Open a new tab
  vim.bo.bufhidden = 'wipe'      -- Clear prior state
  vim.wo.winfixwidth = true      -- Set fixwidth
  vim.wo.winfixheight = true     -- Set fixheight
  vim.cmd('wincmd o')            -- Set buffer to full width

  vim.fn.termopen('lazygit', {                  -- Open terminal and run lazygit
    on_exit = function(_, _, _)                 -- Define exit handler
      local events = require("neo-tree.events") -- Reset git/neo-tree
      events.fire_event(events.GIT_EVENT)       -- Reset git/neo-tree
      vim.cmd('tabclose')                       -- Close the terminal tab
    end
  })

  vim.api.nvim_win_set_width(0, vim.o.columns)            -- Set full-width
  vim.api.nvim_win_set_height(0, vim.o.lines - 1)         -- Set full-height
  vim.api.nvim_win_set_option(0, 'number', false)         -- Remove line numbers
  vim.api.nvim_win_set_option(0, 'relativenumber', false) -- Remove line numbers
  vim.api.nvim_win_set_option(0, 'signcolumn', 'no')      -- Remove signcolumn
  vim.cmd('startinsert')                                  -- Switch to insert mode
end, {})

