-- lazy_list - define list of Lazy Plugins

LazyOk, Lazy = pcall(require, "lazy")
if not LazyOk then return end

return Lazy.setup({ -- NEOVIM BASICS
'nvim-lua/popup.nvim',                   -- the vim Popup API
'nvim-lua/plenary.nvim',                 -- common lua functions
-- NVIM-TREE
'kyazdani42/nvim-web-devicons',          -- webfonts
'kyazdani42/nvim-tree.lua',              -- nvimtree file explorer
-- WHICH-KEY
'folke/which-key.nvim',                  -- key mapper and displayer
-- TREESITTER
'nvim-treesitter/nvim-treesitter',       -- syntax highlighter
'nvim-treesitter/playground',            -- display treesitter AST
'JoosepAlviste/nvim-ts-context-commentstring',
'nvim-treesitter/nvim-treesitter-textobjects',
-- LSP
'williamboman/mason.nvim',               -- package installer
'williamboman/mason-lspconfig.nvim',     -- language-server installer
'neovim/nvim-lspconfig',                 -- enable LSP servers and set properties
'nvimtools/none-ls.nvim',                -- for formatters and linters
-- NOICE
'MunifTanjim/nui.nvim',                  -- UI component library
'rcarriga/nvim-notify',                  -- notifications library
'folke/noice.nvim',                      -- command line & notifications
-- NEOVIM/TERMINAL
'benmills/vimux',                        -- tmux integration
{"akinsho/toggleterm.nvim", version = '*', config = true},
-- TELESCOPE
'nvim-telescope/telescope.nvim',         -- fuzzy finder
'axkirillov/easypick.nvim',              -- simple custom telescope pickers
-- GPT
"folke/trouble.nvim",                    -- GPT dependency
"jackMort/ChatGPT.nvim",                 -- GPT
-- NGINX
'chr4/nginx.vim',                        -- nginx config files
-- CMP/COMPLETION
'hrsh7th/nvim-cmp',                      -- the completion plugin
'hrsh7th/cmp-buffer',                    -- buffer completions
'hrsh7th/cmp-path',                      -- path completions
'hrsh7th/cmp-cmdline',                   -- cmdline completions
'hrsh7th/cmp-nvim-lsp',                  -- lsp integration
-- SNIPPETS
'L3MON4D3/LuaSnip',                      -- snippet engine
'saadparwaiz1/cmp_luasnip',              -- snippet completions
-- DEBUGGING
'mfussenegger/nvim-dap',                 -- debug adapter protocol
'jbyuki/one-small-step-for-vimkind',     -- debugger for lua & neovim plugins
'rcarriga/nvim-dap-ui',                  -- DAP ui
-- NEOVIM LUA DEVELOPMENT
'rafcamlet/nvim-luapad',                 -- neovim lua repl
'folke/neodev.nvim',                     -- lsp autocompletion for nvim lua API
-- OLLAMA
'nomnivore/ollama.nvim',                 -- ollama integration
-- GIT
'lewis6991/gitsigns.nvim',               -- git integration
-- STATUS LINES
'nvim-lualine/lualine.nvim',             -- status line
'crispgm/nvim-tabline',                  -- tab line
-- TEST
{dir = "~/src/Plugins/test1.nvim"},
-- INCREMENT/DECREMENT (C-a/C-x)
'tpope/vim-speeddating',                 -- dates
'triglav/vim-visual-increment',          -- visual selection - block of numbers
-- UTILITY
'andyl/nvls',                            -- test plugin
'andyl/al-gtd',                          -- GTD
-- EDITING UTILS
'dhruvasagar/vim-table-mode',            -- vim table mode
'junegunn/vim-easy-align',               -- column alignment
-- SEARCH AND NAV
'mileszs/ack.vim',                       -- ACK file search
'tpope/vim-projectionist',               -- alternate file nav
'andyl/fuzzy-projectionist.vim',         -- fzf meets projectionist (eg :Fmodel)
-- TEXT MANIPULATION
'kana/vim-textobj-user',                 -- customizable text objects
-- 'mattn/vim-textobj-url',                 -- au/iu
'tpope/vim-surround',                    -- edit containing objects
'tpope/vim-repeat',                      -- repeat support for plugins
-- LANG JSON
'tpope/vim-jdaddy',                      -- JSON text objects & formatting
-- LANG ELIXIR
'mhinz/vim-mix-format',                  -- wrapper to run mix format
'powerman/vim-plugin-AnsiEsc',           -- docco with ANSI colors
'elixir-editors/vim-elixir',             -- filetype detection
'andyl/vim-projectionist-elixir',        -- elixir file navigation
-- COLORSCHEMES
'junegunn/seoul256.vim',                 -- seoul256
'NLKNguyen/papercolor-theme',            -- PaperColor
'noahfrederick/vim-hemisu',              -- hemisu
'sjl/badwolf',                           -- badwolf
'tomasr/molokai',                        -- molokai
'morhetz/gruvbox',                       -- gruvbox
-- MARKDOWN / OBSIDIAN
-- 'epwalsh/obsidian.nvim',                 -- tag search
-- 'tpope/vim-markdown',                    -- syntax highlighting and folding
{
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  build = "cd app && yarn install",
  config = function() vim.g.mkdp_filetypes = { "markdown" } end,
},
'dkarter/bullets.vim',                   -- numbered lists and checkboxes
-- MISC
'chrisbra/unicode.vim',                  -- :SearchUni check|C-v u2705|✅
'moll/vim-bbye',                         -- delete buffer w/o closing win
'lewis6991/impatient.nvim',              -- fast startup
'antoinemadec/FixCursorHold.nvim',       -- needed to fix lsp doc highlight
'kshenoy/vim-signature',                 -- show marks in gutter
'terryma/vim-multiple-cursors',          -- multiple cursors
-- GIST
'rudylee/nvim-gist',                     -- post github gists
-- COMMENTS, AUTOPAIRS, LISTS
'windwp/nvim-autopairs',                 -- integrates with cmp and treesitter
'terrortylor/nvim-comment',              -- commenting tool
 })

