-- tabline
--------------------------------------------------------

local status_ok, tabline = pcall(require, "tabline")
if not status_ok then return end

tabline.setup({
    show_index = true,        -- show tab index
    show_modify = true,       -- show buffer modification indicator
    modify_indicator = '[+]', -- modify indicator
    no_name = '[<>]',    -- no name buffer name
})

