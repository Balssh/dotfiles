local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"vimdoc",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"c",
		"markdown",
		"markdown_inline",
		"python",
		"toml",
		"yaml",
		"dockerfile",
		"groovy",
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- python
		"pyright",
		"ruff-lsp",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"biome",
		-- "typescript-language-server",
		"tailwindcss-language-server",

    -- markdown
    "marksman",
    "markdownlint",

		-- shell
		"bash-language-server",
		"shfmt",
	},
}

M.nvimtree = {
	git = {
		enable = true,
	},
	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

M.cmp = {
	sources = {
		{ name = "codeium" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "path" },
	},
}

return M
