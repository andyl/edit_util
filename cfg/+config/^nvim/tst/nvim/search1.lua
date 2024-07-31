local M = {}
MessClear()
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local action_state = require('telescope.actions.state')
local actions = require('telescope.actions')

-- Function to escape query strings
local function urlencode(str)
  if (str) then
    str = string.gsub(str, "\n", "\r\n")
    str = string.gsub(str, "([^%w ])", function(c) return string.format("%%%02X", string.byte(c)) end)
    str = string.gsub(str, " ", "+")
  end
  return str
end

-- The main search function
M.search_md = function()
  pickers.new({}, {
    prompt_title = "Search Markdown Files",
    finder = finders.new_dynamic({
      entry_maker = function(section)
        Log("VVVVV")
        local tab = {
          value = section,
          ordinal = section[1],
          display = section[5] .. " " .. section[2] .. " " .. section[3] .. " " .. section[6],
          path = section[4],
          lnum = section[6],
        }
        -- local tab = section[4]
        Log(tab)
        return tab
      end,
      fn = function(prompt)
        if not prompt or prompt == "" then
          return {}
        end

        local url = "http://localhost:5001/search_nvim?query=" .. urlencode(prompt)
        local command = "curl -s '" .. url .. "'"
        local handle = io.popen(command)
        local result = nil
        if handle then
          result = handle:read("*a")
          handle:close()
        else
          print("Failed to run the curl command.")
        end

        -- Parse the JSON result. Assuming the JSON structure is an array of file paths.
        local sections = vim.fn.json_decode(result)
        if not sections then
          return {}
        end

        Log("------------------------------------------------------------")

        local tabres = vim.tbl_map(function(section)
          return section
        end, sections)

        Log(tabres)

        return tabres
      end,
    }),

    sorter = conf.generic_sorter({}),
    previewer = conf.file_previewer({}),
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        print(vim.inspect(selection.path))
        if selection then
          vim.cmd('edit ' .. selection.path)
        end
      end)
      return true
    end,
  }):find()
end

M.search_md()

-- return M
