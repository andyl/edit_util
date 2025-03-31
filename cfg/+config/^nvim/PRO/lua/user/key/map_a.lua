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

-- vim.cmd ":vmap at :EasyAlign *\\|<cr>"

local function run_interactive()
  vim.fn.feedkeys(":EasyAlign ")
end

local opts1 = {
  {
    mode = { "v" },

    { "ac",  group = "Align Column"                                 },
    { "ac,", ":EasyAlign *,<cr>", desc = "Align Column Comma"       },
    { "aca", ":EasyAlign *a<cr>", desc = "Align Column Arrow ->"    },
    { "acp", ":EasyAlign *p<cr>", desc = "Align Column Pipe |>"     },
    { "act", ":EasyAlign *|<cr>", desc = "Align Column Table"       },
    { "ac|", ":EasyAlign *|<cr>", desc = "Align Column Table"       },
    { "ac}", ":EasyAlign }<cr>",  desc = "Align Column Paren"       },
    { "ac=", ":EasyAlign =<cr>",  desc = "Align Column Equals"      },
    { "aci", run_interactive,     desc = "Align Column Interactive" },

 }
}

WhichKey.add(opts1)

