local notify = require("notify")

notify.setup({
	background_colour = "#000000",
	render = "compact",
	stages = "slide",
})
vim.notify = notify

require("noice").setup({
	views = {
		-- Keep the command line centered and attach its completion menu below it.
		cmdline_popup = {
			position = {
				row = "50%",
				col = "50%",
			},
			size = {
				min_width = 60,
				width = "auto",
				height = "auto",
			},
		},
		cmdline_popupmenu = {
			relative = "editor",
			position = {
				row = math.floor(vim.o.lines / 2) + 2,
				col = "50%",
			},
			size = {
				width = 60,
				height = "auto",
				max_height = 15,
			},
			border = {
				style = "rounded",
			},
		},
	},
	messages = {
		enabled = true,
		view = "mini",
		view_error = "notify", -- view for errors
		view_warn = "notify", -- view for warnings
		view_history = "messages", -- view for :messages
		view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
	},
	notify = {
		enabled = true,
		view = "notify",
	},
	hover = {
		enabled = false,
	},
	lsp = {
		hover = {
			enabled = true,
		},
		signature = {
			enabled = true,
		},
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- optional, requires nvim-cmp
		},
	},
	popupmenu = {
		enabled = true,
		backend = "nui", -- Force Noice to cleanly align the popup layout position
		-- backend = "blink", -- Force Noice to cleanly align the popup layout position
	},
	cmdline = {
		view = "cmdline_popup", -- Это вернет красивое окно ввода СТРОГО ПО ЦЕНТРУ экрана
	},
	presets = {
		bottom_search = false, -- use a classic bottom layout for search
		command_palette = false, -- positions are customized in `views` above

		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
})
