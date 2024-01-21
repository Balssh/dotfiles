local M = {}

M.general = {
  i = {
    ["<C-s>"] = { "<ESC> <cmd> w <CR>", "Save file" },
  },
  n = {},
  v = {},
}

M.conform = {
  n = {
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "LSP Formatting"
    }
  }
}

return M
