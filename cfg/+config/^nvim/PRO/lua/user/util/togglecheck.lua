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

  -- toggle each line on its own; nested mode would cascade a parent's toggle
  -- to its children, which then get toggled again by this loop
  local nested = vim.g.bullets_nested_checkboxes
  vim.g.bullets_nested_checkboxes = 0

  for line = start_line, end_line do
    vim.fn.cursor(line, 1)                -- Move the cursor to the beginning of the line
    vim.cmd('ToggleCheckbox')             -- Toggle the checkbox
  end

  vim.g.bullets_nested_checkboxes = nested
end

return M
