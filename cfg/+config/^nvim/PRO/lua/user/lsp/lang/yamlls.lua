-- lsp/lang/yamlls

local opts = {
  settings = {
    yaml = {
      keyOrdering = false,
      completion = false,
      customTags = { '!shell mapping' },
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        -- ["https://json.schemastore.org/ansible-stable-2.9"]   = "roles/**/tasks/*.{yml,yaml}"
        -- ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json"] = "roles/**/tasks/*.{yml,yaml}",
      },
      -- disableAdditionalProperties = true,
      -- format = {
      --   bracketSpacing = false,
      --   enable = false,
      -- },
      -- schemaStore = {
      --   enable = false,
      -- },
      -- validate = false,
    }
  }
}

return opts
