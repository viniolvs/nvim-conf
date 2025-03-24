return {
	{
		"rest-nvim/rest.nvim",
		lazy = false,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			opts = function(_, opts)
				opts.ensure_installed = opts.ensure_installed or {}
				table.insert(opts.ensure_installed, "http")
			end,
		},
		keys = {
			{ "<leader>rr", "<cmd>Rest run<cr>",        desc = "Rest: Run" },
			{ "<leader>re", "<cmd>Rest env select<cr>", desc = "Rest: Select environment" },
		}
	}
}
