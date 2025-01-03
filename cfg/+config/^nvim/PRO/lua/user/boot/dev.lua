-- Lua Development Utilities
--
-- require("user.util.dev")
--

-- ----- Writing to a Log File
--
-- local myTable = {
--     name = "John Doe",
--     age = 30,
--     occupation = "Software Developer"
-- }
--
-- Log(myTable)
--
-- Then: `tail -f /tmp/nvim.log`

local log_file = "/tmp/nvim.log"

local function serialize(element)
  return vim.inspect(element)
end

local function appendToFile(filePath, element)
    local string = serialize(element)
    local file = assert(io.open(filePath, "a"), "Could not open file " .. filePath)
    file:write(string .. "\n")
    file:close()
end

function Write(filePath, element)
  appendToFile(filePath, element)
end

function Log(element)
  appendToFile(log_file, element)
end

-- ----- Print / Vim.Inspect
function Pvi(element)
  print(vim.inspect(element))
end

-- ----- Clear Messages
function MessClear()
  vim.cmd('messages clear')
end

-- ----- Reloading Modules
function Load(module)
  package.loaded[module] = nil  -- remove cached module
  _G[module] = nil              -- remove global variables
  require(module)
end

-- ----- OSC52

-- vim.g.clipboard = {
--   name = "OSC52",
--   copy = {
--     ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
--     ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
--   }
-- }
