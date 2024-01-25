local options = {
	lsp_fallback = true,

	formatters_by_ft = {
		lua = { "stylua" },
		sh = { "shfmt" },
		python = { "ruff_format" },
	},
}

require("conform").setup(options)
