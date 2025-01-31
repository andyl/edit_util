-- key/map_g

local n_opts = {
  mode    = "n",  -- NORMAL mode
  prefix  = "g",  -- 'g' key
  buffer  = nil,  -- Give a buffer num for buffer local mapping
  silent  = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait  = true, -- use `nowait` when creating keymaps
}

local n_keymap = {

  -- reference https://sbulav.github.io/vim/neovim-opening-urls/
  -- this is for opening URLs in the browser
  -- to use: in normal mode, put cursor over URL, then type 'gx'
  -- also note: gf jumps to file under cursor
  x = { "<Cmd>call jobstart(['xdg-open', expand('<cfile>')], {'detach': v:true})<CR>",
    "Open URL in browser" },


  f = { -- Files
    name = "File",
    f = { ":lua OpenCursorPath('f')<cr>", "Open file under cursor" },
    e = { ":lua OpenCursorPath('e')<cr>", "Open file under cursor" },
    v = { ":lua OpenCursorPath('v')<cr>", "Open file in vsplit" },
    s = { ":lua OpenCursorPath('s')<cr>", "Open file in split" },
    t = { ":lua OpenCursorPath('t')<cr>", "Open file in tab" },
    F = { ":lua OpenCursorPath('F')<cr>", "Open file and set WD" },
    E = { ":lua OpenCursorPath('E')<cr>", "Open file and set WD" },
    V = { ":lua OpenCursorPath('V')<cr>", "Open file and set WD" },
    S = { ":lua OpenCursorPath('S')<cr>", "Open file and set WD" },
    T = { ":lua OpenCursorPath('T')<cr>", "Open file and set WD" },
  },

  p = { -- Projects
    name = "Setwd to Project",
    p = { ":lua SetwdCursorPath()<cr>",                 "Setwd to project directory under cursor" },
    b = { ":lua SetwdBufferPath()<cr>",                 "Setwd to project root for the current buffer" },
    h = { ":edit ~/.local/share/nvim/projhist.txt<cr>", "Edit project history file" },
  },

  t = { -- Table Mode
    name = "TableMode",
    d = { ":TableModeDisable<cr>", "Disable" },
    e = { ":TableModeEnable<cr>" , "Enable" },
    r = { ":TableModeRealign<cr>", "Realign" },
    t = { ":TableModeToggle<cr>" , "Toggle" },
  },

}

if WhichKeyOk then WhichKey.register(n_keymap, n_opts) end
