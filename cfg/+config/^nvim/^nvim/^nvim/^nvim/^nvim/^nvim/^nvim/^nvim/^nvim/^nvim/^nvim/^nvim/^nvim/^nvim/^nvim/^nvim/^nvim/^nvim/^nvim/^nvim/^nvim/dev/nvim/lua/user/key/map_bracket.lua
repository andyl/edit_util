-- Nav using bracket [ ]

-- INSPIRED BY 'UNIMPAIRED.VIM' BY TIM POPE

local nl_opts = {
  mode    = "n",     -- NORMAL mode
  prefix  = "[",     -- left bracket
  buffer  = nil,     -- Give a buffer num for buffer local mapping
  silent  = true,    -- use `silent` when creating keymaps
  noremap = true,    -- use `noremap` when creating keymaps
  nowait  = true,    -- use `nowait` when creating keymaps
}

local nl_keymap = {
  ["b"] = {":bprevious<cr>",          "Buffers :bprevious"},
  ["B"] = {":bfirst<cr>",             "Buffers :bfirst"},
  ["g"] = {":Gitsigns next_hunk<cr>", "Gitsigns next_hunk"},
  ["t"] = {":tabprev<cr>",            "Tabs :tabprev"},
  ["T"] = {":tabfirst<cr>",           "Tabs :tabfirst"},
  ["q"] = {":cprevious<cr>",          "Quickfix :cprevious"},
  ["Q"] = {":cfirst<cr>",             "Quickfix :cfirst"}

}

if WhichKeyOk then WhichKey.register(nl_keymap, nl_opts) end

------------------------------------------------------------------------

local nr_opts = {
  mode    = "n",     -- NORMAL mode
  prefix  = "]",     -- left bracket
  buffer  = nil,     -- Give a buffer num for buffer local mapping
  silent  = true,    -- use `silent` when creating keymaps
  noremap = true,    -- use `noremap` when creating keymaps
  nowait  = true,    -- use `nowait` when creating keymaps
}

local nr_keymap = {
  ["b"] = {":bnext<cr>",              "Buffers :bnext"},
  ["B"] = {":blast<cr>",              "Buffers :blast"},
  ["g"] = {":Gitsigns prev_hunk<cr>", "Gitsigns prev_hunk"},
  ["t"] = {":tabnext<cr>",            "Tabs :tabnext"},
  ["T"] = {":tablast<cr>",            "Tabs :tablast"},
  ["q"] = {":cnext<cr>",              "Quickfix :cnext"},
  ["Q"] = {":clast<cr>",              "Quickfix :clast"}
}

if WhichKeyOk then WhichKey.register(nr_keymap, nr_opts) end

