-- key/map_leader


-------------------------------------------------------------------------

local opts1 =  {
    { "<leader>#", group = "Find Prev"                             },
    { "<leader>#e", ":#",             desc = "Open Prev in Term"   },
    { "<leader>#s", ":sp<cr>#",       desc = "Open Prev in Split"  },
    { "<leader>#t", ":tabnew %<cr>#", desc = "Open Prev in Tab"    },
    { "<leader>#v", ":vsp<cr>#",      desc = "Open Prev in Vsplit" },

    { "<leader>*", group = "Find Next"                                           },
    { "<leader>*e", ":*",                          desc = "Open Next in Term"    },
    { "<leader>*s", ":sp<cr>*",                    desc = "Open Next in Split"   },
    { "<leader>*t", ":tabnew %<cr>*",              desc = "Open Next in Tab"     },
    { "<leader>*v", ":vsp<cr>*",                   desc = "Open Next in Vsplit"  },
    { "<leader>1", ":tabnext1<cr>",                desc = "Goto Tab 1"           },
    { "<leader>2", ":tabnext2<cr>",                desc = "Goto Tab 2"           },
    { "<leader>3", ":tabnext3<cr>",                desc = "Goto Tab 3"           },
    { "<leader>4", ":tabnext4<cr>",                desc = "Goto Tab 4"           },
    { "<leader>5", ":tabnext5<cr>",                desc = "Goto Tab 5"           },
    { "<leader>6", ":tabnext6<cr>",                desc = "Goto Tab 6"           },

    { "<leader>a", group = "Alternate File"                            },
    { "<leader>ae", ":A<cr>",                  desc = "Open in Term"   },
    { "<leader>as", ":AS<cr>",                 desc = "Open in Split"  },
    { "<leader>at", ":AT<cr>",                 desc = "Open in Tab"    },
    { "<leader>av", ":AV<cr>",                 desc = "Open in Vsplit" },

    { "<leader>b", "<cmd>BlameToggle<cr>", desc = "toggle blame window" },

    { "<leader>c", group = "Commands"                                     },
    { "<leader>cd", ":lua TermCmd('lazydocker')<cr>", desc = "lazydocker" },
    { "<leader>cg", ":LazyGit<cr>",                   desc = "lazygit"    },
    { "<leader>ch", ":lua TermCmd('htop')<cr>",       desc = "htop"       },
    { "<leader>cn", ":lua TermCmd('ncdu')<cr>",       desc = "ncdu"       },

    { "<leader>d", group = "Debugger"                                                             },
    { "<leader>db", ":lua require('dap').toggle_breakpoint()<cr>",     desc = "toggle breakpoint" },
    { "<leader>dc", ":lua require('dap').continue()<cr>",              desc = "continue"          },
    { "<leader>di", ":lua require('dap').step_into()<cr>",             desc = "step into"         },
    { "<leader>dk", ":lua require('dap.ui.widgets').hover()<cr>",      desc = "hover info"        },
    { "<leader>dl", ":lua require('dap').continue()<cr>",              desc = "link client"       },
    { "<leader>dn", ":lua require('dap').step_over()<cr>",             desc = "step over next"    },
    { "<leader>do", ":lua require('dap').step_out()<cr>",              desc = "step out"          },
    { "<leader>dr", ":lua require('dap.ui').repl()<cr>",               desc = "toggle repl"       },
    { "<leader>ds", ":lua require('osv').launch({ port = 8096 })<cr>", desc = "start server"      },

    { "<leader>e", "<cmd>Neotree toggle<cr>",                          desc = "Explorer Neotree" },

    { "<leader>f", group = "Find"                                                            },
    { "<leader>fC", "<cmd>Telescope commands<cr>",                          desc = "Commands"           },
    { "<leader>fc", "<cmd>Telescope command_history<cr>",                   desc = "Cmd History"        },
    { "<leader>fd", "<cmd>Telescope diagnostics<cr>",                       desc = "Diagnostics"        },
    { "<leader>ff", "<cmd>Telescope find_files<cr>",                        desc = "Files"              },
    { "<leader>fg", "<cmd>Telescope live_grep theme=ivy<cr>",               desc = "Grep Text"          },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>",                         desc = "Help Tags"          },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>",                           desc = "Keymaps"            },
    { "<leader>fm", "<cmd>Telescope oldfiles<cr>",                          desc = "MRU"                },
    { "<leader>fn", "<cmd>Telescope command_history<cr>",                   desc = "Normal Hist."       },
    { "<leader>fo", ":lua require('user.util.search_org').search_md()<cr>", desc = "Org Files"          },
    { "<leader>fp", ":lua ShowProjectPicker()<cr>",                         desc = "Projects"           },
    { "<leader>fq", "<cmd>Telescope quickfix<cr>",                          desc = "Quickfix"           },
    { "<leader>fr", "<cmd>Telescope registers<cr>",                         desc = "Registers"          },
    { "<leader>fs", "<cmd>Telescope search_history<cr>",                    desc = "Search Hist."       },
    { "<leader>fv", "<cmd>Telescope vim_options<cr>",                       desc = "Vim Opts"           },
    { "<leader>fy", "<cmd>Telescope yaml_schema<cr>",                       desc = "Select YAML schema" },

    { "<leader>g", group = "Git" },
    { "<leader>gb", "<cmd>BlameToggle<cr>",                      desc = "toggle blame window" },
    { "<leader>gr", ":lua require('gitsigns').reset_hunk()<cr>", desc = "reset hunk" },
    { "<leader>gs", ":lua require('gitsigns').stage_hunk()<cr>", desc = "stage hunk" },

    { "<leader>l", group = "Layout"                                                 },
    { "<leader>le", "<C-w>=",                              desc = "layout equalize" },
    { "<leader>lr", "<C-w>r",                              desc = "layout rotate"   },
    { "<leader>ls", "<C-w>J",                              desc = "layout split"    },
    { "<leader>lv", "<C-w>L",                              desc = "layout vertical" },
    { "<leader>lw", ":silent !kill -s SIGWINCH $PPID<cr>", desc = "window change"   },

    { "<leader>m", group = "Markdown"                                        },
    { "<leader>ms", ":MarkdownPreview<CR>",     desc = "preview start"       },
    { "<leader>mx", ":MarkdownPreviewStop<CR>", desc = "preview stop"        },

    { "<leader>o", ":only<cr>", desc = "Pane Only" },
    { "<leader>O", ":only<cr>:Neotree toggle<cr>", desc = "Pane Only w/Explorer" },

    { "<leader>p", group = "Print"                                                                                                                                  },
    { "<leader>pl", ":! a2ps -c --highlight-level=none --sides=duplex -T 2 --line-numbers=1 --portrait --columns=1 --font-size=9 %<cr>",  desc = "Landscape"        },
    { "<leader>pp", ":! a2ps -c --highlight-level=none --sides=duplex -T 2 --line-numbers=1 %<cr>",                                       desc = "Portrait"         },
    { "<leader>ps", ":! a2ps -c --highlight-level=none --sides=duplex -T 2 --line-numbers=1 --landscape --columns=1 --font-size=9 %<cr>", desc = "Single Landscape" },

    { "<leader>q", ":q<cr>", desc = "Pane Quit" },

    { "<leader>s", ":sp<cr>", desc = "Pane Split" },

    { "<leader>t", group = "Tab"                                                                 },
    { "<leader>tH", ":tabfirst<cr>",                    desc = "Jump to First"                   },
    { "<leader>tL", ":tablast<cr>",                     desc = "Jump to Last"                    },
    { "<leader>tO", ":tabnew %<cr>:Neotree toggle<cr>", desc = "Open pane in New Tab w/Explorer" },
    { "<leader>th", ":tabprev<cr>",                     desc = "Jump Left"                       },
    { "<leader>tl", ":tabnext<cr>",                     desc = "Jump Right"                      },
    { "<leader>tn", ":tabnew<cr>",                      desc = "New"                             },
    { "<leader>to", ":tabnew %<cr>",                    desc = "Open pane in New Tab"            },
    { "<leader>tx", ":tabclose<cr>",                    desc = "Close"                           },

    { "<leader>v", ":vsp<cr>", desc = "Pane Vsplit" },

    { "<leader>x", group = "CrossCopy"                                                      },
    { "<leader>xd", 'd:call writefile(split(@1,"\\n"), "/tmp/vimtmp")<cr>', desc = "delete" },
    { "<leader>xp", ":r /tmp/vimtmp<cr>",                                   desc = "paste"  },
    { "<leader>xy", 'y:call writefile(split(@0,"\\n"), "/tmp/vimtmp")<cr>', desc = "yank"   },
  }

WhichKey.add(opts1)

-------------------------------------------------------------------------

local opts2 =  {
    {
      mode = { "v" },

      { "<leader>x", group = "CrossCopy", mode = { "v" },                                      },
      { "<leader>xd", 'd:call writefile(split(@1,"\\n"), "/tmp/vimtmp")<cr>', desc = "delete" },
      { "<leader>xy", 'y:call writefile(split(@0,"\\n"), "/tmp/vimtmp")<cr>', desc = "yank"   },

    },
  }

WhichKey.add(opts2)
