-- [[ Basic Keymaps ]]
--
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false,
			},
		},
	},
})

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", require("telescope.builtin").resume, { desc = "[S]earch [R]esume" })

-- Diagnostic keymaps
vim.keymap.set("n", "[x", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]x", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>xm", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>xl", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- mini.files
vim.api.nvim_set_keymap("n", "<leader>e", ":lua MiniFiles.open()<CR>", { silent = true, noremap = true })

-- Zen mode
vim.api.nvim_set_keymap("n", "<leader>z", ":ZenMode<CR>", { silent = true, noremap = true })

-- Harpoon
vim.api.nvim_set_keymap(
	"n",
	"<leader>ht",
	":lua require('harpoon.ui').toggle_quick_menu()<CR>",
	{ silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>ha",
	":lua require('harpoon.mark').add_file()<CR>",
	{ silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>hn",
	":lua require('harpoon.ui').nav_next()<CR>",
	{ silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>hp",
	":lua require('harpoon.ui').nav_prev()<CR>",
	{ silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>uh", ":Telescope harpoon marks<CR>", { silent = true, noremap = true })

-- replace with yanked text
vim.api.nvim_set_keymap("n", "<leader>p", '"0p', { silent = true, noremap = true })
-- delete without yanking
vim.api.nvim_set_keymap("n", "<leader>d", '"_d', { silent = true, noremap = true })

-- flote keymap
vim.api.nvim_set_keymap("n", "<leader>F", ":Flote<CR>", { silent = true, noremap = true })

-- NavBuddy
vim.api.nvim_set_keymap("n", "<leader>n", ":Navbuddy<CR>", { silent = true, noremap = true })

-- quit
vim.api.nvim_set_keymap("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- Format
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>Format<cr>", { desc = "Format" })

-- Save file
vim.api.nvim_set_keymap("n", "<C-s>", "<cmd>w!<cr>", { desc = "Save file" })
vim.api.nvim_set_keymap("i", "<C-s>", "<cmd>w!<cr>", { desc = "Save file" })

-- Lazy
vim.api.nvim_set_keymap("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Windows
vim.api.nvim_set_keymap("n", "<leader>-", "<C-W>s", { desc = "Split window below", noremap = true })
vim.api.nvim_set_keymap("n", "<leader>|", "<C-W>v", { desc = "Split window right", noremap = true })

-- Lazygit
vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua Lazygit_toggle()<CR>", {noremap = true, silent = true})
