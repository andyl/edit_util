-- lsp/lang/pyright

local opts = {
  settings = {
    python = {
      analysis = {
        diagnosticSeverityOverrides = {
          reportMissingModuleSource = "none",
        },
      },
    },
  },
}

return opts
