return {
  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    config = function()
      require("harpoon").setup({})
    end,
		keys = {
			{ "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", desc = "Harpoon add file" },
			{ "<leader>h1", ":lua require('harpoon.ui').nav_file(1)<CR>", desc = "Harpoon file 1" },
			{ "<leader>h2", ":lua require('harpoon.ui').nav_file(2)<CR>", desc = "Harpoon file 2" },
			{ "<leader>h3", ":lua require('harpoon.ui').nav_file(3)<CR>", desc = "Harpoon file 3" },
			{ "<leader>h4", ":lua require('harpoon.ui').nav_file(4)<CR>", desc = "Harpoon file 4" },
			{ "<leader>hn", ":lua require('harpoon.ui').nav_next()<CR>", desc = "Harpoon next" },
			{ "<leader>hp", ":lua require('harpoon.ui').nav_prev()<CR>", desc = "Harpoon previous" },
			{ "<leader>ht", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Harpoon toggle quick menu" },
			{ "<leader>hr", ":lua require('harpoon.mark').rm_file()<CR>", desc = "Harpoon remove file" },
			{ "<leader>hh", ":Telescope harpoon marks<CR>", desc = "Harpoon marks" },
		}
  },

}
