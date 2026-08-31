local which_key = require("which-key")

which_key.setup({
	preset = "modern",
	delay = 300,
})

which_key.add({
	{ "<leader>b", group = "buffers" },
	{ "<leader>f", group = "find" },
	{ "<leader>q", group = "session" },
	{ "<leader>t", group = "toggle" },
})
