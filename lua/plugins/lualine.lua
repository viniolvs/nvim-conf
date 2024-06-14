return {
	-- lualine
	{
		-- Set lualine as statusline
		"nvim-lualine/lualine.nvim",
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		-- See `:help lualine.txt`
		version = "1.8.37",
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
					lualine_c = { },
					lualine_x = {
						"fileformat",
						function()
							return vim.fn["codeium#GetStatusString"]()
						end,
						"filetype"
					},
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
