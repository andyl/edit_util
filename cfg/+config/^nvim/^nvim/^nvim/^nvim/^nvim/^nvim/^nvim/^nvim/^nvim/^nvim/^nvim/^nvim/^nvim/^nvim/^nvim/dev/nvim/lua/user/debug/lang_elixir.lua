-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#elixir
-- https://github.com/elixir-lsp/elixir-ls#debugger-support
--
-- DISABLED as of 2024 Feb 10 Sat / Wait until more people use DAP for Elixir...

local dap = require("dap")

dap.adapters.mix_task = {
  type = 'executable',
  command = '~/.local/share/nvim/mason/bin/elixir-ls-debugger',
  args = {}
}

dap.configurations.elixir = {
  {
    type = "mix_task",
    name = "mix test",
    task = 'test',
    taskArgs = {"--trace"},
    request = "launch",
    startApps = true, -- for Phoenix projects
    projectDir = "${workspaceFolder}",
    requireFiles = {
      "test/**/test_helper.exs",
      "test/**/*_test.exs"
    }
  },
}
