local map = vim.api.nvim_set_keymap

map('n', '<C-s>', '<cmd>w<cr>', { desc = 'Save File' })
map('i', '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })
map('n', '<leader>q', '<cmd>qa<cr><esc>', { desc = '[Q]uit' })
map('n', '<leader>bd', '<cmd>bd<cr>', { desc = '[B]uffer [D]elete' })
map('n', ']b', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Previous Buffer' })
map('n', '<leader>l', '<cmd>Lazy<cr>', { desc = '[L]azy' })
