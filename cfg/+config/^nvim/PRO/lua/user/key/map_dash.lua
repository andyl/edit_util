-- key/map_dash

local opts1 = {
  {"-1", ":tabnext1<cr>",                            desc = "Goto Tab 1"              },
  {"-2", ":tabnext2<cr>",                            desc = "Goto Tab 2"              },
  {"-3", ":tabnext3<cr>",                            desc = "Goto Tab 3"              },
  {"-4", ":tabnext4<cr>",                            desc = "Goto Tab 4"              },
  {"-5", ":tabnext5<cr>",                            desc = "Goto Tab 5"              },
  {"-6", ":tabnext6<cr>",                            desc = "Goto Tab 6"              },
  {"-r", "<cmd>lua require('spectre').toggle()<cr>", desc = "Replace across Projects" },
}

WhichKey.add(opts1)

