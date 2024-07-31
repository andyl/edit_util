-- from https://github.com/nvim-telescope/telescope.nvim/blob/master/developers.md

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

-- our picker function: colors
local colors = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "colors",
    finder = finders.new_dynamic {
      fn = function(prompt)
        Log("XXX")
        Log(prompt)
        return {
          { name = "/home/aleak/ttt/a1.txt", color = "#ff0000", startline = 22 },
          { name = "/home/aleak/ttt/b1.txt", color = "#00ff00", startline = 32 },
          { name = "/home/aleak/ttt/z2.txt", color = "#0000ff", startline = 44 },
        }
      end,
      entry_maker = function(entry)
        Log("YYY")
        Log(entry)
        return {
          value = entry,
          display = entry.name,
          ordinal = entry.startline,
          alt = entry.name .. " 22"
        }
      end
    },
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        Log("ZZZ")
        Log(selection)
        -- vim.api.nvim_put({ selection[1] }, "", false, true)
      end)
      return true
    end,
  }):find()
end

-- to execute the function
colors()
-- colors(require("telescope.themes").get_dropdown {})
