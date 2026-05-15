local M = {}

local ICON = '\xef\x81\xb5'      -- nerd-font speech-bubble glyph (U+F075)
local COLOR_LANG = '#FFA500'     -- orange: icon + language
local COLOR_EXT = '#FB4934'      -- red: info_string extension
local COLOR_BODY = '#8EC07C'     -- gruvbox aqua: body text (matches other code blocks)
local CTERM_BODY = 108
local HL_LANG = 'MdBlockHello'
local HL_EXT = 'MdBlockHelloExt'
local HL_BODY = 'MdBlockHelloBody'
local HL_SIGN = 'MdBlockHelloSign'

---@param block render.md.block_handler.Block
---@return render.md.Mark[]
function M.parse(block)
    -- (Re-)apply highlights at render time so a late-loading colorscheme
    -- can't strip them. Background tracks render-markdown's code-block bg
    -- so our overlay cells blend into the rest of the painted row.
    local code_bg = vim.api.nvim_get_hl(0, { name = 'RenderMarkdownCode', link = false }).bg
    vim.api.nvim_set_hl(0, HL_LANG, { fg = COLOR_LANG, bg = code_bg })
    vim.api.nvim_set_hl(0, HL_EXT, { fg = COLOR_EXT, bg = code_bg })
    vim.api.nvim_set_hl(0, HL_BODY, { fg = COLOR_BODY, ctermfg = CTERM_BODY, bg = code_bg })
    vim.api.nvim_set_hl(0, HL_SIGN, { fg = COLOR_LANG })

    local name = ''
    for line in (block.content .. '\n'):gmatch('([^\n]*)\n') do
        local trimmed = line:match('^%s*(.-)%s*$')
        if trimmed ~= '' then
            name = trimmed
            break
        end
    end

    local start_row, _, end_row, _ = block.block_node:range()
    local content_row = start_row + 1

    -- Title row: "<icon> <lang>" in orange, " <ext>" in red.
    local title_main = ICON == '' and block.lang or (ICON .. ' ' .. block.lang)
    local title_parts = { { title_main, HL_LANG } }
    if block.ext ~= '' then
        title_parts[#title_parts + 1] = { ' ' .. block.ext, HL_EXT }
    end

    -- Pad title to fence-line width so trailing source text doesn't bleed
    -- through past the end of the overlay.
    local fence_line = vim.api.nvim_buf_get_lines(block.buf, start_row, start_row + 1, false)[1] or ''
    local fence_width = vim.fn.strdisplaywidth(fence_line)
    local title_width = vim.fn.strdisplaywidth(title_main)
        + (block.ext ~= '' and vim.fn.strdisplaywidth(' ' .. block.ext) or 0)
    if title_width < fence_width then
        title_parts[#title_parts + 1] = { string.rep(' ', fence_width - title_width), HL_LANG }
    end

    -- Body row: "HELLO <name>" in orange, padded to first-content-line width.
    local body = 'HELLO ' .. name
    local content_line = vim.api.nvim_buf_get_lines(block.buf, content_row, content_row + 1, false)[1] or ''
    local content_width = vim.fn.strdisplaywidth(content_line)
    local body_width = vim.fn.strdisplaywidth(body)
    if body_width < content_width then
        body = body .. string.rep(' ', content_width - body_width)
    end

    local marks = {}

    -- Title overlay on the opening fence line.
    marks[#marks + 1] = {
        conceal = false,
        start_row = start_row,
        start_col = 0,
        opts = {
            virt_text = title_parts,
            virt_text_pos = 'overlay',
            priority = 10000,
        },
    }

    -- Sign column icon. Priority must exceed render-markdown's built-in
    -- sign (priority 4096), which falls back to the generic file glyph
    -- when the language has no registered icon.
    marks[#marks + 1] = {
        conceal = false,
        start_row = start_row,
        start_col = 0,
        opts = {
            sign_text = ICON .. ' ',
            sign_hl_group = HL_SIGN,
            priority = 10000,
        },
    }

    -- Body overlay on the first content line.
    marks[#marks + 1] = {
        conceal = false,
        start_row = content_row,
        start_col = 0,
        opts = {
            virt_text = { { body, HL_BODY } },
            virt_text_pos = 'overlay',
            priority = 10000,
        },
    }

    -- Hide everything after the first content line (rest of content +
    -- closing fence). Omit end_row/end_col so `conceal_lines` applies only
    -- to this single row (with a range that crosses to the next row,
    -- conceal_lines hides the next row too — which would eat the blank
    -- separator line that follows the block).
    for row = content_row + 1, end_row - 1 do
        marks[#marks + 1] = {
            conceal = false,
            start_row = row,
            start_col = 0,
            opts = {
                conceal_lines = '',
            },
        }
    end

    return marks
end

return M
