return {
	{
		"rest-nvim/rest.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			opts = function(_, opts)
				opts.ensure_installed = opts.ensure_installed or {}
				table.insert(opts.ensure_installed, "http")
			end,
		},

		config = function()
			-- first load extension
			require("telescope").load_extension("rest")

			-- keymaps
			-- Telescope rest select_env
			vim.keymap.set("n", "<C-e>", function()
				return require("telescope").extensions.rest.select_env()
			end, { desc = "Rest: Select environment" })
		end,
	}
}
