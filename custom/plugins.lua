local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
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
    --  for users those who want auto-save conform + lazyloading!
    event = "BufReadPost",
    config = function()
      require "custom.configs.conform"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "Exafunction/codeium.nvim",
    },
    config = function(_, opts)
      opts.sources[#opts.sources + 1] = { name = "codeium" }
      require("cmp").setup(opts)
    end,
  },

  {
    "Exafunction/codeium.nvim",
    config = function()
      require("codeium").setup {}
    end,
  },
}
