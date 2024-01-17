return {
  {
    'mfussenegger/nvim-lint',
    event = { 'InsertEnter' },
    config = function()
      require('lint').linters_by_ft = {
        dockerfile = { 'hadolint' },
      }
      vim.api.nvim_create_autocmd({ 'BufWritePost', 'InsertEnter' }, {
        callback = function()
          require('lint').try_lint()
        end,
      })
    end,
  },
}
