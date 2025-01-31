-- lsp/settings/tailwindcss

---Require a module using `pcall` and report any errors
--- param module string
--- param opts table?
--- return boolean, any

local function megrequire(module, opts)
  opts = opts or { silent = false }
  local ok, result = pcall(require, module)
  if not ok and not opts.silent then
    if opts.message then result = opts.message .. "\n" .. result end
    vim.notify(result, 4, { title = vim.fmt("Error requiring: %s", module) })
  end
  return ok, result
end

local ok_lsp, lspconfig = megrequire("lspconfig")
if not ok_lsp then return end

local function root_pattern(...)
  -- local patterns = vim.tbl_flatten({ ... })
  local patterns = vim.iter({ ... }):flatten():totable()

  return function(startpath)
    for _, pattern in ipairs(patterns) do
      return lspconfig.util.search_ancestors(startpath, function(path)
        if lspconfig.util.path.exists(vim.fn.glob(lspconfig.util.path.join(path, pattern))) then return path end
      end)
    end
  end
end

local opts = {
  init_options = {
    userLanguages = {
      eelixir = "phoenix-heex",
      elixir = "phoenix-heex",
      eruby = "erb",
      heex = "phoenix-heex",
    },
  },
  handlers = {
    ["tailwindcss/getConfiguration"] = function(_, _, params, _, bufnr, _)
      vim.lsp.buf_notify(bufnr, "tailwindcss/getConfigurationResponse", { _id = params._id })
      print("tailwindcss getConfiguration callback")
    end,
  },
  settings = {
    dynamicRegistration = true,
    includeLanguages = {
      elixir = "html-eex",
      heex = "html-eex",
      erb = "html-eex",
    },
    tailwindCSS = {
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning",
      },
      experimental = {
        classRegex = {
          'class[:]\\s*"([^"]*)"',
          'class.*"([^"]*)',
          "~H\"\"\".*class=\"([^\"]*)\".*\"\"\"",
        },
      },
      validate = true,
    },
  },
  filetypes = {
    "ex",
    "css",
    "scss",
    "sass",
    "html",
    "heex",
    "elixir",
    "eelixir",
  },
  root_dir = root_pattern(
    "./assets/tailwind.config.js",
    "tailwind.config.js",
    "tailwind.config.ts",
    "postcss.config.js",
    "postcss.config.ts",
    "package.json",
    "node_modules",
    ".git",
    ".pbase"
  ),
}

-- AppendLog("----- TSCSSDONE")
-- AppendLog("Opts: " .. ToString(opts))
-- AppendLog("-----")

return opts
