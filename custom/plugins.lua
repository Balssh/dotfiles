local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"stevearc/conform.nvim",
		event = "BufReadPost",
		config = function()
			require("custom.configs.conform")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"Exafunction/codeium.nvim",
		},
		config = function(_, opts)
			table.insert(opts.sources, 1, { name = "codeium" })
			require("cmp").setup(opts)
		end,
	},

	{
		"Exafunction/codeium.nvim",
		config = function()
			require("codeium").setup({})
		end,
	},

	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = function()
			require("dressing").setup()
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("plugins.configs.telescope")
			require("telescope").load_extension("fzf")
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		version = "3.0",
		config = function()
			require("custom.configs.indentblankline")
		end,
	},

	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		config = function()
			require("fidget").setup()
		end,
	},

	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		event = "VeryLazy",
		config = function()
			require("ufo").setup()
		end,
	},

	-- {
	-- 	"lukas-reineke/headlines.nvim",
	-- 	ft = { "markdown", "norg", "rmd", "org" },
	-- 	opts = {},
	-- },
}
