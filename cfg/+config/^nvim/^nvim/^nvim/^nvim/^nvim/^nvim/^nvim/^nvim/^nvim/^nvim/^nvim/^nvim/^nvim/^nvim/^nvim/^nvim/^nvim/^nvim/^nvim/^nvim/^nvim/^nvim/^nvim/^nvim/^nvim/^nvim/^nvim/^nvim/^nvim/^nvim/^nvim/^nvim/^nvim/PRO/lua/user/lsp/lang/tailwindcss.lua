-- lsp/lang/tailwindcss

local function root_pattern(...)
  local patterns  = vim.iter({ ... }):flatten():totable()
  local lspconfig = require("lspconfig")

  return function(startpath)
    for _, pattern in ipairs(patterns) do
      return lspconfig.util.search_ancestors(startpath, function(path)
        local gpath = vim.fn.glob(lspconfig.util.path.join(path, pattern))
        if lspconfig.util.path.exists(gpath) then return path end
      end)
    end
  end
end

local opts = {
  init_options = {
    userLanguages = {
      eelixir = "phoenix-heex", -- html-eex?
      elixir  = "phoenix-heex", -- html-eex?
      heex    = "phoenix-heex", -- html-eex?
      eruby   = "erb",
    },
  },
  settings = {
    dynamicRegistration = true,
    includeLanguages = {
      elixir = "html-eex",
      heex   = "html-eex",
      erb    = "html-eex"
    },
    tailwindCSS = {
      lint = {
        cssConflict              = "warning",
        invalidApply             = "error",
        invalidConfigPath        = "error",
        invalidScreen            = "error",
        invalidTailwindDirective = "error",
        invalidVariant           = "error",
        recommendedVariantOrder  = "warning",
      },
      experimental = {
        classRegex = {
          'class[:]\\s*"([^"]*)"',
          'class.*"([^"]*)',
          "~H\"\"\".*class=\"([^\"]*)\".*\"\"\"",
        }
      },
      validate = true,
    },
  },
  filetypes = {
    "css", "scss", "sass", "html",
    "ex", "heex", "elixir", "eelixir"
  },
  root_dir = root_pattern(
    "./assets/tailwind.config.js",
    "tailwind.config.js",
    "postcss.config.js",
    "package.json",
    "node_modules",
    ".git",
    ".pbase"
  ),
}

return opts
