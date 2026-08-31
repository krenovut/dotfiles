local tree = require("nvim-treesitter")

tree.setup({
	highlight = { enable = true },
	indent = { enable = true },
})

tree.install({
	"json",
	"kdl",
	"lua",
	"python",
	"vim",
})
