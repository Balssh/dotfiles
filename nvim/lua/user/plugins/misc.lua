return {
  {
    'kepano/flexoki-neovim',
    name = 'flexoki',
    config = function()
      vim.cmd 'colorscheme flexoki-dark'
    end,
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'BufReadPost',
  },
  {
    'max397574/better-escape.nvim',
    event = 'InsertEnter',
    opts = {
      mapping = { 'jk', 'jj', 'kj', 'kk' },
    },
  },

  {
    'numToStr/Comment.nvim',
    keys = {
      { 'gcc', mode = 'n', desc = 'Comment toggle current line' },
      { 'gc', mode = { 'n', 'o' }, desc = 'Comment toggle linewise' },
      { 'gc', mode = 'x', desc = 'Comment toggle linewise (visual)' },
      { 'gbc', mode = 'n', desc = 'Comment toggle current block' },
      { 'gb', mode = { 'n', 'o' }, desc = 'Comment toggle blockwise' },
      { 'gb', mode = 'x', desc = 'Comment toggle blockwise (visual)' },
    },
    opts = {},
  },

  {
    'NvChad/nvim-colorizer.lua',
    event = 'BufReadPost',
    opts = {},
  },
  {
    'stevearc/oil.nvim',
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '-', '<cmd>Oil --float<cr>', desc = 'Open Oil (root dir)' },
    },
    opts = {},
  },
  {
    'Exafunction/codeium.nvim',
    cmd = 'Codeium',
    event = 'BufReadPost',
    build = ':Codeium Auth',
    opts = {},
  },
  { 'windwp/nvim-ts-autotag', lazy = true },
  { 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim', lazy = true },
  {
    'echasnovski/mini.starter',
    event = 'VimEnter',
    opts = function()
      local logo = table.concat({
        '           ▄ ▄                   ',
        '       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ',
        '       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ',
        '    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ',
        '  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ',
        '  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄',
        '▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █',
        '█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █',
        '    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ',
      }, '\n')
      local pad = string.rep(' ', 11)
      local new_section = function(name, action, section)
        return { name = name, action = action, section = pad .. section }
      end

      local starter = require 'mini.starter'
            --stylua: ignore
            local config = {
                evaluate_single = true,
                header = logo,
                items = {
                    new_section("Find file", "Telescope find_files", "Telescope"),
                    new_section("Recent files", "Telescope frecency workspace=CWD", "Telescope"),
                    new_section("Grep text", "Telescope live_grep", "Telescope"),
                    new_section("- File explorer", "lua require('oil').open_float('.')", "Telescope"),
                    new_section("Lazy", "Lazy", "Config"),
                    new_section("New file", "ene | startinsert", "Built-in"),
                    new_section("Quit", "qa", "Built-in"),
                    -- new_section("Session restore", [[lua require("persistence").load()]], "Session"),
                },
                content_hooks = {
                    starter.gen_hook.adding_bullet(pad .. "░ ", false),
                    starter.gen_hook.aligning("center", "center"),
                },
            }
      return config
    end,
    config = function(_, config)
      if vim.o.filetype == 'lazy' then
        vim.cmd.close()
        vim.api.nvim_create_autocmd('User', {
          pattern = 'MiniStarterOpened',
          callback = function()
            require('lazy').show()
          end,
        })
      end

      local starter = require 'mini.starter'
      starter.setup(config)

      vim.api.nvim_create_autocmd('User', {
        pattern = 'LazyVimStarted',
        callback = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          starter.config.footer = '⚡ Neovim loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms'
          pcall(starter.refresh)
        end,
      })
    end,
  },
  { 'echasnovski/mini.surround', event = 'BufReadPost', version = '*', opts = {} },
  { 'echasnovski/mini.pairs', event = 'BufReadPost', version = '*', opts = {} },
}
