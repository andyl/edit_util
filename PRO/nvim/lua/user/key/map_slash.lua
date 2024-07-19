-- key/map_slash

local opts1 =   {
    { "\\a", group = "LSP Actions"                                                             },
    { "\\ac", ":lua vim.lsp.buf.code_action()<cr>",          desc = "Code Action"              },
    { "\\ad", ":lua vim.lsp.buf.references()<cr>",           desc = "Display References"       },
    { "\\af", ":lua vim.lsp.buf.format({async = true})<cr>", desc = "Reformat"                 },
    { "\\ak", ":lua vim.lsp.buf.hover()<cr>",                desc = "Doc Hover"                },
    { "\\al", ":lua vim.diagnostic.open_float()<cr>",        desc = "Current Line Diagnostics" },
    { "\\an", ":lua vim.diagnostic.goto_next()<cr>",         desc = "GotoNext Diagnostic"      },
    { "\\ap", ":lua vim.diagnostic.goto_prev()<cr>",         desc = "GotoPrev Diagnostic"      },
    { "\\ar", ":lua vim.lsp.buf.rename()<cr>",               desc = "Rename"                   },

    { "\\e", group = "Extensions"                         },
    { "\\el", ":Lazy<cr>",  desc = "Lazy Package Manager" },
    { "\\em", ":Mason<cr>", desc = "Mason LSP Manager"    },

    { "\\f", group = "LSP Find" },

    { "\\fc", group = "Calls"                                                                       },
    { "\\fca", ":lua require'telescope.builtin'.lsp_outgoing_calls()<cr>", desc = "Outgoing"        },
    { "\\fci", ":lua require'telescope.builtin'.lsp_incoming_calls()<cr>", desc = "Incoming"        },
    { "\\fd", ":lua require'telescope.builtin'.diagnostics()<cr>",         desc = "Diagnostics"     },
    { "\\fi", ":lua require'telescope.builtin'.lsp_implementations()<cr>", desc = "Implementations" },
    { "\\fr", ":lua require'telescope.builtin'.lsp_references()<cr>",      desc = "References"      },

    { "\\fs", group = "Symbols"                                                                          },
    { "\\fsd", ":lua require'telescope.builtin'.lsp_document_symbols()<cr>",          desc = "Document"  },
    { "\\fsw", ":lua require'telescope.builtin'.lsp_workspace_symbols()<cr>",         desc = "Workspace" },
    { "\\fsy", ":lua require'telescope.builtin'.lsp_dynamic_workspace_symbols()<cr>", desc = "Dynamic"   },

    { "\\fx", ":lua require'telescope.builtin'.lsp_definitions()<cr>", desc = "Definitions" },

    { "\\g", group = "GoTo Definition"                                                  },
    { "\\ge", ":lua vim.lsp.buf.definition()<cr>",                desc = "Current Pane" },
    { "\\gs", ":split | lua vim.lsp.buf.definition()<cr>",        desc = "Split"        },
    { "\\gt", ":vsplit | lua vim.lsp.buf.definition()<cr><C-W>T", desc = "Tab"          },
    { "\\gv", ":vsplit | lua vim.lsp.buf.definition()<cr>",       desc = "Vsplit"       },

    { "\\i", group = "Insert"                                       },
    { "\\id", ":r !w_date_tag<cr>kJA",   desc = "Date"              },
    { "\\iq", ":r !w_time_qhour<cr>kJA", desc = "Quarter-hour Time" },
    { "\\it", ":r !w_time_exact<cr>kJA", desc = "Exact Time"        },

    { "\\l", group = "LLM / ChatGPT"                                            },
    { "\\la", ":ChatGPTActAs<cr>",                desc = "ChatGPT ActAs"        },
    { "\\lc", ":ChatGPTCompleteCode<cr>",         desc = "ChatGPT CompleteCode" },
    { "\\le", ":ChatGPTEditWithInstructions<cr>", desc = "ChatGPT Edit"         },
    { "\\lg", ":ChatGPT<cr>",                     desc = "ChatGPT"              },

    { "\\lr", group = "Run"                                                  },
    { "\\lrr", ":ChatGPTRun code_readability<cr>", desc = "Code Readability" },
    { "\\lrt", ":ChatGPTRun add_tests<cr>",        desc = "Generate Tests"   },

    { "\\o", group = "Obsidian"                 },
    { "\\oo", ":! obs %<cr><cr>", desc = "Open" },

    { "\\t", group = "Terminal"                                      },
    { "\\tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float"  },
    { "\\ts", ":split | terminal<cr>A",              desc = "Split"  },
    { "\\tt", ":vsplit | terminal<cr><C-W>T",        desc = "Tab"    },
    { "\\tv", ":vsplit | terminal<cr>A",             desc = "Vsplit" },

    { "\\u", group = "UnitTest"                                                                  },
    { "\\uf", ":lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Current File"   },
    { "\\up", ":lua require('neotest').output_panel.toggle()<cr>",       desc = "Toggle Panel"   },
    { "\\us", ":lua require('neotest').output_summary.toggle()<cr>",     desc = "Toggle Summary" },
    { "\\ut", ":lua require('neotest').run.run()<cr>",                   desc = "Nearest Test"   },
    { "\\uw", ":lua require('neotest').watch.toggle()<cr>",              desc = "Toggle Watcher" },

    { "\\x", ":ToggleCheckbox<cr>", desc = "Toggle Checkbox" },
  }

WhichKey.add(opts1)

-------------------------------------------------------------------------------------------------

local opts2 =  {
    {
      mode = { "i" },
      { "\\i", group = "Insert"                                            },
      { "\\id", "<esc>:r !w_date_tag<cr>kJA",   desc = "Date"              },
      { "\\iq", "<esc>:r !w_time_qhour<cr>kJA", desc = "Quarter-hour Time" },
      { "\\it", "<esc>:r !w_time_exact<cr>kJA", desc = "Exact Time"        },
    },
  }

WhichKey.add(opts2)

-------------------------------------------------------------------------------------------------
local opts3 =  {

    {
      mode = { "v" },

      { "\\s", group = "Sort" },

      { "\\sa", group = "Ascending" },
      { "\\sa1", ":!sort -k1<CR>", desc = "Column 1" },
      { "\\sa2", ":!sort -k2<CR>", desc = "Column 2" },
      { "\\sa3", ":!sort -k3<CR>", desc = "Column 3" },
      { "\\sa4", ":!sort -k4<CR>", desc = "Column 4" },
      { "\\sa5", ":!sort -k5<CR>", desc = "Column 5" },
      { "\\sa6", ":!sort -k6<CR>", desc = "Column 6" },
      { "\\sa7", ":!sort -k7<CR>", desc = "Column 7" },
      { "\\sa8", ":!sort -k8<CR>", desc = "Column 8" },
      { "\\sa9", ":!sort -k9<CR>", desc = "Column 9" },

      { "\\sd", group = "Descending" },
      { "\\sd1", ":!sort -rk1<CR>", desc = "Column 1" },
      { "\\sd2", ":!sort -rk2<CR>", desc = "Column 2" },
      { "\\sd3", ":!sort -rk3<CR>", desc = "Column 3" },
      { "\\sd4", ":!sort -rk4<CR>", desc = "Column 4" },
      { "\\sd5", ":!sort -rk5<CR>", desc = "Column 5" },
      { "\\sd6", ":!sort -rk6<CR>", desc = "Column 6" },
      { "\\sd7", ":!sort -rk7<CR>", desc = "Column 7" },
      { "\\sd8", ":!sort -rk8<CR>", desc = "Column 8" },
      { "\\sd9", ":!sort -rk9<CR>", desc = "Column 9" },

      { "\\x", ":lua require('user.util.togglecheck').vtoggle()<cr>", desc = "Toggle Checkbox Block" },

    },
  }

WhichKey.add(opts3)
