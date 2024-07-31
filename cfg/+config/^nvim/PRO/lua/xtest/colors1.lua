-- from https://github.com/nvim-telescope/telescope.nvim/blob/master/developers.md

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values

local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

-- our picker function: colors
local colors = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "colors",
    finder = finders.new_table {
      results = {
        { name = "red",   color = "#ff0000", startline = 22 },
        { name = "green", color = "#00ff00", startline = 32 },
        { name = "blue",  color = "#0000ff", startline = 44 },
      },

      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.color,
          ordinal = entry.startline,
          alt = entry.name .. " 22"
        }
      end
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.api.nvim_put({ selection[1] }, "", false, true)
      end)
      return true
    end,
  }):find()
end

-- to execute the function
-- colors()
colors(require("telescope.themes").get_dropdown {})
