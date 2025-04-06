-- key/map_dash

-- local opts1 = {
--
--   {"-a", group = "Avante"                                         },
--   {"-aa", ":AvanteAsk<cr>",         desc = "Avante Ask"           },
--   {"-ac", ":AvanteChat<cr>",        desc = "Avante Chat"          },
--   {"-ae", ":AvanteEdit<cr>",        desc = "Avante Edit"          },
--   {"-af", ":AvanteFocus<cr>",       desc = "Avante Focus"         },
--   {"-am", ":AvanteModels<cr>",      desc = "Avante Models"        },
--   {"-ar", ":AvanteRefresh<cr>",     desc = "Avante Refresh"       },
--   {"-as", ":AvanteShowRepoMap<cr>", desc = "Avante Show Repo Map" },
--   {"-at", ":AvanteToggle<cr>",      desc = "Avante Toggle"        },
--
--   {"-r", "<cmd>lua require('spectre').toggle()<cr>", desc = "Replace across Projects" },
--
-- }
--
-- WhichKey.add(opts1)
--
-- -------------------------------------------------------------------------
--
-- local opts2 = {
--   {
--     mode = { "v" },
--
--     {"-a", group = "Avante"                         },
--     {"-ae", ":AvanteEdit<cr>", desc = "Avante Edit" },
--   }
-- }
--
-- WhichKey.add(opts2)

-------------------------------------------------------------------------

local function run_interactive()
  vim.fn.feedkeys(":EasyAlign ")
end

local opts3 = {
  {
    mode = { "v" },

    { "-c",  group = "Column Align" },
    { "-ca",  ":EasyAlign *aa<cr>", desc = "Column Align Arrows"},
    { "-ct",  ":EasyAlign *|<cr>",  desc = "Column Align Table"            },
    { "-c|",  ":EasyAlign *|<cr>",  desc = "Column Align Table"            },
    { "-c}",  ":EasyAlign }<cr>",   desc = "Column Align Paren"            },
    { "-c,",  ":EasyAlign *,<cr>",  desc = "Column Align Comma"            },
    { "-c:",  ":EasyAlign :<cr>",   desc = "Column Align Colon"            },
    { "-c=",  ":EasyAlign =<cr>",   desc = "Column Align Equals"           },
    { "-ci",  run_interactive,      desc = "Column Align Interactive"      },

 }
}

WhichKey.add(opts3)

