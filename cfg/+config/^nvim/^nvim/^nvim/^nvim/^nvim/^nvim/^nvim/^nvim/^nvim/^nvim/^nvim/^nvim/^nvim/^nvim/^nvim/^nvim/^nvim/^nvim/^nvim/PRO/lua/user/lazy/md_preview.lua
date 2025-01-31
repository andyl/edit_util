-- md_preview
--
-- Markdown preview plugin
--
-- https://github.com/iamcco/markdown-preview.nvim
-- :MarkdownPreview
-- :MarkdownPreviewStop
--
-- key definitions at `lua/user/key/map_leader.lua`
--

--------------------------------------------------------------------
-- install without yarn or npm
--
-- BUG: https://github.com/iamcco/markdown-preview.nvim/issues/695
-- cd ~/.local/share/nvim/PRO/lazy/markdown-preview.nvim
-- npm install

-- return {
--   "iamcco/markdown-preview.nvim",
--   cmd   = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
--   ft    = { "markdown" },
--   init  = function() vim.g.mkdp_filetypes = { "markdown" } end,
--   build = function() vim.fn["mkdp#util#install"]() end,
-- }

--------------------------------------------------------------------
-- install with yarn or npm

-- USE THIS

return {
  -- "iamcco/markdown-preview.nvim",
  -- cmd   = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  -- ft    = { "markdown" },
  -- init  = function() vim.g.mkdp_filetypes = { "markdown" } end,
  -- build = "cd app && npm install",
}

