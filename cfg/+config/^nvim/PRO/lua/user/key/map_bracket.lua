-- Nav using bracket [ ]

-- INSPIRED BY 'UNIMPAIRED.VIM' BY TIM POPE

local opts1 = {
  {"[b", ":bprevious<cr>",          desc = "Buffers :bprevious"  },
  {"[B", ":bfirst<cr>",             desc = "Buffers :bfirst"     },
  {"[g", ":Gitsigns next_hunk<cr>", desc = "Gitsigns next_hunk"  },
  {"[t", ":tabprev<cr>",            desc = "Tabs :tabprev"       },
  {"[T", ":tabfirst<cr>",           desc = "Tabs :tabfirst"      },
  {"[q", ":cprevious<cr>",          desc = "Quickfix :cprevious" },
  {"[Q", ":cfirst<cr>",             desc = "Quickfix :cfirst"    }
}

WhichKey.add(opts1)

------------------------------------------------------------------------

local opts2 = {
  {"]b", ":bnext<cr>",              desc = "Buffers :bnext"     },
  {"]B", ":blast<cr>",              desc = "Buffers :blast"     },
  {"]g", ":Gitsigns prev_hunk<cr>", desc = "Gitsigns prev_hunk" },
  {"]t", ":tabnext<cr>",            desc = "Tabs :tabnext"      },
  {"]T", ":tablast<cr>",            desc = "Tabs :tablast"      },
  {"]q", ":cnext<cr>",              desc = "Quickfix :cnext"    },
  {"]Q", ":clast<cr>",              desc = "Quickfix :clast"    }
}

WhichKey.add(opts2)
