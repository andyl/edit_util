-- mason

-- :h mason-commands
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

-- MASON REPOS
-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim
--
-- MASON USES LSPCONFIG:
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--
-- LSPCONFIG HELP:
-- :help lsp-config
--
-- EXAMPLE LSP config:
-- https://github.com/megalithic/dotfiles/blob/94cce5036d8fc19c74b7a259f084560246194fe5/config/nvim/lua/mega/plugins/lsp/servers.lua#L477-L546
--

require 'mason'.setup()

-- auto-install servers
-- server names at https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local servers = {
  -- "cssls",        -- css
  "bashls",          -- bash
  "dockerls",        -- dockerfile
  "elixirls",        -- elixir
  "emmet_ls",        -- emmet
  "html",            -- html
  "jsonls",          -- json
  "lua_ls",          -- lua
  "marksman",        -- markdown
  "rust_analyzer",   -- rust
  "solargraph",      -- ruby
  "sqlls",           -- sql
  "terraformls",     -- hashicorp terraform/hcl
  "tailwindcss",     -- tailwind
  "tsserver",        -- javascript and typescript
}

require 'mason-lspconfig'.setup {
  ensure_installed = servers,
}

-- handlers attach servers to buffers

local function server_config(server)
  local tgt = "user.lsp.settings." .. server
  local opts = require(tgt)
  AppendLog("Loading LSP config for " .. server)
  require "lspconfig"[server].setup(opts)
end

require 'mason-lspconfig'.setup_handlers {
  function(server_name)  -- default handler sets up all servers
    require "lspconfig"[server_name].setup {}
  end,
  ["elixirls"] = function() server_config("elixirls") end,
  ["emmet_ls"] = function() server_config("emmet_ls") end,
  ["jsonls"] = function() server_config("jsonls") end,
  ["lua_ls"] = function() server_config("lua_ls") end,
  ["tailwindcss"] = function() server_config("tailwindcss") end,
}
