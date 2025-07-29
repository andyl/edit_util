-- key/map_dash

local opts0 = {

  {"-r", "<cmd>lua require('spectre').toggle()<cr>", desc = "Replace across Projects" },
  {"-g", "<cmd>GrugFar<cr>",                         desc = "Replace across Projects/GF" },

}

WhichKey.add(opts0)

-------------------------------------------------------------------------

local function run_interactive()
  vim.fn.feedkeys(":EasyAlign ")
end

-- NOTE: the AlignArrows operation uses a custom EasyAlign delimeter
-- "aa" defined in `edit_easy_align.lua`
-- Also see the key definitions in `map_base.lua`

local opts1 = {
  {
    mode = { "v" },

    { "-c",  group = "Column Align"                                  },
    { "-ca", ":EasyAlign *aa<cr>", desc = "Column Align Arrows"      },
    { "-ct", ":EasyAlign *|<cr>",  desc = "Column Align Table"       },
    { "-c|", ":EasyAlign *|<cr>",  desc = "Column Align Table"       },
    { "-c}", ":EasyAlign }<cr>",   desc = "Column Align Paren"       },
    { "-c,", ":EasyAlign *,<cr>",  desc = "Column Align Comma"       },
    { "-c:", ":EasyAlign :<cr>",   desc = "Column Align Colon"       },
    { "-c#", ":EasyAlign #<cr>",   desc = "Column Align Hash"        },
    { "-c=", ":EasyAlign =<cr>",   desc = "Column Align Equals"      },
    { "-ci", run_interactive,      desc = "Column Align Interactive" },

 }
}

WhichKey.add(opts1)

