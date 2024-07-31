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

function LazyGit()
  -- https://github.com/akinsho/toggleterm.nvim?tab=readme-ov-file#custom-terminals
  local opts = {
    cmd           = "lazygit",
    dir           = "git_dir",
    hidden        = true,
    direction     = "tab",
    close_on_exit = true,
    on_exit       = function()
      vim.cmd("echo 'LZG_EXIT'")
      -- https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/1490
      -- require("neo-tree.sources.filesystem.commands").refresh(
      --   require("neo-tree.sources.manager").get_state("filesystem")
      -- )
      -- vim.cmd("tabclose")
    end
  }
  local term = require('toggleterm.terminal').Terminal:new(opts)
  term:toggle()
end

vim.api.nvim_create_autocmd({ "BufLeave" }, {
	pattern = { "*lazygit*" },
	group = vim.api.nvim_create_augroup("git_refresh_neotree", {clear = true}),
	callback = function()
    vim.cmd("echo 'LZG_BUFLEAVE'")
		-- require("neo-tree.sources.filesystem.commands").refresh(
		-- 	require("neo-tree.sources.manager").get_state("filesystem")
		-- )
    -- vim.cmd("tabclose")
    local events = require("neo-tree.events")
    events.fire_event(events.GIT_EVENT)
	end,
})
