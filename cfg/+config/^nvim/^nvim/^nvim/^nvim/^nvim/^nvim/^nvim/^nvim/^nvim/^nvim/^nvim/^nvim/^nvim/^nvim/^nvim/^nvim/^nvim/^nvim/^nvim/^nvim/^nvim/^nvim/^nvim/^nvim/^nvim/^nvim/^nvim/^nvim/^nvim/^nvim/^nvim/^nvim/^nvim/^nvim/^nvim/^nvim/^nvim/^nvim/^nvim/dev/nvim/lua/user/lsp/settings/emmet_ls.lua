-- lsp/settings/emmet_ls
-- https://github.com/aca/emmet-ls

local opts = {
  settings = {
    includeLanguages = {
      ["html-eex"] = "html",
      ["phoenix-heex"] = "html",
      eruby = "html",
    },
  },
  filetypes = {
    "css",
    "scss",
    "sass",
    "html",
    "elixir",
    "eelixir",
    "html.heex",
    "heex",
    "html_heex",
    "html_eex",
    "phoenix-heex",
    "phoenix_heex",
    -- "javascriptreact",
    -- "typescriptreact",
    -- "eruby",
  },
}

return opts
