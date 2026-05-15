-- md_blocks: registry-based dispatcher for custom fenced-code-block renderers.
-- Plug into render-markdown.nvim via:
--   custom_handlers = { markdown = { extends = true, parse = md_blocks.parse } }
-- and register per-language handlers with `md_blocks.register(name, fn)`.

local M = { registry = {} }

local query = vim.treesitter.query.parse('markdown', [[
    (fenced_code_block
        (info_string (language) @lang)
        (code_fence_content) @content) @block
]])

---@param name string                      info_string language to match
---@param fn fun(block: render.md.block_handler.Block): render.md.Mark[]|nil
function M.register(name, fn)
    M.registry[name] = fn
end

---@class render.md.block_handler.Block
---@field buf integer
---@field lang string
---@field content string
---@field block_node TSNode
---@field content_node TSNode

---@param ctx render.md.handler.Context
---@return render.md.Mark[]
function M.parse(ctx)
    local marks = {}
    for _, match in query:iter_matches(ctx.root, ctx.buf, 0, -1, { all = true }) do
        local lang_node = match[1] and match[1][1]
        local content_node = match[2] and match[2][1]
        local block_node = match[3] and match[3][1]
        if lang_node and content_node and block_node then
            local lang = vim.treesitter.get_node_text(lang_node, ctx.buf)
            local fn = M.registry[lang]
            if fn then
                local content = vim.treesitter.get_node_text(content_node, ctx.buf)
                local extra = fn({
                    buf = ctx.buf,
                    lang = lang,
                    content = content,
                    block_node = block_node,
                    content_node = content_node,
                })
                if extra then
                    vim.list_extend(marks, extra)
                end
            end
        end
    end
    return marks
end

return M
