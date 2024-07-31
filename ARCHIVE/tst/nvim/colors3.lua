-- from https://github.com/nvim-telescope/telescope.nvim/blob/master/developers.md

local conf = require('telescope.config').values
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

-- our picker function: colors
local colors = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "files",
    finder = finders.new_dynamic {
      fn = function(prompt)
        Log("AAA")
        Log(prompt)
        return {
          { name = "/home/aleak/ttt/a1.txt", xline = 1 },
          { name = "/home/aleak/ttt/b1.txt", xline = 3 },
          { name = "/home/aleak/ttt/z2.txt", xline = 5 },
        }
      end,
      entry_maker = function(entry)
        Log("BBB")
        Log(entry)
        return {
          value = entry,
          path = entry.name,
          lnum = entry.xline,
          display = entry.xline .. ' ' .. entry.name,
          ordinal = 1
        }
      end
    },
    previewer = conf.file_previewer({}),
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        Log("CCC")
        Log(selection)
        vim.cmd('edit +' .. selection.lnum .. ' ' .. selection.path)
      end)
      return true
    end,
  }):find()
end

colors()

