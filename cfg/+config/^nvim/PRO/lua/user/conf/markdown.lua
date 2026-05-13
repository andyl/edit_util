-- Markdown Utility

local function warn(msg)
  vim.notify(msg, vim.log.levels.WARN, { title = "ObsidianOpen" })
end

local function is_ssh()
  return (vim.env.SSH_CONNECTION or vim.env.SSH_CLIENT) ~= nil
end

local function has_gui()
  return (vim.env.DISPLAY or vim.env.WAYLAND_DISPLAY) ~= nil
end

local function obsidian_running()
  local out = vim.fn.system({ "pgrep", "-x", "obsidian" })
  return vim.v.shell_error == 0 and out ~= ""
end

local function start_obsidian()
  vim.fn.jobstart({ "sh", "-c", "obsidian --no-sandbox &" }, { detach = true })
end

local function url_encode(str)
  return (str:gsub("([^%w%-_%.~/])", function(c)
    return string.format("%%%02X", string.byte(c))
  end))
end

local function obsidian_open()
  local file = vim.api.nvim_buf_get_name(0)
  if file == "" then
    warn("No file in current buffer")
    return
  end

  local ext = file:match("%.([^%.]+)$")
  if ext ~= "md" and ext ~= "base" then
    warn("Not a markdown or base file")
    return
  end

  if is_ssh() then
    warn("Cannot launch Obsidian over SSH")
    return
  end

  if not has_gui() then
    warn("No GUI display available")
    return
  end

  local home = vim.env.HOME
  local vault_root = home .. "/vault/"
  if not vim.startswith(file, vault_root) then
    warn("File is not in ~/vault/")
    return
  end

  local rel = file:sub(#vault_root + 1)
  local vault, vault_file = rel:match("^([^/]+)/(.+)$")
  if not vault or not vault_file then
    warn("Could not determine vault from path")
    return
  end

  if not obsidian_running() then
    start_obsidian()
  end

  local uri = string.format(
    "obsidian://open?vault=%s&file=%s",
    url_encode(vault),
    url_encode(vault_file)
  )
  vim.fn.jobstart({ "xdg-open", uri }, { detach = true })
end

vim.api.nvim_create_user_command("ObsidianOpen", obsidian_open, {})
