-- key/map_z

local opts1 =  {

    -- { "ga", ":lua AiderOpen()<cr>",          desc = "Open Aider"             },
    --
    -- { "gf", group = "File"                                                   },
    -- { "gfE", ":lua OpenCursorPath('E')<cr>", desc = "Open file and set WD"   },
    -- { "gfF", ":lua OpenCursorPath('F')<cr>", desc = "Open file and set WD"   },
    -- { "gfS", ":lua OpenCursorPath('S')<cr>", desc = "Open file and set WD"   },
    -- { "gfT", ":lua OpenCursorPath('T')<cr>", desc = "Open file and set WD"   },
    -- { "gfV", ":lua OpenCursorPath('V')<cr>", desc = "Open file and set WD"   },
    -- { "gfe", ":lua OpenCursorPath('e')<cr>", desc = "Open file under cursor" },
    -- { "gff", ":lua OpenCursorPath('f')<cr>", desc = "Open file under cursor" },
    -- { "gfs", ":lua OpenCursorPath('s')<cr>", desc = "Open file in split"     },
    -- { "gft", ":lua OpenCursorPath('t')<cr>", desc = "Open file in tab"       },
    -- { "gfv", ":lua OpenCursorPath('v')<cr>", desc = "Open file in vsplit"    },
    --
    -- { "gp", group = "Setwd to Project"                                                           },
    -- { "gpb", ":lua SetwdBufferPath()<cr>", desc = "Setwd to project root for the current buffer" },
    -- { "gpp", ":lua SetwdCursorPath()<cr>", desc = "Setwd to project directory under cursor"      },
    --
    -- { "gt", group = "TableMode"                        },
    -- { "gtd", ":TableModeDisable<cr>", desc = "Disable" },
    -- { "gte", ":TableModeEnable<cr>",  desc = "Enable"  },
    -- { "gtr", ":TableModeRealign<cr>", desc = "Realign" },
    -- { "gtt", ":TableModeToggle<cr>",  desc = "Toggle"  },
    --
    -- { "gx", "<Cmd>call jobstart(['xdg-open', expand('<cfile>')], {'detach': v:true})<CR>", desc = "Open URL in browser" },
    --
    -- { "gy", ":lua require('yazi').yazi(nil, vim.fn.getcwd())<cr>"},

  }

WhichKey.add(opts1)
