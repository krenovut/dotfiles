local fzf = require("fzf-lua") 
fzf.setup({})


vim.keymap.set("n", "<leader>ff", function() fzf.files() end, { desc = "FZF Files" })
vim.keymap.set("n", "<leader>fg", function() fzf.live_grep() end, { desc = "FZF Live Grep" })
vim.keymap.set("n", "<leader>fb", function() fzf.buffers() end, { desc = "FZF Buffers" })
vim.keymap.set("n", "<leader>fx", function() fzf.diagnostics_document() end, { desc = "FZF Diagnostics Document" })







