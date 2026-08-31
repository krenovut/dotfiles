local MiniFiles = require("mini.files")

Keymap = require("config.utils").Keymap

MiniFiles.setup({
	mappings = {
		go_in = "<CR>",
		go_in_plus = "L",
		go_out = "_",
		go_out_plus = "H",
	},
})

Keymap("n", "-", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini files explorer" })
Keymap(
	"n",
	"<leader>-",
	"<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0), true)<CR>",
	{ desc = "Toggle mini files explorer at open buffer dir" }
)

require("mini.ai").setup({})
-- require("mini.notify").setup({})
require("mini.pairs").setup({})
require("mini.indentscope").setup({})

-- cmd line complition
require("mini.cmdline").setup({
	autocorrect = { enable = false },
})

require("mini.surround").setup()
-- Default Keymaps
-- | `sa` | Add surrounding or Direct with 'saiw' |
-- | `sd` | Delete surrounding |
-- | `sr` | Replace surrounding |
-- | `sf` | Find surrounding (right) |
-- | `sF` | Find surrounding (left) |
-- | `sh` | Highlight surrounding |
-- | `sn` | Update n_lines |
-- | `l` / `n` | as suffix for prev/next |

-- Mini Session Keybinds
local MiniSessions = require("mini.sessions")

MiniSessions.setup({
	autoread = true,
	file = ".session",
})

Keymap("n", "<leader>qs", function() -- quit and save session local
	MiniSessions.write(".session")
	vim.cmd("wqa")
end, { desc = "Save local session and quit" })

Keymap("n", "<leader>qd", function() -- quit and delete session
	MiniSessions.delete(".session")
	vim.cmd("wqa")
end, { desc = "Delete local session and quit" })
