-- ========================================================================================
-- PLUGINS (vim.pack)
-- ========================================================================================

vim.pack.add({
	--appearance
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/folke/which-key.nvim", name = "which-key" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim", name = "lualine" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim", name = "gitsigns" },

	{ src = "https://github.com/folke/noice.nvim", name = "noice" },
	{ src = "https://github.com/MunifTanjim/nui.nvim", name = "nui" },
	{ src = "https://github.com/rcarriga/nvim-notify", name = "notify" },
	--treesitter
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},
	{ src = "https://github.com/folke/flash.nvim", name = "flash" },
	--lsp
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/saghen/blink.cmp", name = "blink" },
	{ src = "https://github.com/saghen/blink.lib", name = "blink-lib" },
	--fzf
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	--lint & format
	{ src = "https://github.com/stevearc/conform.nvim", name = "conform" },
	{ src = "https://github.com/mfussenegger/nvim-lint", name = "lint" },
	--other
	{ src = "https://github.com/nvim-mini/mini.nvim" },
})

require("plugins.mini")
require("plugins.lsp")
require("plugins.fzf")
require("plugins.format")
require("plugins.treesitter")
require("plugins.devicons")
require("plugins.colorsheme")
require("plugins.flash")
require("plugins.noice")
require("plugins.which-key")
require("plugins.gitsigns")
require("plugins.lualine")
