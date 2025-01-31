-- key/map_leader

local n_opts = {
  mode    = "n",        -- NORMAL mode
  prefix  = "<leader>", -- leader key ","
  buffer  = nil,        -- Specify a buffer num for buffer local mapping
  silent  = true,       -- use `silent` when creating keymaps
  noremap = true,       -- use `noremap` when creating keymaps
  nowait  = true,       -- use `nowait` when creating keymaps
}

local v_opts = {
  mode    = "v",        -- VISUAL mode
  prefix  = "<leader>", -- leader key ","
  buffer  = nil,        -- Specify a buffer num for buffer local mapping
  silent  = true,       -- use `silent` when creating keymaps
  noremap = true,       -- use `noremap` when creating keymaps
  nowait  = true,       -- use `nowait` when creating keymaps
}

local keytable_n = {

  ["1"] = { ":tabnext1<cr>",                "Goto Tab 1"           },
  ["2"] = { ":tabnext2<cr>",                "Goto Tab 2"           },
  ["3"] = { ":tabnext3<cr>",                "Goto Tab 3"           },
  ["4"] = { ":tabnext4<cr>",                "Goto Tab 4"           },
  ["5"] = { ":tabnext5<cr>",                "Goto Tab 5"           },
  ["6"] = { ":tabnext6<cr>",                "Goto Tab 6"           },
  ["q"] = { ":q<cr>",                       "Pane Quit"            },
  ["e"] = { "<cmd>NvimTreeToggle<cr>",      "Explorer"             },
  ["s"] = { ":sp<cr>",                      "Pane Split"           },
  ["v"] = { ":vsp<cr>",                     "Pane Vsplit"          },
  ["o"] = { ":only<cr>",                    "Pane Only"            },
  ["O"] = { ":only<cr>:NvimTreeToggle<cr>", "Pane Only w/Explorer" },

  a = { -- ALT-FILE - vim_projecionist - navigation between SRC and TEST files
    name = "Alternate File",
    e = { ":A<cr>",  "Open in Term"   },
    v = { ":AV<cr>", "Open in Vsplit" },
    s = { ":AS<cr>", "Open in Split"  },
    t = { ":AT<cr>", "Open in Tab"    },
  },

  d = { -- DEBUGGER / DAP
    name = "Debugger",
    b = { ":lua require('dap').toggle_breakpoint()<cr>",     "toggle breakpoint" },
    c = { ":lua require('dap').continue()<cr>",              "continue"          },
    n = { ":lua require('dap').step_over()<cr>",             "step over next"    },
    i = { ":lua require('dap').step_into()<cr>",             "step into"         },
    k = { ":lua require('dap.ui.widgets').hover()<cr>",      "hover info"        },
    l = { ":lua require('dap').continue()<cr>",              "link client"       },
    o = { ":lua require('dap').step_out()<cr>",              "step out"          },
    r = { ":lua require('dap.ui').repl()<cr>",               "toggle repl"       },
    s = { ":lua require('osv').launch({ port = 8096 })<cr>", "start server"      },
  },

  c = { -- COMMANDS - curses applications
    name = "Commands",
    d = { ":lua TermCmd('lazydocker')<cr>",  "lazydocker" },
    g = { ":lua TermCmd('lazygit')<cr>",     "lazygit"    },
    h = { ":lua TermCmd('htop')<cr>",        "htop"       },
    n = { ":lua TermCmd('ncdu')<cr>",        "ncdu"       },
  },

  f = { -- FIND - telescope - fuzzy finders
    name = "Find",
    b = { "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Buffers"      },
    c = { "<cmd>Telescope command_history<cr>",                                                                             "Cmd History"  },
    C = { "<cmd>Telescope commands<cr>",                                                                                    "Commands"     },
    d = { "<cmd>Telescope diagnostics<cr>",                                                                                 "Diagnostics"  },
    f = { "<cmd>Telescope find_files<cr>",                                                                                  "Files"        },
    g = { "<cmd>Telescope live_grep theme=ivy<cr>",                                                                         "Grep Text"    },
    h = { "<cmd>Telescope help_tags<cr>",                                                                                   "Help Tags"    },
    k = { "<cmd>Telescope keymaps<cr>",                                                                                     "Keymaps"      },
    m = { "<cmd>Telescope oldfiles<cr>",                                                                                    "MRU"          },
    n = { "<cmd>Telescope command_history<cr>",                                                                             "Normal Hist." },
    o = { ":lua require('user.search_org').search_md()<cr>",                                                                "Org Files"    },
    p = { ":lua ShowProjectPicker()<cr>",                                                                                   "Projects"     },
    q = { "<cmd>Telescope quickfix<cr>",                                                                                    "Quickfix"     },
    r = { "<cmd>Telescope registers<cr>",                                                                                   "Registers"    },
    s = { "<cmd>Telescope search_history<cr>",                                                                              "Search Hist." },
    v = { "<cmd>Telescope vim_options<cr>",                                                                                 "Vim Opts"     },
  },

  g = { -- Git (Gitsigns)
    name = "Gitsigns",
    r = { ":lua require('gitsigns').reset_hunk()<cr>", "reset hunk"    },
    s = { ":lua require('gitsigns').stage_hunk()<cr>", "stage hunk"    },
  },

  l = { -- LAYOUT - pane layout
    name = "Layout",
    s = { "<C-w>J", "layout split"    },
    v = { "<C-w>L", "layout vertical" },
    r = { "<C-w>r", "layout rotate"   },
    e = { "<C-w>=", "layout equalize" },
    w = { ":silent !kill -s SIGWINCH $PPID<cr>", "window change" },
  },

  m = { -- MARKDOWN - markdown preview
    name = "Markdown",
    s = { ":MarkdownPreview<CR>"    , "preview start"    },
    x = { ":MarkdownPreviewStop<CR>", "preview stop"     },
  },

  p = { -- PRINT - print files
    name = "Print",
    p = { ":! a2ps -c --highlight-level=none --sides=duplex -T 2 --line-numbers=1 %<cr>",                                       "Portrait"         },
    l = { ":! a2ps -c --highlight-level=none --sides=duplex -T 2 --line-numbers=1 --portrait  --columns=1 --font-size=9 %<cr>", "Landscape"        },
    s = { ":! a2ps -c --highlight-level=none --sides=duplex -T 2 --line-numbers=1 --landscape --columns=1 --font-size=9 %<cr>", "Single Landscape" },
  },

  t = { -- TAB - tab manipulation and navigation
    name = "Tab",
    n = { ":tabnew<cr>",                      "New"                             },
    o = { ":tabnew %<cr>",                    "Open pane in New Tab"            },
    O = { ":tabnew %<cr>:NvimTreeToggle<cr>", "Open pane in New Tab w/Explorer" },
    x = { ":tabclose<cr>",                    "Close"                           },
    h = { ":tabprev<cr>",                     "Jump Left"                       },
    H = { ":tabfirst<cr>",                    "Jump to First"                   },
    l = { ":tabnext<cr>",                     "Jump Right"                      },
    L = { ":tablast<cr>",                     "Jump to Last"                    },
  },

  x = { -- CROSS-COPY - copy across vim instances using external file
    name = "CrossCopy",
    y = { "y:call writefile(split(@0,\"\\n\"), \"/tmp/vimtmp\")<cr>", "yank"   },
    d = { "d:call writefile(split(@1,\"\\n\"), \"/tmp/vimtmp\")<cr>", "delete" },
    p = { ":r /tmp/vimtmp<cr>",                                       "paste"  },
  },

  ["#"] = { -- FIND-Prev - find prev
    name = "Find Prev",
    e = { ":#",             "Open Prev in Term"   },
    v = { ":vsp<cr>#",      "Open Prev in Vsplit" },
    s = { ":sp<cr>#",       "Open Prev in Split"  },
    t = { ":tabnew %<cr>#", "Open Prev in Tab"    },
  },

  ["*"] = { -- FIND-Next - find next
    name = "Find Next",
    e = { ":*",             "Open Next in Term"   },
    v = { ":vsp<cr>*",      "Open Next in Vsplit" },
    s = { ":sp<cr>*",       "Open Next in Split"  },
    t = { ":tabnew %<cr>*", "Open Next in Tab"    },
  }
}

local keytable_v = {
  x = { -- CROSS-COPY - copy across vim instances using external file
    name = "CrossCopy",
    y = { "y:call writefile(split(@0,\"\\n\"), \"/tmp/vimtmp\")<cr>", "yank"   },
    d = { "d:call writefile(split(@1,\"\\n\"), \"/tmp/vimtmp\")<cr>", "delete" },
  }
}

if WhichKeyOk then WhichKey.register(keytable_n, n_opts) end
if WhichKeyOk then WhichKey.register(keytable_v, v_opts) end

-- TAB NAVIGATION
KmN("<leader>t1", "1gt")
KmN("<leader>t2", "2gt")
KmN("<leader>t3", "3gt")
KmN("<leader>t4", "4gt")
KmN("<leader>t5", "5gt")
KmN("<leader>t6", "6gt")
KmN("<leader>t7", "7gt")
KmN("<leader>t8", "8gt")
KmN("<leader>t9", "9gt")

