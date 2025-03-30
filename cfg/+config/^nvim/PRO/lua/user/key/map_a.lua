-- key/map_a

-- at = align table
-- usage: vipat
-- ad = align dash
-- usage: vipad
-- ac = align comma
-- usage: vipac
-- ai = align interactive
-- usage: vipai
-- af = align format
-- usage: vipaf

local opts1 = {
  {
    mode = { "v" },

    { "ac",  group = "Align Column"                                   },
    { "ac,", ":EasyAlign *,<cr>",   desc = "Align Column Comma"       },
    { "aci", ":EasyAlign ",         desc = "Align Column Interactive" },
    { "act", ":EasyAlign *\\|<cr>", desc = "Align Column Table"       },
    { "ac|", ":EasyAlign *\\|<cr>", desc = "Align Column Table"       },
    { "ac}", ":EasyAlign }<cr>",    desc = "Align Column Paren"       },

  }
}

WhichKey.add(opts1)
