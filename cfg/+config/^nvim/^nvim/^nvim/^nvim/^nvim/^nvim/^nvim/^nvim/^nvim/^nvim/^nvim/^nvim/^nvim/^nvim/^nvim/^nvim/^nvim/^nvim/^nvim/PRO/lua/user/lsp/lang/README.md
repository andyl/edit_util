# LSP Lang Settings

These Lang settings are for LSP configuration.

## Mason 

They are called from `mason.lua`

To examine the configuration settings of an LSP server:

:lua print(vim.inspect(require'lspconfig'["server_name"]))
    - or - 
:lua vim.print(require'lspconfig'["server_name"])

:lua AppendLog(ToString(require'lspconfig'["tailwindcss"])) 

## LSP Log 

- LSP log | ~/.local/state/nvim/lsp.log

:lua print(vim.lsp.get_log_path())
:lua print(vim.inspect(vim.lsp.log_levels))
:lua require'vim.lsp.log'.set_log_level(<level>)
:lua vim.lsp.set_log_level(<level>)
:lua print(require'vim.lsp.log'.get_level())

Levels by name: "TRACE", "DEBUG", "INFO", "WARN", "ERROR", "OFF"
Levels by number: trace starts at 0

