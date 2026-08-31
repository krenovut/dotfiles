require("tokyonight").setup({})

local function match_float_border_to_editor()
	-- Rounded borders occupy rectangular terminal cells. Matching those cells
	-- to the editor background removes the dark box around floating windows.
	local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = normal.bg })
end

match_float_border_to_editor()
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = match_float_border_to_editor,
})
