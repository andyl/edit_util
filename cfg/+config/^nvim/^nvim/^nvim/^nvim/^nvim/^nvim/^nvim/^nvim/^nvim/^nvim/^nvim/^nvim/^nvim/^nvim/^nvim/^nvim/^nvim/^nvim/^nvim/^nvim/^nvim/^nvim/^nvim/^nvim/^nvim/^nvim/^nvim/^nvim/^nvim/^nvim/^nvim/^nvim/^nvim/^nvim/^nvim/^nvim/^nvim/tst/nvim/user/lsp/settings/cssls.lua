-- lsp/settings/cssls
-- :lua vim.print(require'lspconfig'["cssls"])

local opts = {
  settings = {
    css = {
      validate = false,
      lint = {
        unknownAtRules = "ignore"
      }
    },
    scss = {
      validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    },
  },
}

return opts
