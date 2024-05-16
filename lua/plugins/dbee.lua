return {
	{
		"kndndrj/nvim-dbee",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		build = function()
			-- Install tries to automatically detect the install method.
			-- if it fails, try calling it with one of these parameters:
			--    "curl", "wget", "bitsadmin", "go"
			require("dbee").install()
		end,
		config = function()
			require("dbee").setup( --[[optional config]])
		end,
		keys = {
			{ "<leader>dd", "<CMD>lua require('dbee').open()<CR>", desc = "Open dbee" },
			{ "<leader>dc", "<CMD>lua require('dbee').close()<CR>", desc = "Close dbee" },
		}
	}
}
