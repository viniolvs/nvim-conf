return {
	-- Colorscheme
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		config = function()
			require("kanagawa").setup({
				compile = false,
				dimInactive = false,
				transparent = false,
				commentStyle = { italic = true },
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none"
							}
						}
					}
				}
			})
		end,
	}
}
