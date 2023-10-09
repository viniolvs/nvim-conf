return {
	-- Colorscheme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = false,
				show_end_of_buffer = false,
				dim_inactive = {
					enabled = true,
					shade = "dark",
					percentage = 0.20,
				},
				integrations = {
					notify = true,
					mini = true,
					harpoon = true,
					leap = true,
					noice = true,
					cmp = true,
					ts_rainbow = true,
				},
			})
		end,
	},
}
