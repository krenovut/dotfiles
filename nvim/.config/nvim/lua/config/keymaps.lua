Keymap = require("config.utils").Keymap

Keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlighting" })
Keymap("n", "<leader>re", function()
	vim.cmd("restart")
end, { desc = "Restart Neovim" })

-- Mode starts with respect to indent
for _, bind in ipairs({ "i", "a", "A", "I" }) do
	Keymap("n", bind, function()
		if vim.fn.getline("."):match("^%s*$") then
			return [["_cc]]
		else
			return bind
		end
	end, { expr = true })
end

-- Center screen when jumping
Keymap("n", "n", "nzzzv", { desc = "Next search result (centered)" })
Keymap("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
Keymap("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
Keymap("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Buffer navigation
Keymap("n", "<leader>bn", "<Cmd>bnext<CR>", { desc = "Next buffer" })
Keymap("n", "<leader>bp", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })
Keymap("n", "<leader>bd", function() -- delete buffer
	vim.cmd("bd")
	vim.cmd("echo 'Buffer deleted'")
end, { desc = "Remove buffer" })

-- Better window navigation
Keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
Keymap("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
Keymap("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
Keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

Keymap("n", "<A-j>", ":m .+e<CR>==", { desc = "Move line down" })
Keymap("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
Keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected line down" })
Keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected line up" })

Keymap("n", "<leader>sv", "<Cmd>vsplit<CR>", { desc = "Split window vertically" })
Keymap("n", "<leader>sh", "<Cmd>split<CR>", { desc = "Split window horizontally" })

-- Better indenting in visual mode
Keymap("v", "<", "<gv", { desc = "Indent left and reselect" })
Keymap("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Better J behavior
Keymap("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Tab binds
Keymap("n", "<C-T>l", function()
	vim.cmd("tabnext")
end)

Keymap("n", "<C-T>h", function()
	vim.cmd("tabprevious")
end)

Keymap("n", "<C-T>n", function()
	vim.cmd("tabnew")
end)

Keymap("n", "<C-T>q", function()
	vim.cmd("tabclose")
end)

-- Undotree
Keymap("n", "<leader>u", function()
	vim.cmd.packadd("nvim.undotree")
	require("undotree").open({
		command = "botright 30vnew",
	})
end, { desc = "Toggle built-in undo tree" })

-- Better past and delete
Keymap("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })
Keymap("x", "<leader>P", "p", { desc = "Paste over selection and replace yank" })
Keymap({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Code actions
Keymap({ "n", "x" }, "<leader>ca", function()
	vim.lsp.buf.code_action()
end, { desc = "Show code actions" })

Keymap("n", "<leader>cd", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Open diagnostic float window" })

local inline_diagnostics_config

Keymap("n", "<leader>tg", function()
	local current_config = vim.diagnostic.config().virtual_text
	local enable = current_config == false
	if enable then
		vim.diagnostic.config({ virtual_text = inline_diagnostics_config or true })
	else
		inline_diagnostics_config = current_config
		vim.diagnostic.config({ virtual_text = false })
	end
	vim.notify("Inline diagnostics " .. (enable and "enabled" or "disabled"), vim.log.levels.INFO, {
		title = "Diagnostics",
	})
end, { desc = "Toggle inline diagnostics" })
