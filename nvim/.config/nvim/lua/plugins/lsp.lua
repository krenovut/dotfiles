require("mason").setup({})

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.config("lua-ls", {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".git" },
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },

			-- Tell the server to let Neovim handle snippet expansion
			completion = {
				callSnippet = "Replace",
			},
			-- Use LuaJIT (which Neovim uses)
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				-- This tells lua-ls to look inside Neovim's own runtime for completions
				library = {
					vim.env.VIMRUNTIME,
					-- Optional: includes external plugins if you want completions for them
					-- "${3rd}/luv/library"
				},
			},
		},
	},
})

vim.lsp.enable({
	"lua-ls",
})

require("blink.cmp").build():pwait()

require("blink.cmp").setup({
	fuzzy = { implementation = "rust" },
	appearance = { use_nvim_cmp_as_default = true, nerd_font_variant = "normal" },

	-- keymap = {
	-- 	["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
	-- },

	signature = {
		enabled = false,
	},

	completion = {
		trigger = {
			show_on_insert = true,
			show_on_trigger_character = true,
			show_on_keyword = true,
			show_on_backspace = true,
		},
		list = {
			selection = {
				preselect = false,
				auto_insert = true,
			},
		},
		menu = {
			auto_show = true,
			border = "rounded",
			min_width = 35,
			auto_show_delay_ms = 100,
			-- draw = {
			-- 	columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
			-- },
		},
		-- cmdline = {
		-- 	enabled = true,
		-- },
	},

	sources = {
		default = {
			"lsp", -- (Equivalent to cmp-nvim-lsp)
			"snippets", -- (Handled by the snippets config, replaces cmp_luasnip source)
			"buffer", -- (Equivalent to cmp-buffer)
			"path", -- (Equivalent to cmp-path)
		},
		per_filetype = {
			-- KDL has no schema-aware completion server in this setup.
			kdl = { "path", "buffer" },
		},
	},
})
