-- lazy_list - define list of Lazy Plugins

LazyOk, Lazy = pcall(require, "lazy")
if not LazyOk then return end

local opts = {
	-- NEOVIM BASICS
	require("user.lazy.base_popup"),      -- the vim Popup API
	require("user.lazy.base_plenary"),    -- common lua functions
	-- NVIM-TREE
	require("user.lazy.nvt_devicons"),    -- webfonts
	require("user.lazy.nvt_neotree"),     -- neotree (<leader>e)
	require("user.lazy.nvt_yazi"),        -- yazi (gy)
	-- TREESITTER
	require("user.lazy.ts_treesitter"),   -- syntax highlighter
	require("user.lazy.ts_playground"),   -- display treesitter AST
	require("user.lazy.ts_comment"),      -- TS commenting
	require("user.lazy.ts_textobj"),      -- TS text objects
	-- NEOVIM/TERMINAL
	require("user.lazy.term_tmux"),       -- tmux integration
	require("user.lazy.term_toggle"),     -- terminal toggle
	-- NOICE
	require("user.lazy.msg_noice"),       -- command line & notifications
	-- GIT
	require("user.lazy.git_signs"),       -- git change bars
	require("user.lazy.git_blame"),       -- git blame
	-- WHICH-KEY
	require("user.lazy.key_mini"),        -- utility modules for which_key
	require("user.lazy.key_which_key"),   -- key mapper and displayer
	-- LSP
	require("user.lazy.lsp_config"),      -- enable LSP servers and set properties
	require("user.lazy.lsp_mason"),       -- LSP server installer
	require("user.lazy.lsp_mason-cfg"),   -- LSP/Mason glue code
	require("user.lazy.lsp_none_ls"),     -- for formatters and linters
	-- CMP/COMPLETION
	require("user.lazy.cmp.snippets"),    -- snippet configuration
	require("user.lazy.cmp.core"),        -- plug config
  -- SESSIONS
  require("user.lazy.auto_session"),    -- automatic sessions
	-- TELESCOPE
  "nvim-telescope/telescope.nvim",      -- fuzzy finder
	"axkirillov/easypick.nvim",           -- simple custom telescope pickers
  -- AI Agents
  require("user.lazy.aider"),           -- aider: ML / AI interface
	-- require("user.lazy.avante"),          -- avante: Cursor-like ML / AI interface
	-- NGINX
	"chr4/nginx.vim",                     -- nginx config files
	-- DEBUGGING
	"mfussenegger/nvim-dap",              -- debug adapter protocol
	"jbyuki/one-small-step-for-vimkind",  -- debugger for lua & neovim plugins
	"rcarriga/nvim-dap-ui",               -- DAP ui
	-- NEOVIM LUA DEVELOPMENT
	"rafcamlet/nvim-luapad",              -- neovim lua repl
	"folke/neodev.nvim",                  -- lsp autocompletion for nvim lua API
	-- STATUS LINES
	"nvim-lualine/lualine.nvim",          -- status line
	"crispgm/nvim-tabline",               -- tab line
	-- INCREMENT/DECREMENT (C-a/C-x)
	"tpope/vim-speeddating",              -- increment/decrement dates
	"triglav/vim-visual-increment",       -- visual selection - block of numbers
	-- EDITING UTILS
	require("user.lazy.edit_table_mode"), -- vim table mode
	require("user.lazy.edit_easy_align"), -- column alignment
	require("user.lazy.edit_spectre"),    -- project-wide search/replace
	-- SEARCH AND NAV
	"mileszs/ack.vim",                    -- ACK file search
	"tpope/vim-projectionist",            -- alternate file nav
	"andyl/fuzzy-projectionist.vim",      -- fzf meets projectionist (eg :Fmodel)
	-- TEXT MANIPULATION
	"kana/vim-textobj-user",              -- customizable text objects
	"tpope/vim-surround",                 -- edit containing objects
	"tpope/vim-repeat",                   -- repeat support for plugins
	-- LANG JSON/YAML
	require("user.lazy.jy_jsonto"),       -- JSON text objects & formatting
	require("user.lazy.jy_schema"),       -- SchemaStore for JSON and YAML
  require("user.lazy.jy_ymlcom"),       -- yaml-companion.nvim
	-- LANG ELIXIR
	"mhinz/vim-mix-format",               -- wrapper to run mix format
	"powerman/vim-plugin-AnsiEsc",        -- docco with ANSI colors
	"elixir-editors/vim-elixir",          -- filetype detection
	"andyl/vim-projectionist-elixir",     -- elixir file navigation
  -- JUST / JUSTFILES
  require("user.lazy.just_just"),       -- justfile syntax highlighting
	-- COLORSCHEMES
	"junegunn/seoul256.vim",              -- seoul256
	"NLKNguyen/papercolor-theme",         -- PaperColor
	"noahfrederick/vim-hemisu",           -- hemisu
	"sjl/badwolf",                        -- badwolf
	"tomasr/molokai",                     -- molokai
	"morhetz/gruvbox",                    -- gruvbox
	-- MARKDOWN / OBSIDIAN
	require("user.lazy.md_preview"),      -- markdown preview
	require("user.lazy.md_bullets"),      -- markdown bullets
	-- MISC
	"chrisbra/unicode.vim",               -- :SearchUni check|C-v u2705|✅
	"moll/vim-bbye",                      -- delete buffer w/o closing win
	"lewis6991/impatient.nvim",           -- fast startup
	"antoinemadec/FixCursorHold.nvim",    -- needed to fix lsp doc highlight
	"kshenoy/vim-signature",              -- show marks in gutter
	"terryma/vim-multiple-cursors",       -- multiple cursors
	-- GIST
	"rudylee/nvim-gist",                  -- post github gists
	-- COMMENTS, AUTOPAIRS, LISTS
	"windwp/nvim-autopairs",              -- integrates with cmp and treesitter
	"terrortylor/nvim-comment",           -- commenting tool
	-- UTILITY
	"andyl/nvls",                         -- test plugin
	"andyl/al-gtd",                       -- GTD
	-- TEST
	-- { dir = "~/src/Plugins/test1.nvim" },
}

return Lazy.setup(opts)
