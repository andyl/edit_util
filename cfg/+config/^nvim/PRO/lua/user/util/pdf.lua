-- user.util.pdf
--
-- Open a PDF file from Neovim.
--   - Local session:    runs `gio open <file>`  (same thing your `gopen`
--                       shell function does; invoked directly so it works
--                       from jobstart, which has no shell functions)
--   - SSH session:      copies the file to a target host and runs
--                       `gio open` there
--
-- To override the opener (e.g. open in Brave instead), set
--   vim.g.pdf_open_cmd = { "brave-browser", "%s" }
-- where %s is replaced with the file path. Applies to both local and
-- the remote side of an SSH open.
--
-- SSH mode reads the target from (in order):
--   1. vim.g.pdf_ssh_target   -- e.g. "andyl@laptop.lan"
--   2. $PDF_SSH_TARGET        -- environment variable
--   3. $SSH_CLIENT first field (ip) with current $USER as the login
--
-- Requires passwordless ssh *back* from the remote to the local workstation
-- (typical reverse-ssh / authorized_keys setup).

local M = {}

local function is_ssh()
  return (vim.env.SSH_CONNECTION or vim.env.SSH_TTY or vim.env.SSH_CLIENT) ~= nil
end

local function ssh_target()
  if vim.g.pdf_ssh_target and vim.g.pdf_ssh_target ~= "" then
    return vim.g.pdf_ssh_target
  end
  if vim.env.PDF_SSH_TARGET and vim.env.PDF_SSH_TARGET ~= "" then
    return vim.env.PDF_SSH_TARGET
  end
  local client = vim.env.SSH_CLIENT
  if client and client ~= "" then
    local ip = client:match("^(%S+)")
    if ip then
      return (vim.env.USER or "root") .. "@" .. ip
    end
  end
  return nil
end

local function notify(msg, level)
  vim.notify(msg, level or vim.log.levels.INFO, { title = "PDF" })
end

-- Build the opener argv for a given path. Honors vim.g.pdf_open_cmd if set.
local function opener_argv(path)
  local tmpl = vim.g.pdf_open_cmd
  if type(tmpl) == "table" then
    local out = {}
    for _, a in ipairs(tmpl) do
      out[#out + 1] = a:gsub("%%s", path)
    end
    return out
  end
  return { "gio", "open", path }
end

-- Shell-string version (for the remote side of ssh).
local function opener_shell(path)
  local argv = opener_argv(path)
  local parts = {}
  for _, a in ipairs(argv) do parts[#parts + 1] = vim.fn.shellescape(a) end
  return table.concat(parts, " ")
end

local function run(cmd)
  vim.fn.jobstart(cmd, {
    detach = true,
    on_exit = function(_, code)
      if code ~= 0 then
        notify("command failed (" .. code .. "): " .. table.concat(cmd, " "),
          vim.log.levels.ERROR)
      end
    end,
  })
end

-- Open a PDF from the remote side over SSH:
--   scp the file to <target>:/tmp/nvim-pdf/<basename>
--   then ssh <target> <opener> <that path>
local function open_over_ssh(path)
  local target = ssh_target()
  if not target then
    notify("no SSH target; set vim.g.pdf_ssh_target or $PDF_SSH_TARGET",
      vim.log.levels.ERROR)
    return
  end
  local base = vim.fn.fnamemodify(path, ":t")
  local remote_dir = "/tmp/nvim-pdf"
  local remote_path = remote_dir .. "/" .. base

  local sh = string.format(
    "ssh -o BatchMode=yes %s 'mkdir -p %s' && "
    .. "scp -o BatchMode=yes -q %s %s:%s && "
    .. "ssh -o BatchMode=yes %s %s",
    vim.fn.shellescape(target), vim.fn.shellescape(remote_dir),
    vim.fn.shellescape(path), vim.fn.shellescape(target), vim.fn.shellescape(remote_path),
    vim.fn.shellescape(target),
    vim.fn.shellescape(opener_shell(remote_path) .. " >/dev/null 2>&1 &")
  )
  notify("opening on " .. target .. ": " .. base)
  run({ "sh", "-c", sh })
end

function M.open(path)
  if not path or path == "" then
    notify("no path given", vim.log.levels.ERROR)
    return
  end
  path = vim.fn.fnamemodify(path, ":p")
  if vim.fn.filereadable(path) == 0 then
    notify("not readable: " .. path, vim.log.levels.ERROR)
    return
  end
  if is_ssh() then
    open_over_ssh(path)
  else
    local argv = opener_argv(path)
    notify(argv[1] .. " " .. vim.fn.fnamemodify(path, ":t"))
    run(argv)
  end
end

function M.is_pdf(path)
  return type(path) == "string" and path:lower():match("%.pdf$") ~= nil
end

-- :PdfOpen [file]   (defaults to the current buffer)
vim.api.nvim_create_user_command("PdfOpen", function(ctx)
  local p = ctx.args ~= "" and ctx.args or vim.api.nvim_buf_get_name(0)
  M.open(p)
end, { nargs = "?", complete = "file", desc = "Open PDF via gopen (SSH-aware)" })

return M
