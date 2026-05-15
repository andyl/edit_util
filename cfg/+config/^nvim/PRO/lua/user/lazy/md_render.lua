-- md_render
--
-- https://github.com/MeanderingProgrammer/render-markdown.nvim
-- https://github.com/MeanderingProgrammer/render-markdown.nvim/blob/main/doc/custom-handlers.md

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

local query = vim.treesitter.query.parse('markdown', [[
    (fenced_code_block
        (info_string (language) @lang)
        (code_fence_content) @content) @block
]])

local function parse_markdown(ctx)
    local marks = {} ---@type render.md.Mark[]
    for _, match in query:iter_matches(ctx.root, ctx.buf, 0, -1, { all = true }) do
        local lang_node = match[1] and match[1][1]
        local content_node = match[2] and match[2][1]
        local block_node = match[3] and match[3][1]
        if lang_node and content_node and block_node then
            local lang = vim.treesitter.get_node_text(lang_node, ctx.buf)
            if lang == 'hello' then
                local content = vim.treesitter.get_node_text(content_node, ctx.buf)
                local name = ''
                for line in (content .. '\n'):gmatch('([^\n]*)\n') do
                    local trimmed = line:match('^%s*(.-)%s*$')
                    if trimmed ~= '' then
                        name = trimmed
                        break
                    end
                end

                local start_row, _, end_row, _ = block_node:range()
                local text = 'HELLO ' .. name
                local inner = vim.fn.strdisplaywidth(text)
                local top = '┌─' .. string.rep('─', inner) .. '─┐'
                local mid = '│ ' .. text .. ' │'
                local bot = '└─' .. string.rep('─', inner) .. '─┘'

                for row = start_row, end_row - 1 do
                    marks[#marks + 1] = {
                        conceal = false,
                        start_row = row,
                        start_col = 0,
                        opts = {
                            end_row = row + 1,
                            end_col = 0,
                            conceal_lines = '',
                        },
                    }
                end

                marks[#marks + 1] = {
                    conceal = false,
                    start_row = start_row,
                    start_col = 0,
                    opts = {
                        virt_lines_above = true,
                        virt_lines = {
                            { { top, 'RenderMarkdownCode' } },
                            { { mid, 'RenderMarkdownCode' } },
                            { { bot, 'RenderMarkdownCode' } },
                        },
                    },
                }
            end
        end
    end
    return marks
end

return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      enabled = false,
      custom_handlers = {
        markdown = { extends = true, parse = parse_markdown },
      },
    },
    config = function(_, opts)
        patch_info_string_directive()
        require('render-markdown').setup(opts)
    end,
}
