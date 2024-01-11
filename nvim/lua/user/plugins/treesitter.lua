return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    { 'JoosepAlviste/nvim-ts-context-commentstring' },
    { 'windwp/nvim-ts-autotag', opts = {} },
    'HiPhish/nvim-ts-rainbow2',
    { 'windwp/nvim-autopairs', opts = {} },
  },

  build = ':TSUpdate',
  event = 'BufReadPost',

  config = function()
    local treesitter = require 'nvim-treesitter.configs'

    treesitter.setup {
      ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash' },

      -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
      auto_install = true,
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      highlight = { enable = true },
      indent = { enable = true },
      rainbow = {
        enable = true,
        query = 'rainbow-parens',
        strategy = require('ts-rainbow').strategy['global'],
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      },
    }
  end,
}