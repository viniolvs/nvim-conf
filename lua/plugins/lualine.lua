return {
	-- lualine
	{
		-- Set lualine as statusline
		"nvim-lualine/lualine.nvim",
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
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
					lualine_b = {
						"branch",
						"diff",
						{
							'filename',
							file_status = true, -- Displays file status (readonly status, modified status)
							newfile_status = true, -- Display new file status (new file means no write after created)
							path = 0,       -- 0: Just the filename
							-- 1: Relative path
							-- 2: Absolute path
							-- 3: Absolute path, with tilde as the home directory
							-- 4: Filename and parent dir, with tilde as the home directory

							shorting_target = 40, -- Shortens path to leave 40 spaces in the window
							-- for other components. (terrible name, any suggestions?)
							symbols = {
								modified = '●', -- Text to show when the file is modified.
								readonly = '-', -- Text to show when the file is non-modifiable or readonly.
								unnamed = '[No Name]', -- Text to show for unnamed buffers.
								newfile = '+', -- Text to show for newly created file before first write
							}
						},
					},
					lualine_c = { "diagnostics" },
					lualine_x = {
						{
							"filetype",
							colored = true,     -- Displays filetype icon in color if set to true
							icon_only = true,  -- Display only an icon for filetype
							icon = { align = 'right' }, -- Display filetype icon on the right hand side
							-- icon =    {'X', align='right'}
							-- Icon string ^ in table is ignored in filetype component
						},
						"fileformat",
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
