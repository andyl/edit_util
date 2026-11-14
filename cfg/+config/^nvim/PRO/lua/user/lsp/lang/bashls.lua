-- bashls | https://github.com/bash-lsp/bash-language-server
--
-- Go-to-definition follows literal `source`/`.` lines only. These settings
-- also resolve symbols from any indexed file in the workspace, and index the
-- extensionless dotfiles in */cfg (`_bashrc_base`, `_bashu_functions`, ...).

-- A function in a symlinked dotfile comes back twice: once via the symlink
-- (`~/.bashu_functions`, from the source line) and once via its real path
-- (from the workspace index). Collapse those so definition jumps directly
-- instead of opening a quickfix list.
local function dedupe_locations(result)
  if type(result) ~= "table" or not result[1] then return result end
  local seen, out = {}, {}
  for _, loc in ipairs(result) do
    local uri   = loc.uri or loc.targetUri
    local range = loc.range or loc.targetSelectionRange
    local path  = vim.uv.fs_realpath(vim.uri_to_fname(uri)) or uri
    local key   = path .. ":" .. range.start.line
    if not seen[key] then
      seen[key] = true
      table.insert(out, loc)
    end
  end
  return out
end

return {
  settings = {
    bashIde = {
      includeAllWorkspaceSymbols = true,
      globPattern = "**/{*.@(sh|inc|bash|command),_bash*}",
    },
  },
  on_attach = function(client)
    local request = client.request
    client.request = function(self, method, params, handler, bufnr)
      if method == "textDocument/definition" and handler then
        local orig = handler
        handler = function(err, result, ctx, config)
          return orig(err, dedupe_locations(result), ctx, config)
        end
      end
      return request(self, method, params, handler, bufnr)
    end
  end,
}
