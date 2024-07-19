-- lua/user/lsp/handlers

local function lsp_keymaps(_)
  -- keymaps defined with WhichKey
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then return end

local function lsp_highlight_document(client)
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec2(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], {}
    )
  end
end

local opts = {
  setup = function()
    local signs = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn",  text = "" },
      { name = "DiagnosticSignHint",  text = "" },
      { name = "DiagnosticSignInfo",  text = "" },
    }

    for _, sign in ipairs(signs) do
      local values = {texthl = sign.name, text = sign.text, numhl = ""}
      vim.fn.sign_define(sign.name, values)
    end

    vim.diagnostic.config({
      virtual_text = false,
      signs = { active = signs },
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {focusable = false, style = "minimal",
               border = "rounded", header = "", prefix = ""}
    })

    local lsp = vim.lsp
    local style = { border = "rounded" }
    local sighelp = vim.lsp.handlers.signature_help
    lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, style)
    lsp.handlers["textDocument/signatureHelp"] = lsp.with(sighelp, style)
  end,

  on_attach = function(client, bufnr)
    if client.name == "tsserver" then
      client.server_capabilities.document_formatting = false
    end
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
  end,

  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
}

return opts
