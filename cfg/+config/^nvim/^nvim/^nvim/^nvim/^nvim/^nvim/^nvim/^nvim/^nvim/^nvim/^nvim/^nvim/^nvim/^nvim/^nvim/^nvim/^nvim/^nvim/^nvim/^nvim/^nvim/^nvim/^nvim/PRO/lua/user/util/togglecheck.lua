-- Simple function to toggle a checkbox given a visual block.
-- depends on `dkarter/bullets.vim`
-- see also `opdavies/toggle-checkbox.nvim`

local M = {}

M.vtoggle = function()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")

  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  for line = start_line, end_line do
    vim.fn.cursor(line, 1)                -- Move the cursor to the beginning of the line
    vim.cmd('ToggleCheckbox')             -- Toggle the checkbox
  end
end

return M
