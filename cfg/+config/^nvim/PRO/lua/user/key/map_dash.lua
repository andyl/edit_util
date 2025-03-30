-- key/map_dash

local opts1 = {
  {"-a", group = "Avante"                                    },
  {"-aa", ":AvanteAsk<cr>",      desc = "Avante Ask"         },
  {"-ae", ":AvanteEdit<cr>",     desc = "Avante Edit"        },
  {"-ar", ":AvanteRefresh<cr>",  desc = "Avante Refresh"     },

  {"-r", "<cmd>lua require('spectre').toggle()<cr>", desc = "Replace across Projects" },
}

WhichKey.add(opts1)

