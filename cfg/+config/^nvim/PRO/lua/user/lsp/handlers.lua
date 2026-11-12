-- lua/user/lsp/handlers

local function lsp_keymaps(_)
  -- keymaps defined with WhichKey
  vim.cmd [[ command! Format lua vim.lsp.buf.format() ]]
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()

-- local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
-- if not status_ok then return end

local function lsp_highlight_document(client)
  if client.server_capabilities.documentHighlightProvider then
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
    local severity = vim.diagnostic.severity
    local signs = {
      text = {
        [severity.ERROR] = "",
        [severity.WARN]  = "",
        [severity.HINT]  = "",
        [severity.INFO]  = "",
      },
    }

    vim.diagnostic.config({
      virtual_text = false,
      signs = signs,
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        header = "",
        prefix = ""
      }
    })

    -- local lsp = vim.lsp
    -- local style = { border = "rounded" }
    -- local sighelp = vim.lsp.handlers.signature_help
    -- lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, style)
    -- lsp.handlers["textDocument/signatureHelp"] = lsp.with(sighelp, style)
  end,

  on_attach = function(client, bufnr)
    if client.name == "ts_ls" then
      client.server_capabilities.documentFormattingProvider = false
    end
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)

    -- see https://github.com/dbernheisel/hex-cmp

    local bufname = vim.api.nvim_buf_get_name(bufnr)
    if bufname:match('mix%.exs$') then
      require('hex_cmp.hover').attach(bufnr)
    end

  end,

  -- capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
  -- capabilities = require('blink.cmp')
}

return opts
