M = {}

local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local action_state = require('telescope.actions.state')
local actions = require('telescope.actions')

local function urlencode(str)
  if (str) then
    str = string.gsub(str, "\n", "\r\n")
    str = string.gsub(str, "([^%w ])", function(c) return string.format("%%%02X", string.byte(c)) end)
    str = string.gsub(str, " ", "+")
  end
  return str
end

local function rightPad(str, len)
    local char = ' '
    if #str < len then
        return str .. string.rep(char, len - #str)
    else
        return string.sub(str, 1, len)
    end
end

local function displayStr(section)
  local spath   = rightPad(section[5], 25)
  local doct    = rightPad(section[2], 30)
  local sect    = rightPad(section[3], 30)
  local start   = section[6]
  local display = table.concat({spath, doct, sect, start}, " | ")
  return display
end

local function geturl(url)
  local command = "curl -s '" .. url .. "'"
  local handle = io.popen(command)
  local result = nil
  if handle then
    result = handle:read("*a")
    handle:close()
  else
    print("Failed to run the curl command.")
  end

  local sections = vim.fn.json_decode(result)

  return sections
end

M.search_md = function()
  pickers.new({}, {
    prompt_title = "Search Markdown Files",
    finder = finders.new_dynamic({
      entry_maker = function(section)
        local tab = {
          value = section,
          ordinal = 1,
          display = displayStr(section),
          path = section[4],
          lnum = section[6],
        }
        return tab
      end,
      fn = function(prompt)
        if not prompt or prompt == "" then
          return {}
        end

        local url = "http://localhost:5001/search_nvim?query=" .. urlencode(prompt)
        local sections = assert(geturl(url), "Bad url" .. url)
        if not sections then
          return {}
        end

        return sections
      end,
    }),

    previewer = conf.grep_previewer({}),
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        print(vim.inspect(selection.path))
        if selection then
          vim.cmd('edit +' .. selection.lnum .. ' ' .. selection.path)
        end
      end)
      return true
    end,
  }):find()
end

return M
