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

    {"-a", group = "Avante"                              },
    {"-ae", "<esc>:AvanteEdit<cr>", desc = "Avante Edit" },
  }
}

WhichKey.add(opts2)

