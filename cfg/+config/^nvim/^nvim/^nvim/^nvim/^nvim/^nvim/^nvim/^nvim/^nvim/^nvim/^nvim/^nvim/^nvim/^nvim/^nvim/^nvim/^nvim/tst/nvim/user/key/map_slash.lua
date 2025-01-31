-- key/map_slash

local n_opts = {
  mode    = "n",     -- NORMAL mode
  prefix  = "\\",    -- slash key
  buffer  = nil,     -- Give a buffer num for buffer local mapping
  silent  = true,    -- use `silent` when creating keymaps
  noremap = true,    -- use `noremap` when creating keymaps
  nowait  = true,    -- use `nowait` when creating keymaps
}

local n_keymap = {

  a = { -- LSP Actions
    name = "LSP Actions",
    c = { ":lua vim.lsp.buf.code_action()<cr>",          "Code Action"              },
    d = { ":lua vim.lsp.buf.references()<cr>",           "Display References"       },
    f = { ":lua vim.lsp.buf.format({async = true})<cr>", "Reformat"                 },
    k = { ":lua vim.lsp.buf.hover()<cr>",                "Doc Hover"                },
    l = { ":lua vim.diagnostic.open_float()<cr>",        "Current Line Diagnostics" },
    n = { ":lua vim.diagnostic.goto_next()<cr>",         "GotoNext Diagnostic"      },
    p = { ":lua vim.diagnostic.goto_prev()<cr>",         "GotoPrev Diagnostic"      },
    r = { ":lua vim.lsp.buf.rename()<cr>",               "Rename"                   },
  },

  e = { -- Extensions
    name = "Extensions",
    l = { ":Lazy<cr>",         "Lazy Package Manager"      },
    m = { ":Mason<cr>",        "Mason LSP Manager"         },
  },

  f = { -- LSP Find with Telescope
    name = "LSP Find",
    r = { ":lua require'telescope.builtin'.lsp_references()<cr>",      "References"      },
    d = { ":lua require'telescope.builtin'.diagnostics()<cr>",         "Diagnostics"     },
    i = { ":lua require'telescope.builtin'.lsp_implementations()<cr>", "Implementations" },
    x = { ":lua require'telescope.builtin'.lsp_definitions()<cr>",     "Definitions"     },
    s = { -- Symbols
      name = "Symbols",
      ["d"] = {":lua require'telescope.builtin'.lsp_document_symbols()<cr>",          "Document"  },
      ["w"] = {":lua require'telescope.builtin'.lsp_workspace_symbols()<cr>",         "Workspace" },
      ["y"] = {":lua require'telescope.builtin'.lsp_dynamic_workspace_symbols()<cr>", "Dynamic"   },
    },
    c = { -- Calls
      name = "Calls",
      ["a"] = {":lua require'telescope.builtin'.lsp_outgoing_calls()<cr>", "Outgoing"},
      ["i"] = {":lua require'telescope.builtin'.lsp_incoming_calls()<cr>", "Incoming"},
    },
  },

  g = { -- LSP Goto Definition
    name = "GoTo Definition",
    e = { ":lua vim.lsp.buf.definition()<cr>"               , "Current Pane" },
    s = { ":split  | lua vim.lsp.buf.definition()<cr>"      , "Split"        },
    v = { ":vsplit | lua vim.lsp.buf.definition()<cr>"      , "Vsplit"       },
    t = { ":vsplit | lua vim.lsp.buf.definition()<cr><C-W>T", "Tab"          },
  },

  i = { -- Insert
    name = "Insert",
    d = { ":r !w_date_tag<cr>kJA",   "Date"              },
    t = { ":r !w_time_exact<cr>kJA", "Exact Time"        },
    q = { ":r !w_time_qhour<cr>kJA", "Quarter-hour Time" },
  },

  l = { -- LLM / ChatGPT
    name = "LLM / ChatGPT",
    a = { ":ChatGPTActAs<cr>",                       "ChatGPT ActAs"         },
    c = { ":ChatGPTCompleteCode<cr>",                "ChatGPT CompleteCode"  },
    e = { ":ChatGPTEditWithInstructions<cr>",        "ChatGPT Edit"          },
    g = { ":ChatGPT<cr>",                            "ChatGPT"               },
    r = { -- ChatGPT Run
      name = "Run",
      ["t"] = {":ChatGPTRun add_tests<cr>",          "Generate Tests"    },
      ["r"] = {":ChatGPTRun code_readability<cr>",   "Code Readability"  },
    },
  },

  o = { -- Obsidian
    name = "Obsidian",
    o = { ":! obs %<cr><cr>", "Open" },
  },

  u = { -- Unit Test
    name = "UnitTest",
    f = { ":lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Current File"    },
    t = { ":lua require('neotest').run.run()<cr>",                   "Nearest Test"    },
    w = { ":lua require('neotest').watch.toggle()<cr>",              "Toggle Watcher"  },
    p = { ":lua require('neotest').output_panel.toggle()<cr>",       "Toggle Panel"    },
    s = { ":lua require('neotest').output_summary.toggle()<cr>",     "Toggle Summary"  },
  },

  t = { -- Terminal Management
    name = "Terminal",
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float"  },
    s = { ":split  | terminal<cr>A"            , "Split"  },
    v = { ":vsplit | terminal<cr>A"            , "Vsplit" },
    t = { ":vsplit | terminal<cr><C-W>T"       , "Tab"    },
  },

  x = { ":ToggleCheckbox<cr>", "Toggle Checkbox"},

}

if WhichKeyOk then WhichKey.register(n_keymap, n_opts) end

local i_opts = {
  mode    = "i",     -- INSERT mode
  prefix  = "\\",    -- slash key
  buffer  = nil,     -- Give a buffer num for buffer local mapping
  silent  = true,    -- use `silent` when creating keymaps
  noremap = true,    -- use `noremap` when creating keymaps
  nowait  = true,    -- use `nowait` when creating keymaps
}


local i_keymap = {

  i = { -- Insert
    name = "Insert",
    d = { "<esc>:r !w_date_tag<cr>kJA",   "Date"              },
    t = { "<esc>:r !w_time_exact<cr>kJA", "Exact Time"        },
    q = { "<esc>:r !w_time_qhour<cr>kJA", "Quarter-hour Time" },
  },

}


if WhichKeyOk then WhichKey.register(i_keymap, i_opts) end

local v_opts = {
  mode    = "v",     -- VISUAL mode
  prefix  = "\\",    -- slash key
  buffer  = nil,     -- Give a buffer num for buffer local mapping
  silent  = true,    -- use `silent` when creating keymaps
  noremap = true,    -- use `noremap` when creating keymaps
  nowait  = true,    -- use `nowait` when creating keymaps
}

local v_keymap = {

  s = { -- Sort
    name = "Sort",
    a = { -- Ascending
      name = "Ascending",
      ["1"] = {":!sort -k1<CR>", "Column 1"},
      ["2"] = {":!sort -k2<CR>", "Column 2"},
      ["3"] = {":!sort -k3<CR>", "Column 3"},
      ["4"] = {":!sort -k4<CR>", "Column 4"},
      ["5"] = {":!sort -k5<CR>", "Column 5"},
      ["6"] = {":!sort -k6<CR>", "Column 6"},
      ["7"] = {":!sort -k7<CR>", "Column 7"},
      ["8"] = {":!sort -k8<CR>", "Column 8"},
      ["9"] = {":!sort -k9<CR>", "Column 9"},
    },
    d = { -- Descending
      name = "Descending",
      ["1"] = {":!sort -rk1<CR>", "Column 1"},
      ["2"] = {":!sort -rk2<CR>", "Column 2"},
      ["3"] = {":!sort -rk3<CR>", "Column 3"},
      ["4"] = {":!sort -rk4<CR>", "Column 4"},
      ["5"] = {":!sort -rk5<CR>", "Column 5"},
      ["6"] = {":!sort -rk6<CR>", "Column 6"},
      ["7"] = {":!sort -rk7<CR>", "Column 7"},
      ["8"] = {":!sort -rk8<CR>", "Column 8"},
      ["9"] = {":!sort -rk9<CR>", "Column 9"},
    },
  },

  x = { ":lua require('user.util.togglecheck').vtoggle()<cr>", "Toggle Checkbox Block"},

}

if WhichKeyOk then WhichKey.register(v_keymap, v_opts) end

