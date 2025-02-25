-- md_peek
--
-- Markdown peek plugin
--
-- https://github.com/toppair/peek.nvim
--
-- key definitions at `lua/user/key/map_leader.lua`
--
--------------------------------------------------------------------
return {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
        require("peek").setup()
        vim.api.nvim_create_user_command("MarkdownOpen", require("peek").open, {})
        vim.api.nvim_create_user_command("MarkdownClose", require("peek").close, {})
    end
}
