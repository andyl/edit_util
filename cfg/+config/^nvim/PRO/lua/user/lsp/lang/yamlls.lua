-- lsp/lang/yamlls

local opts = {
  settings = {
    yaml = {
      keyOrdering = false,
      completion  = false,
      customTags  = { '!shell mapping' },
      schemaStore = { enable = false, url = "" },
      schemas     = require('schemastore').yaml.schemas(),
    }
  }
}

return opts
