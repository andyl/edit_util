-- lsp/composer_ls
--
-- composer-ls | language server for Composer recipe group files
-- https://composer.hexdocs.pm/composer_lsp.html
--
-- Not a Mason package - runs from the host project via `mix composer.lsp`.
-- The host project needs these deps:
--   {:composer, "~> 0.1", only: :dev},
--   {:gen_lsp, "~> 0.11.4", only: :dev}
--
-- Runs alongside expert; only attaches to recipe files.
-- The root is the host Mix project: the nearest mix.exs above nvim's cwd when
-- the first recipe is opened. It stays pinned after that, so you can :cd into
-- a recipes or steps dir (eg via nvim-tree) and keep using the same server.
--
-- :checkhealth vim.lsp     | confirm the client is attached
-- :ComposerReload          | recompile + rediscover cookbooks after editing step code

-- Host Mix project that runs `mix composer.lsp`; set on first attach.
local host_root = nil

local function find_host_root()
  local root = vim.fs.root(vim.fn.getcwd(), "mix.exs")
  if root then host_root = host_root or root end
  return host_root
end

vim.lsp.config("composer_ls", {
  -- Run mix from the host root, not nvim's (possibly changed) cwd.
  cmd = function(dispatchers, config)
    return vim.lsp.rpc.start({ "mix", "composer.lsp" }, dispatchers, {
      cwd = config.root_dir,
      -- Keep Mix's own output (compiling dependencies) off stdout.
      env = { MIX_QUIET = "1" },
    })
  end,
  filetypes = { "elixir" },
  -- Attach to recipe files only: local recipes and a cookbook's recipes.
  -- ~/.config/composer is a symlink (to .../%composer) and nvim names the
  -- buffer by the resolved path, so also match the resolved recipes dir.
  root_dir = function(bufnr, on_dir)
    local name = vim.api.nvim_buf_get_name(bufnr)
    local local_dir = vim.fn.resolve(vim.fn.expand("~/.config/composer/recipes")) .. "/"
    if name:match("/composer/recipes/[^/]+%.exs$")
      or vim.startswith(name, local_dir)
      or name:match("/lib/composer/[^/]+/recipes/[^/]+%.exs$")
    then
      local root = find_host_root()
      if root then
        on_dir(root)
      else
        vim.notify("composer_ls: no host Mix project; start nvim in one", vim.log.levels.WARN)
      end
    end
  end,
})

vim.lsp.enable("composer_ls")

vim.api.nvim_create_user_command("ComposerReload", function()
  for _, client in ipairs(vim.lsp.get_clients({ name = "composer_ls" })) do
    client:exec_cmd({ title = "Reload cookbooks", command = "composer.reload" })
  end
end, {})
