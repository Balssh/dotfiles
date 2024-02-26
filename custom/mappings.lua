local M = {}

M.disabled = {
	n = {
		["<leader>b"] = "",
		["<leader>v"] = "",
		["<leader>h"] = "",
		["<leader>n"] = "",
		["<leader>q"] = "",
		["<leader>rn"] = "",
		["<C-n>"] = "",
	},
}

M.general = {
	i = {
		["<C-s>"] = { "<ESC> <cmd> w! <CR>", "Save file" },
	},
	n = {

		["<leader>qq"] = { "<cmd> wqa! <CR>", "Save and exit all" },
		["<C-d>"] = { "<C-d>zz", "Scroll down half page" },
		["<C-u>"] = { "<C-u>zz", "Scroll up half page" },
	},
	v = {},
}

M.conform = {
	n = {
		["<leader>fm"] = {
			function()
				require("conform").format({ lsp_fallback = true })
			end,
			"LSP Formatting",
		},
	},
}

M.git = {
	n = {
		["<leader>gg"] = { "<cmd>LazyGit<CR>", "LazyGit" },
	},
}

M.nvimtree = {
	n = {
		["<leader>e"] = { "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree" },
	},
}

M.ufo = {
	n = {
		["zR"] = {
			function()
				require("ufo").openAllFolds()
			end,
			"Open all folds",
		},
		["zM"] = {
			function()
				require("ufo").closeAllFolds()
			end,
			"Close all folds",
		},
	},
}

M.flash = {
	n = {
		["s"] = {

			-- mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		["S"] = {
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
	},
	x = {
		["s"] = {

			-- mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		["S"] = {
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
		["R"] = {
			function()
				require("flash").treesitter_search()
			end,
			desc = "Treesitter Search",
		},
	},
	o = {
		["s"] = {

			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		["S"] = {
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
		["R"] = {
			function()
				require("flash").treesitter_search()
			end,
			desc = "Treesitter Search",
		},
	},
	c = {
		["<c-s>"] = {
			function()
				require("flash").toggle()
			end,
			desc = "Toggle Flash Search",
		},
	},
}

return M
