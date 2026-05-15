local M = {}

---@param block render.md.block_handler.Block
---@return render.md.Mark[]
function M.parse(block)
    local name = ''
    for line in (block.content .. '\n'):gmatch('([^\n]*)\n') do
        local trimmed = line:match('^%s*(.-)%s*$')
        if trimmed ~= '' then
            name = trimmed
            break
        end
    end

    local start_row, _, end_row, _ = block.block_node:range()
    local text = 'HELLO ' .. name

    local marks = {}

    -- Overlay the opening fence line with the rendered text. Priority must
    -- exceed render-markdown's built-in fence-label overlay (priority = 4096)
    -- so we win the row instead of showing "󰈔 hello".
    marks[#marks + 1] = {
        conceal = false,
        start_row = start_row,
        start_col = 0,
        opts = {
            virt_text = { { text, 'RenderMarkdownCode' } },
            virt_text_pos = 'overlay',
            priority = 10000,
        },
    }

    -- Hide the remaining lines (content + closing fence).
    for row = start_row + 1, end_row - 1 do
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

    return marks
end

return M
