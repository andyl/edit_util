-- key/map_dash

local opts1 = {
  {"-a", group = "Avante"                               },
  {"-aa", ":AvanteAsk<cr>",     desc = "Avante Ask"     },
  {"-ae", ":AvanteEdit<cr>",    desc = "Avante Edit"    },
  {"-ar", ":AvanteRefresh<cr>", desc = "Avante Refresh" },
  {"-at", ":AvanteToggle<cr>",  desc = "Avante Toggle"  },

  {"-r", "<cmd>lua require('spectre').toggle()<cr>", desc = "Replace across Projects" },
}

WhichKey.add(opts1)

-------------------------------------------------------------------------

local opts2 = {
  {
    mode = { "v" },

    {"-a", group = "Avante"                         },
    {"-ae", ":AvanteEdit<cr>", desc = "Avante Edit" },
  }
}

WhichKey.add(opts2)

-------------------------------------------------------------------------

local function run_interactive()
  vim.fn.feedkeys(":EasyAlign ")
end

local opts3 = {
  {
    mode = { "v" },

    { "-c",  group = "Column Align"                                 },
    { "-ca", ":EasyAlign *a<cr>", desc = "Column Align Arrow ->"    },
    { "-cp", ":EasyAlign *p<cr>", desc = "Column Align Pipe |>"     },
    { "-ct", ":EasyAlign *|<cr>", desc = "Column Align Table"       },
    { "-c,", ":EasyAlign *,<cr>", desc = "Column Align Comma"       },
    { "-c|", ":EasyAlign *|<cr>", desc = "Column Align Table"       },
    { "-c}", ":EasyAlign }<cr>",  desc = "Column Align Paren"       },
    { "-c=", ":EasyAlign =<cr>",  desc = "Column Align Equals"      },
    { "-ci", run_interactive,     desc = "Column Align Interactive" },

 }
}

WhichKey.add(opts3)

