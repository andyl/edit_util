-- lsp/lang/lua_ls

local opts = {
	settings = {

		Lua = {
			diagnostics = {
				globals = { "vim", "use" },
			},
			workspace = {
				library = {
					vim.fn.expand("$VIMRUNTIME/lua"),
					vim.fn.stdpath("config") .. "/lua",
				},
			},
		},
	},
}

return opts
