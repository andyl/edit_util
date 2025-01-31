-- lsp/lang/yamlls

local schemas = require('schemastore').yaml.schemas()

-- Note 2024 Aug 02 Fri
-- Schema lint works with github worflow files, but not with ansible task files
-- Not sure why...
--
-- In 'jy_schema.lua', there is a commented-out function that attempts to
-- query the LSP to determine the linter.  It doesn't work...
--
-- AppendLog(ToString(TblFilter(schemas, "ansible")))
-- AppendLog("=======================================")

local opts = {
  settings = {
    yaml = {
      keyOrdering = false,
      completion  = false,
      customTags  = { '!shell mapping' },
      schemaStore = { enable = false, url = "" },
      schemas     = schemas,
      ["site.yaml"] = {},
    }
  }
}

return opts
