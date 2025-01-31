-- Project Navigation Functions
--
-- - change to project root under cursor
-- - project root affects: terminal, telescope, tree
-- - project root appears in `lualine`
--
-- - open file under cursor (`gf` like) in split, vsplit etc.
-- - open file under cursor AND change project root
--
-- - project history (telescope interface / past projects)
--
-- keyboard commandds:
-- ../key/map_g.lua (gpp, gpb, gph, gfv, gfs, ...)
-- ../key/map_leader.lua (,fp - open past projects)
-------------------------------

----- Path Utilities and Filetype Predicates

-- local function log(message)
--
--   local log_file = vim.fn.stdpath('data') .. '/navlog.txt'
--   print(log_file)
--   local file = io.open(log_file, 'a')
--   if file then
--     local timestamp = os.date('%Y-%m-%d %H:%M:%S')
--     local log_entry = string.format("[%s] %s\n", timestamp, message)
--     file:write(log_entry)
--     file:close()
--   else
--     vim.api.nvim_err_writeln("Failed to open the log file for writing")
--   end
-- end

-- handles cases like: [link text](asdf.md)
local function clean_path(str)
  local clean = str:gsub('[%<%>%{%}%(%[%]%)]', ' ')
  local words = {}
  for word in clean:gmatch("[%w_./~]+") do
    words[#words + 1] = word
  end
  return words[#words]
end

local function full_path(path)
  return vim.fn.expand(path)
end

local function home_path(path)
  local comp = full_path(path)
  local home = full_path('$HOME')
  local fini = string.gsub(comp, home, "~")
  return fini
end

local function is_dir(path)
  if string.match(path, "^~") then
    path = full_path(path)
  end

  local stat = vim.loop.fs_stat(path)

  if stat and stat.type == "directory" then
    return true
  else
    return false
  end
end

local function is_file(path)
  if string.match(path, "^~") then
    path = full_path(path)
  end

  local stat = vim.loop.fs_stat(path)

  if stat and stat.type == "file" then
    return true
  else
    return false
  end
end

local function get_directory_path(input_path)
  if is_file(input_path) then
    return vim.fn.fnamemodify(input_path, ':p')
  else
    return input_path
  end
end

----- path and project root lookup

-- return the path under the cursor
local function cursor_path()
  vim.cmd([[normal! yiW]])
  local filepath = vim.fn.getreg('')
  local corepath = clean_path(filepath)

  if filepath then
    return corepath
  else
    return ""
  end
end

-- return the path of the current buffer
local function buffer_path()
  local current_buf = vim.fn.bufnr("%")
  if current_buf ~= 0 then
    return vim.fn.expand('%:p')
  else
    return ""
  end
end

-- search up the directory tree for the project root
local function project_root(input_path)
  -- log("STARTING PROJECT ROOT")

  local matches = { '.git', '.pbase' }
  local home_dir = full_path('$HOME')
  local path = get_directory_path(input_path)

  -- log(home_dir)

  while path ~= home_dir and path ~= '/' and path ~= '.' do
    -- log("PointA |" .. path .. "|" .. home_dir .. "|")
    for _, match in ipairs(matches) do
      local target_path = path .. '/' .. match
      -- log("PointB " .. "|" .. match .. "|" .. target_path .. "|")
      if vim.fn.isdirectory(target_path) == 1 or vim.fn.filereadable(target_path) == 1 then
        -- log("PointC")
        if match == ".pbase" then
          local file = io.open(target_path, "r")
          -- log("PointD")
          if file then
            local newpath = file:read()
            file:close()
            return newpath
          else
            -- log("PointE")
            return ""
          end
        else
          return path
        end
      end
    end
    path = vim.fn.fnamemodify(path, ':h')
  end
  if path == "/" then
    return ""
  end
  return path
end

----- project history

local history_file = full_path("~/.local/share/nvim/projhist.txt")

local function nospace(string)
  string.gsub(string, "%s+", "")
end

local function clear_history_line(lineToRemove)
  local filename = history_file
  local lines = {}
  local found = false
  local expath = full_path(nospace(lineToRemove))

  local file = io.open(filename, "r")

  if not file then
    return
  end

  for line in file:lines() do
    if nospace(line) ~= expath then
      table.insert(lines, line)
    else
      found = true
    end
  end

  file:close()

  if found then
    file = io.open(filename, "w")

    if not file then
      return
    end

    for _, zline in ipairs(lines) do
      file:write(zline .. "\n")
    end

    file:close()
  end
end

local function write_history(path)
  clear_history_line(path)
  local hfile = io.open(history_file, "a")
  if hfile then
    hfile:write(full_path(nospace(path)) .. "\n")
    hfile:close()
  end
end

local function history_to_table()
  local lines = {}
  local file = io.open(history_file, "r")
  if file then
    for line in file:lines() do
      table.insert(lines, 1, line)
    end
    file:close()
    return lines
  else
    return {}
  end
end

----- set working directory and tree root

local function opentree()
  vim.cmd("NvimTreeOpen")
end

local function setwd(path)
  if path ~= "" then
    print("New project root (" .. path .. ")")
    vim.fn.chdir(path)
    require("nvim-tree.api").tree.change_root(path)
    write_history(path)
    opentree()
  end
end

----- open file

local function open_file(filepath, mode)
  local opts = {
    ["f"] = function()
      vim.cmd(":e " .. filepath)
    end,
    ["e"] = function()
      vim.cmd(":e " .. filepath)
    end,
    ["v"] = function()
      vim.cmd(":vsplit " .. filepath)
    end,
    ["s"] = function()
      vim.cmd(":split " .. filepath)
    end,
    ["t"] = function()
      vim.cmd(":tabnew " .. filepath)
    end,
    ["F"] = function()
      vim.cmd(":e " .. filepath)
      setwd(project_root(filepath))
    end,
    ["E"] = function()
      vim.cmd(":e " .. filepath)
      setwd(project_root(filepath))
    end,
    ["V"] = function()
      vim.cmd(":vsplit " .. filepath)
      setwd(project_root(filepath))
    end,
    ["S"] = function()
      vim.cmd(":split " .. filepath)
      setwd(project_root(filepath))
    end,
    ["T"] = function()
      vim.cmd(":tabnew " .. filepath)
      setwd(project_root(filepath))
    end,
  }
  opts[mode]()
end

----- telescope support

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

----- global functions - test with `:lua <function>`

-- display the telescope project picker
function ShowProjectPicker()
  local opts = history_to_table()

  pickers.new(opts, {
    finder = finders.new_table({ results = opts }),
    attach_mappings = function(bufnr, _)
      actions.select_default:replace(function()
        actions.close(bufnr)
        local proj_path = action_state.get_selected_entry()
        setwd(proj_path[1])
      end)
      return true
    end
  }):find()
end

-- open the filepath under the cursor - mode is ['f', 'e', ...]
function OpenCursorPath(mode)
  local path = cursor_path()
  if path == "" then
    print("Error: no filepath under cursor")
  else
    if is_file(path) then
      open_file(path, mode)
      print("")
    else
      print("Error: not a filepath (" .. path .. ")")
    end
  end
end

-- return the project root directory
function ProjRoot()
  local path = buffer_path()
  if path == "" then
    return "---"
  else
    return home_path(project_root(buffer_path()))
  end
end

-- set the working directory to the project root of the current buffer
function SetwdBufferPath()
  local proj_path = home_path(project_root(buffer_path()))
  setwd(proj_path)
end

-- set the working directory to the file or directory path under the cursor
function SetwdCursorPath()
  local path = cursor_path()
  if path == "" then
    print("Error: no path under cursor")
  else
    if is_dir(path) then
      setwd(path)
    else
      local proj_path = project_root(path)
      setwd(proj_path)
    end
  end
end

