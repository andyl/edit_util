-- md_preview
--
-- Markdown preview plugin
--
-- https://github.com/iamcco/markdown-preview.nvim
-- :MarkdownPreview
-- :MarkdownPreviewStop
--
-- key definitions at `lua/user/key/map_leader.lua`

return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  build = "cd app && yarn install",
  config = function() vim.g.mkdp_filetypes = { "markdown" } end,
}

