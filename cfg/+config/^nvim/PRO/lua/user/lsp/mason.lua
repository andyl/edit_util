-- mason
--

-- :help mason-commands
-- :help lsp-config
--
-- :Mason                    | opens a graphical status window
-- :MasonInstall <pkg> ...   | installs/reinstalls the provided packages
-- :MasonUninstall <pkg> ... | uninstalls the provided packages
-- :MasonUninstallAll        | uninstalls all packages
-- :MasonLog                 | opens the mason.nvim log file in a new tab
-- :LspInfo                  | show currently active LSP client
-- :LspInstall               | install lsp server
-- :LspUninstall             | uninstall lsp server

-- Mason log | ~/.local/state/nvim/mason.log
-- LSP log   | ~/.local/state/nvim/lsp.log

-- :lua vim.lsp.set_log_level('error')
-- :lua vim.lsp.set_log_level('debug')
-- :lua vim.lsp.set_log_level('trace')

-- MASON REPOS
-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim
--
-- MASON USES NVIM_LSPCONFIG:
-- https://github.com/neovim/nvim-lspconfig
--
-- EXAMPLE LSP config:
-- https://github.com/megalithic/dotfiles/blob/94cce5036d8fc19c74b7a259f084560246194fe5/config/nvim/lua/mega/plugins/lsp/servers.lua#L477-L546

-- SERVER NAMES
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

local server_list = {
  { name = "bashls",        cfg = false }, -- bash
  { name = "dockerls",      cfg = false }, -- dockerfile
  { name = "elixirls",      cfg = false }, -- elixir
  { name = "emmet_ls",      cfg = true  }, -- emmet
  -- { name = "gopls",         cfg = false }, -- golang
  { name = "html",          cfg = false }, -- html
  { name = "jsonls",        cfg = true  }, -- json
  { name = "lua_ls",        cfg = true  }, -- lua
  { name = "marksman",      cfg = false }, -- markdown
  { name = "pyright",       cfg = true  }, -- python
  -- { name = "solargraph",    cfg = false }, -- ruby
  { name = "sqlls",         cfg = false }, -- sql
  { name = "terraformls",   cfg = false }, -- hashicorp terraform/hcl
  { name = "tailwindcss",   cfg = true  }, -- tailwind
  { name = "ts_ls",         cfg = false }, -- javascript and typescript (does this work?)
  -- { name = "yamlls",        cfg = true  }, -- yaml
  { name = "zls",           cfg = false }, -- zig
}

local function all_servers()
  local names = {}
  for _, server in ipairs(server_list) do
    table.insert(names, server.name)
  end
  return names
end

local function cfg_servers()
  local configured = {}
  for _, server in ipairs(server_list) do
    if server.cfg then
      table.insert(configured, server.name)
    end
  end
  return configured
end

local function apply_server_config(server_name)
  local tgt  = "user.lsp.lang." .. server_name
  local opts = require(tgt)
  require('lspconfig')[server_name].setup(opts)
end

require('mason').setup()

for _, server in ipairs(cfg_servers()) do
  apply_server_config(server)
end

require('mason-lspconfig').setup { ensure_installed = all_servers() }

