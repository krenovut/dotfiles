require("lualine").setup({
	options = {
		theme = "tokyonight",
		globalstatus = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = { "dashboard" },
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			{ "branch", icon = "" },
			{
				"diff",
				source = function()
					local status = vim.b.gitsigns_status_dict
					if not status then
						return nil
					end
					return {
						added = status.added,
						modified = status.changed,
						removed = status.removed,
					}
				end,
				symbols = { added = "+", modified = "~", removed = "-" },
			},
		},
		lualine_c = {
			{
				"filename",
				path = 1,
				symbols = {
					modified = " ●",
					readonly = " ",
					unnamed = "[No Name]",
				},
			},
		},
		lualine_x = {
			{ "filetype", icon_only = false },
		},
		lualine_y = {},
		lualine_z = {
			{
				"location",
				fmt = function(location)
					return location:gsub(":", "│")
				end,
			},
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
})
