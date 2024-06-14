return {
  -- NOTE: Plugins that don't require any configuration

  -- Git related plugins
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",

  --icons
  "nvim-tree/nvim-web-devicons",

  -- Useful plugin to show you pending keybinds.
  { "folke/which-key.nvim",  opts = {} },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = { char = "│" },
      scope = { enabled = false },
      exclude = {
        filetypes = {
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
      },
    },
    main = "ibl",
  },

  -- "gc" to comment visual regions/lines
  { "numToStr/Comment.nvim", opts = {} },

  -- tmux navigator
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  -- Codeium
  {
    "Exafunction/codeium.vim",
    event = "InsertEnter",
    version = "1.8.37",
    config = function()
      vim.g.codeium_no_map_tab = 1
      vim.keymap.set("i", "<C-a>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-.>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-c>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-m>", function()
        return vim.fn["codeium#Chat"]()
      end, { expr = true, silent = true })
    end,
  },

  -- Multiple cursors
  {
    "mg979/vim-visual-multi",
    branch = "master",
    event = "BufEnter",
  },

  -- Zen Mode
  {
    "folke/zen-mode.nvim",
    event = "VimEnter",
    config = function()
      require("zen-mode").setup({})
    end,
  },

  --Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
  },

  -- Colorizer
  {
    "norcalli/nvim-colorizer.lua",
    ft = {
      "css",
      "html",
      "javascript",
      "javascriptreact",
      "lua",
      "markdown",
      "scss",
      "typescript",
      "typescriptreact",
    },
    config = function()
      require("colorizer").setup({
        "*",
      }, {
        mode = "background",
      })
    end,
  },

  -- plugin to open links
  {
    "chrishrb/gx.nvim",
    event = { "BufEnter" },
    -- you can specify also another config if you want
    config = function()
      require("gx").setup({
        handlers = {
          plugin = true, -- open plugin links in lua (e.g. packer, lazy, ..)
          github = true, -- open github issues
        },
      })
    end,
  },

  -- navbuddy
  {
    "SmiteshP/nvim-navbuddy",
    ft = { "go", "c", "cpp", "java", "python", "typescript", "typescriptreact", "javascript", "prisma" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      local navbuddy = require("nvim-navbuddy")
      navbuddy.setup({
        lsp = {
          auto_attach = true,
        },
      })
    end,
  },

  -- markdown notes for projects
  {
    "JellyApple102/flote.nvim",
    event = "BufReadPre",
    config = function()
      require("flote").setup()
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
        "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "Toggle Flash Search"
      },
    },
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
}
