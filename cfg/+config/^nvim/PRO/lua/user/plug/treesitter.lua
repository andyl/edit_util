-- plug/treesitter
-- cmds - :TSUpdate | :TSConfigInfo | :TSInstallInfo | :TSInstallSync

-- disable error highlighting for underscore characters in markdown text
-- example text: "http://google.com/search_documentation"

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.cmd("highlight link markdownError NONE")
        -- WORKAROUND: Neovim 0.12.0 bug — treesitter highlighter crashes on
        -- markdown files with "attempt to call method 'range' (a nil value)"
        -- due to a race in markdown_inline language injection during rendering.
        -- This disables treesitter highlighting for markdown (falls back to vim
        -- regex highlighting). Safe to remove once the bug is fixed upstream.
        vim.treesitter.stop(0)
    end,
})

-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/List-of-parsers

require('nvim-treesitter.configs').setup{
  ensure_installed = {
    "bash",
    "beancount",
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
    "markdown_inline",
    "query",
    "regex",
    "ruby",
    "rust",
    "scss",
    "vimdoc",
    "toml",
    "vim",
    "yaml",
    "zig",
  },
  sync_install = true,
  auto_install = true,
  ignore_install = { },
  highlight = {
    enable = false,
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
}

