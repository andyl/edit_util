-- claude - AI Pair-Programming Tool
--
-- CLAUDE          | https://claude.com/product/claude-code
-- CLAUDECODE.NVIM | https://github.com/coder/claudecode.nvim
--
-- Commands:
-- :ClaudeCode
-- :ClaudeCodeSend
-- :etc...
--
-- Use "IDE Mode" to run claude in a standalone session.
-- This is useful for working on large 'monolith' projects.
-- The script `nv_ide` sets `IDE_MODE=true`.
-- Then you launch claude using `claude --ide` (use the alias `claude_ide`)
-- see https://github.com/coder/claudecode.nvim?tab=readme-ov-file#none-no-op-provider
--
-- HOTKEYS DEFINED IN `map_leader.lua`
--
-- We frequently get this error message:
-- [ClaudeCode] [init] [ERROR] Failed to start Claude Code server: Failed to listen on port 57388: EADDRINUSE: address already in use
-- Press ENTER or type command to continue

-- Show diffs inline in the claude window, rather than open a neovim diff window
local diff_cfg = {
  diff_opts = {
    open_in_current_tab = false
  }
}

-- Config for IDE usage.  Claude runs in separate terminal.
local terminal_ide_cfg = {
  terminal = {
    provider = "none", -- no UI actions; server + tools remain available
  },
}

-- Config for IDE usage.  Claude runs in nvim session.
local terminal_inline_cfg = {
  terminal = {
    split_width_percentage = 0.50 -- Claude takes 50% of screen width
  }
}

local terminal_cfg = (os.getenv("IDE_MODE") == "true") and terminal_ide_cfg or terminal_inline_cfg

local port_opts = {
  port_range = { min = 51510, max = 51700 }
}

local opts = vim.tbl_deep_extend("force", diff_cfg, terminal_cfg, port_opts)

-- Workaround for upstream EADDRINUSE bug: claudecode.nvim's port picker only
-- tests bind(), but libuv's SO_REUSEADDR lets bind succeed against an actively
-- listening socket. We replace it with a bind+listen probe so concurrent nvim
-- instances each get a free port.
local function patch_port_finder()
  local tcp = require("claudecode.server.tcp")
  local utils = require("claudecode.server.utils")
  tcp.find_available_port = function(min_port, max_port)
    if min_port > max_port then return nil end
    local ports = {}
    for i = min_port, max_port do table.insert(ports, i) end
    utils.shuffle_array(ports)
    for _, port in ipairs(ports) do
      local s = vim.loop.new_tcp()
      if s then
        local bind_ok = s:bind("127.0.0.1", port)
        local listen_ok = bind_ok and s:listen(1, function() end)
        s:close()
        if bind_ok and listen_ok then
          return port
        end
      end
    end
    return nil
  end
end

local claude_opts = {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = function(_, o)
    patch_port_finder()
    require("claudecode").setup(o)
  end,
  opts = opts,
}

return claude_opts
