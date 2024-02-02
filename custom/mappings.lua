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

return M
