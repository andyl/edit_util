-- md_render
--
-- https://github.com/MeanderingProgrammer/render-markdown.nvim

-- nvim-treesitter (master) ships a `set-lang-from-info-string!` directive whose
-- handler indexes match[capture_id] as a TSNode, but Neovim 0.11+ always passes
-- captures as TSNode[]. Re-register a version that unwraps the list.
local function patch_info_string_directive()
    local aliases = { ex = 'elixir', pl = 'perl', sh = 'bash', uxn = 'uxntal', ts = 'typescript' }
    vim.treesitter.query.add_directive('set-lang-from-info-string!', function(match, _, bufnr, pred, metadata)
        local nodes = match[pred[2]]
        local node = type(nodes) == 'table' and nodes[#nodes] or nodes
        if not node then return end
        local alias = vim.treesitter.get_node_text(node, bufnr):lower()
        metadata['injection.language'] = vim.filetype.match({ filename = 'a.' .. alias }) or aliases[alias] or alias
    end, { force = true })
end

local md_blocks = require('user.util.md_blocks')
md_blocks.register('hello', require('user.util.md_blocks.handlers.hello').new({
    icon = '\xef\x81\xb5', -- nerd-font speech-bubble glyph (U+F075)
    color = '#FFA500',
}))

return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      enabled = false,
      custom_handlers = {
        markdown = { extends = true, parse = md_blocks.parse },
      },
    },
    config = function(_, opts)
        patch_info_string_directive()
        require('render-markdown').setup(opts)
    end,
}
