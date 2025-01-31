-- Global Utility Functions
--

-- :lua P(table)
P = function(val)
  print(vim.inspect(val))
  return val
end

RELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

--- Write a message to /tmp/nvim.log
-- Uses `file:write` to overwrite previous log contents
-- See also: `AppendLog`, `ToString`, `Timestamp`
-- @param message String message to write.
WriteLog = function(message)
  local log_file = "/tmp/nvim.log"
  local file = io.open(log_file, "w")
  if file then
    file:write(message .. "\n")
    file:close()
  else
    vim.notify("Failed to open log file: " .. log_file, vim.log.levels.ERROR)
  end
end

--- Append a message to /tmp/nvim.log
-- Uses `file:append` to append to the log file
-- See also: `WriteLog`, `ToString`, `Timestamp`
-- @param string message String message to append.
AppendLog =  function(message)
  local log_file = "/tmp/nvim.log"
  local file = io.open(log_file, "a")
  if file then
    file:write(message .. "\n")  -- Write the message with a newline
    file:close()
  else
    vim.notify("Failed to open log file: " .. log_file, vim.log.levels.ERROR)
  end
end

AppendTbl = function(table)
  AppendLog(ToString(table))
end

TblFilter = function(tbl, string)
    local filtered = {}
    for key, value in pairs(tbl) do
        if string.find(key, string, 1, true) then
            filtered[key] = value
        end
    end
    return filtered
end

ToString = function(tbl, indent)
  indent = indent or 0
  local toprint = string.rep(" ", indent) .. "{\n"
  indent = indent + 2
  for k, v in pairs(tbl) do
    toprint = toprint .. string.rep(" ", indent)
    if type(k) == "number" then
      toprint = toprint .. "[" .. k .. "] = "
    elseif type(k) == "string" then
      toprint = toprint .. k .. " = "
    end
    if type(v) == "number" then
      toprint = toprint .. v .. ",\n"
    elseif type(v) == "string" then
      toprint = toprint .. "\"" .. v .. "\",\n"
    elseif type(v) == "table" then
      toprint = toprint .. ToString(v, indent + 2) .. ",\n"
    else
      toprint = toprint .. "\"" .. tostring(v) .. "\",\n"
    end
  end
  toprint = toprint .. string.rep(" ", indent - 2) .. "}"
  return toprint
end

Timestamp = function()
  return os.date("%Y-%m-%d_%H:%M:%S")
end

-- YAML SCHEMA

-- GetSchema = function()
--   local schema = require("yaml-companion").get_buf_schema(0)
--   if schema.result[1].name == "none" then
--     return ""
--   end
--   return schema.result[1].name
-- end

-- LogSchema = function()
--   local schema = require("yaml-companion").get_buf_schema(0)
--   AppendLog(ToString(schema))
-- end
