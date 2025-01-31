-- lsp/settings/lua_ls

local opts = {
	settings = {
    yaml = {
      keyOrdering = false,
      completion = false,
      customTags = {
        '!shell mapping'
      },
      disableAdditionalProperties = true,
      format = {
        bracketSpacing = false,
        enable = false,
      },
      schemaStore = {
        enable = false,
      },
      validate = false,
    }
  }
}

return opts
