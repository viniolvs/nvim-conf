return {
	-- lualine
	{
		-- Set lualine as statusline
		"nvim-lualine/lualine.nvim",
		-- See `:help lualine.txt`
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					section_separators = { left = '', right = '' },
					component_separators = { left = '|', right = '' },
					disabled_filetypes = {},
					always_divide_middle = true,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "tabs, filename" },
					lualine_x = { "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
				}
			})
		end
	},
}
