require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		kdl = { "kdlfmt" },
		markdown = { "prettier" },
		html = { "prettier" },
		-- python = { "black" },
	},
	format_on_save = function(bufnr)
		-- kdlfmt uses a canonical layout: it expands inline nodes and normalizes
		-- manually aligned whitespace. Keep KDL formatting opt-in so Niri config
		-- files retain their original layout and trailing comments.
		if vim.bo[bufnr].filetype == "kdl" then
			return nil
		end

		return {}
	end,
	undojoin = true,
})

local lint = require("lint")

-- Only show diagnostics close to the cursor
vim.diagnostic.config({
	virtual_text = {
		spacing = 4,
		prefix = function(diagnostic)
			local icons = {
				[vim.diagnostic.severity.ERROR] = " ",
				[vim.diagnostic.severity.WARN] = "󰉀 ",
				[vim.diagnostic.severity.INFO] = " ",
				[vim.diagnostic.severity.HINT] = "󰌵 ",
			}
			return icons[diagnostic.severity] or ""
		end,
	},
	signs = false,
	underline = true,
	update_in_insert = false,
})

-- Auto-run the linter only for the configured filetypes
vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		local ft = vim.bo.filetype
		if lint.linters_by_ft[ft] then
			lint.try_lint()
		end
	end,
})
