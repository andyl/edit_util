-- mason

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
-- MASON USES LSPCONFIG:
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--
-- EXAMPLE LSP config:
-- https://github.com/megalithic/dotfiles/blob/94cce5036d8fc19c74b7a259f084560246194fe5/config/nvim/lua/mega/plugins/lsp/servers.lua#L477-L546

-- server names
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

local servers = {
  "bashls",        -- bash
  "dockerls",      -- dockerfile
  "elixirls",      -- elixir
  "emmet_ls",      -- emmet
  "gopls",         -- golang
  "html",          -- html
  "jsonls",        -- json
  "lua_ls",        -- lua
  "marksman",      -- markdown
  "rust_analyzer", -- rust
  "solargraph",    -- ruby
  "sqlls",         -- sql
  "terraformls",   -- hashicorp terraform/hcl
  "tailwindcss",   -- tailwind
  "ts_ls",         -- javascript and typescript (does this work?)
  "yamlls",        -- yaml
  "zls",           -- zig
}

local function server_config(server)
  local tgt  = "user.lsp.lang." .. server
  local opts = require(tgt)
  require("lspconfig")[server].setup(opts)
end

require('mason').setup()
require('mason-lspconfig').setup { ensure_installed = servers }
require('mason-lspconfig').setup_handlers {
  function(server_name)  -- default handler sets up all servers
    require("lspconfig")[server_name].setup({})
  end,
  ["elixirls"]    = function() server_config("elixirls") end,
  ["emmet_ls"]    = function() server_config("emmet_ls") end,
  ["jsonls"]      = function() server_config("jsonls") end,
  ["lua_ls"]      = function() server_config("lua_ls") end,
  ["tailwindcss"] = function() server_config("tailwindcss") end,
  ["yamlls"]      = function() server_config("yamlls") end,
}

----------------------------------------------------------------


