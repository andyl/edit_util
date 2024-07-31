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
