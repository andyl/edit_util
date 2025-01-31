-- autolist.nvim

require('autolist').setup({
  enabled = true,
  ft = {
    "markdown",
    "text",
  },
  lists = {
		markdown = {
			"unordered",
			"digit",
			"ascii",
			"roman",
		},
		text = {
			"unordered",
			"digit",
			"ascii",
			"roman",
		},
		tex = { "latex_item" },
		plaintex = { "latex_item" },
	},
})

