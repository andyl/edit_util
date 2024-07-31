local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values

-- local history_file = vim.fn.expand("~/.local/share/nvim/projhist.txt")

local history_file = vim.fn.expand("~/proj.txt")

local function read_lines_to_table()
  local lines = {}
  local file = io.open(history_file, "r")
  if file then
    for line in file:lines() do
      table.insert(lines, line)
    end
    file:close()
    return lines
  else
    return {}
  end
end

function ShowProjectPicker()
    local opts = read_lines_to_table()

    pickers.new(opts, {
        finder = finders.new_table({results = opts}),
        sorter = conf.generic_sorter({}),
    }):find()
end

