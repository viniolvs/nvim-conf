return {
	--gitsigns
	{
		-- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				vim.keymap.set(
					"n",
					"<leader>gp",
					require("gitsigns").preview_hunk,
					{ buffer = bufnr, desc = "Preview git hunk" }
				)

				-- don't override the built-in and fugitive keymaps
				local gs = package.loaded.gitsigns
				vim.keymap.set({ "n", "v" }, "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
				vim.keymap.set({ "n", "v" }, "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })

				vim.keymap.set("n", "<leader>gb", require("gitsigns").toggle_current_line_blame,
					{ buffer = bufnr, desc = "Toggle line blame" })
				vim.keymap.set("n", "<leader>gd", require("gitsigns").diffthis, { buffer = bufnr, desc = "Diff this" })
				vim.keymap.set("n", "<leader>gs", require("gitsigns").stage_hunk, { buffer = bufnr, desc = "Stage hunk" })
				vim.keymap.set('v', '<leader>gs',
					function() require("gitsigns").stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
					{ buffer = bufnr, desc = "Stage hunk" })
				vim.keymap.set("n", "<leader>gr", require("gitsigns").reset_hunk, { buffer = bufnr, desc = "Reset hunk" })
				vim.keymap.set("v", "<leader>gr", function() require("gitsigns").reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { buffer = bufnr, desc = "Reset hunk" })
				vim.keymap.set("n", "<leader>gu", require("gitsigns").undo_stage_hunk,
					{ buffer = bufnr, desc = "Undo stage hunk" })
			end,
		},
	},

	-- vim illumnate
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			delay = 200,
			large_file_cutoff = 2000,
			large_file_overrides = {
				providers = { "lsp" },
			},
		},
		config = function(_, opts)
			require("illuminate").configure(opts)

			local function map(key, dir, buffer)
				vim.keymap.set("n", key, function()
					require("illuminate")["goto_" .. dir .. "_reference"](false)
				end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
			end

			map("]]", "next")
			map("[[", "prev")

			-- also set it after loading ftplugins, since a lot overwrite [[ and ]]
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					map("]]", "next", buffer)
					map("[[", "prev", buffer)
				end,
			})
		end,
		keys = {
			{ "]]", desc = "Next Reference" },
			{ "[[", desc = "Prev Reference" },
		},
	},

	-- mini.autopairs
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {},
	},

	-- mini.surround
	{
		"echasnovski/mini.surround",
		keys = function(_, keys)
			-- Populate the keys based on the user's options
			local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
			local opts = require("lazy.core.plugin").values(plugin, "opts", false)
			local mappings = {
				{ opts.mappings.add,            desc = "Add surrounding",                     mode = { "n", "v" } },
				{ opts.mappings.delete,         desc = "Delete surrounding" },
				{ opts.mappings.find,           desc = "Find right surrounding" },
				{ opts.mappings.find_left,      desc = "Find left surrounding" },
				{ opts.mappings.highlight,      desc = "Highlight surrounding" },
				{ opts.mappings.replace,        desc = "Replace surrounding" },
				{ opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
			}
			mappings = vim.tbl_filter(function(m)
				return m[1] and #m[1] > 0
			end, mappings)
			return vim.list_extend(mappings, keys)
		end,
		opts = {
			mappings = {
				add = "gza",        -- Add surrounding in Normal and Visual modes
				delete = "gzd",     -- Delete surrounding
				find = "gzf",       -- Find surrounding (to the right)
				find_left = "gzF",  -- Find surrounding (to the left)
				highlight = "gzh",  -- Highlight surrounding
				replace = "gzr",    -- Replace surrounding
				update_n_lines = "gzn", -- Update `n_lines`
			},
		},
	},
	-- mini.files
	{
		"echasnovski/mini.files",
		version = false,
		lazy = false,
		config = function()
			require("mini.files").setup()
		end,
	},

	{
		"echasnovski/mini.bufremove",
		lazy = false,
		config = function()
			require("mini.bufremove").setup()
		end,
		-- stylua: ignore
		keys = {
			{ "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
			{ "<leader>bD", function() require("mini.bufremove").delete(0, true) end,  desc = "Delete Buffer (Force)" },
		},
	},

	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},

	{
		"echasnovski/mini.move",
		version = false,
		lazy = false,
		config = function()
			require("mini.move").setup()
		end
	},

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
	},

	-- Finds and lists all of the TODO, HACK, BUG, etc comment in your project and loads them into a browsable list.
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = "VimEnter",
		config = true,
		-- stylua: ignore
		keys = {
			{ "]t",         function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
			{ "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
			{ "<leader>xt", "<cmd>TodoTrouble<cr>",                              desc = "Todo (Trouble)" },
			{ "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",      desc = "Todo/Fix/Fixme (Trouble)" },
			{ "<leader>st", "<cmd>TodoTelescope<cr>",                            desc = "Todo" },
			{ "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",    desc = "Todo/Fix/Fixme" },
		},
	},

	{
		"vim-scripts/BufOnly.vim",
		cmd = "BufOnly",
		event = "BufReadPre",
		-- stylua: ignore
		keys = {
			{ "<leader>bo", "<cmd>BOnly<cr>", desc = "Buffer Only" },
		},
	},

	{
		"chentoast/marks.nvim",
		event = "BufReadPre",
		config = function()
			require("marks").setup()
		end

	},

	{
		'VonHeikemen/searchbox.nvim',
		lazy = false,
		requires = {
			{ 'MunifTanjim/nui.nvim' }
		},
		keys = {
			{ '<leader>ss', '<cmd>SearchBoxIncSearch<CR>', desc = 'SearchBox' },
			{ '<leader>sS', '<cmd>SearchBoxReplace<CR>',   desc = 'SearchBoxReplace' },
		}
	}

}
