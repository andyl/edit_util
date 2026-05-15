local M = {}

local ICON = '\xef\x81\xb5' -- nerd-font speech-bubble glyph (U+F075)
local COLOR = '#FFA500'     -- orange
local HL_GROUP = 'MdBlockHello'

---@param block render.md.block_handler.Block
---@return render.md.Mark[]
function M.parse(block)
    -- (Re-)apply the highlight at render time so a late-loading colorscheme
    -- (which clears user-defined groups) can't strip the color.
    vim.api.nvim_set_hl(0, HL_GROUP, { fg = COLOR })

    local name = ''
    for line in (block.content .. '\n'):gmatch('([^\n]*)\n') do
        local trimmed = line:match('^%s*(.-)%s*$')
        if trimmed ~= '' then
            name = trimmed
            break
        end
    end

    local start_row, _, end_row, _ = block.block_node:range()
    local label = ICON == '' and ('HELLO ' .. name) or (ICON .. ' HELLO ' .. name)

    -- Pad to the fence-line width so overlay fully replaces it (otherwise
    -- the trailing part of the info_string, e.g. "```hello BingBong",
    -- bleeds through past the end of our label).
    local fence_line = vim.api.nvim_buf_get_lines(block.buf, start_row, start_row + 1, false)[1] or ''
    local fence_width = vim.fn.strdisplaywidth(fence_line)
    local label_width = vim.fn.strdisplaywidth(label)
    if label_width < fence_width then
        label = label .. string.rep(' ', fence_width - label_width)
    end

    local marks = {}

    -- Overlay the opening fence line. Priority must exceed render-markdown's
    -- built-in fence-label overlay (priority 4096).
    marks[#marks + 1] = {
        conceal = false,
        start_row = start_row,
        start_col = 0,
        opts = {
            virt_text = { { label, HL_GROUP } },
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
