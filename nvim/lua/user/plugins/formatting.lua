return {
  {
    'stevearc/conform.nvim',
    dependencies = { 'mason.nvim' },
    cmd = 'ConformInfo',
    keys = {
      {
        '<leader>cf',
        function()
          require('conform').format()
        end,
        desc = '[C]ode [F]ormat',
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        python = {'ruff_format'}
      },
    },
  },
}
