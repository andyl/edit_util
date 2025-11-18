-- lsp/lang/tailwindcss
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/tailwindcss.lua
--
-- https://github.com/tailwindlabs/tailwindcss-intellisense
--
-- Tailwind CSS Language Server can be installed via npm:
-- npm install -g @tailwindcss/language-server
--
-- NOTE
-- THIS WILL ONLY WORK IN A TAILWIND PROJECT (eg Phoenix Project)
-- THIS REQUIRES A TAILWIND CONFIG FILE IN `<root>/assets/js/tailwind.config.js`
--
--- module.exports = {
---  content: [
---    "./lib/**/*.{heex,ex}",
---    "./assets/**/*.{js,css}",
---  ],
---  theme: {
---    extend: {},
---  },
---  plugins: [],
---}
--
-- Blog and Forum Posts
-- https://www.reddit.com/r/neovim/comments/x079oc/triggering_autocompletion_for_heex_files_tailwind/
-- https://elixirforum.com/t/how-to-set-up-neovim-for-tailwind-intelisense-in-phoenix-files/68055

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
      classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
      lint = {
        cssConflict              = "warning",
        invalidApply             = "error",
        invalidConfigPath        = "error",
        invalidScreen            = "error",
        invalidTailwindDirective = "error",
        invalidVariant           = "error",
        recommendedVariantOrder  = "warning",
        suggestCanonicalClasses  = "ignore",
      },
      experimental = {
        -- classRegex = {
        --   'class[:]\\s*"([^"]*)"',
        --   'class.*"([^"]*)',
        --   "~H\"\"\".*class=\"([^\"]*)\".*\"\"\"",
        -- }
      },
      validate = true,
    },
  },
  filetypes = {
    "css", "scss", "sass", "html",
    "ex", "heex", "elixir", "eelixir"
  },
  -- root_dir = root_pattern(
  --   "./assets/css/app.css",
  --   "./assets/js/app.js",
  --   "tailwind.config.js",
  --   "postcss.config.js",
  --   "package.json",
  --   "node_modules",
  --   "mix.exs",
  --   ".git",
  --   ".pbase"
  -- ),
}

return opts
