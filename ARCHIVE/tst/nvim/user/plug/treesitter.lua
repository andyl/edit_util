-- plug/treesitter
-- cmds - :TSUpdate | :TSConfigInfo | :TSInstallInfo | :TSInstallSync

-- disable error highlighting for underscore characters in markdown text
-- example text: "http://google.com/search_documentation"

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.cmd("highlight link markdownError NONE")
    end,
})

-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/List-of-parsers
require('nvim-treesitter.configs').setup{
  ensure_installed = {
    "bash",
    "css",
    "csv",
    "eex",
    "elixir",
    "erlang",
    "hcl",
    "heex",
    "html",
    "javascript",
    "json",
    "ledger",
    "lua",
    "markdown",
    "query",
    "regex",
    "ruby",
    "rust",
    "scss",
    "toml",
    "vim",
    "yaml",
    "zig",
  },
  sync_install = true,
  auto_install = true,
  ignore_install = { },
  highlight = {
    enable = true,
    disable = { },
    additional_vim_regex_highlighting = false,
    custom_captures = {
      ["markdown.emphasis"] = nil,
      ["markdown_inline.emphasis"] = nil,
    },
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"},
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ab'] = '@block.outer',
        ['ib'] = '@block.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']]'] = '@function.outer',
        [']f'] = '@function.outer',
        [']b'] = '@block.outer',
      },
      goto_next_end = {
        [']['] = '@function.outer',
        [']F'] = '@function.outer',
        [']B'] = '@block.outer',
      },
      goto_previous_start = {
        ['[['] = '@function.outer',
        ['[f'] = '@function.outer',
        ['[b'] = '@block.outer',
      },
      goto_previous_end = {
        ['[]'] = '@function.outer',
        ['[F'] = '@function.outer',
        ['[B'] = '@block.outer',
      },
    },
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
}

