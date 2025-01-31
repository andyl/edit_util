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

Timestamp = function()
  return os.date("%Y-%m-%d_%H:%M:%S")
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

WriteLog("Starting Neovim at " .. Timestamp())

-- local testtable = {
--   name = "Neovim",
--   version = 0.5,
--   features = {
--     "LSP",
--     "Treesitter",
--     "Fuzzy Finder",
--     {
--       key = "value",
--       another_key = {
--         "nested",
--         "table"
--       }
--     }
--   }
-- }
--
-- AppendLog("Test table: " .. ToString(testtable))

