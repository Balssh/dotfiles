local map = vim.api.nvim_set_keymap

-- better up/down
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map('n', '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- move lines
map('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
map('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
map('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move down' })
map('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move up' })

-- better search
map('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next search result' })
map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev search result' })
map('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })

-- better indenting
map('v', '<', '<gv', { desc = 'Decrease Indent' })
map('v', '>', '>gv', { desc = 'Increase Indent' })

-- Move to window using the <ctrl> hjkl keys
map('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })

-- tabs
map('n', ']<tab>', '<cmd>tabnext<cr>', { desc = 'Next Tab' })
map('n', '<leader><tab>d', '<cmd>tabclose<cr>', { desc = 'Close Tab' })
map('n', '[<tab>', '<cmd>tabprevious<cr>', { desc = 'Previous Tab' })

-- windows
-- map('n', '<leader>ww', '<C-W>p', { desc = 'Other window' })
-- map('n', '<leader>wd', '<C-W>c', { desc = 'Delete window' })
-- map('n', '<leader>w-', '<C-W>s', { desc = 'Split window below' })
-- map('n', '<leader>w|', '<C-W>v', { desc = 'Split window right' })
-- map('n', '<leader>-', '<C-W>s', { desc = 'Split window below' })
-- map('n', '<leader>|', '<C-W>v', { desc = 'Split window right' })

-- general
map('n', '<C-s>', '<cmd>w<cr>', { desc = 'Save File' })
map('i', '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })
map('n', '<leader>q', '<cmd>qa<cr><esc>', { desc = '[Q]uit' })
map('n', '<leader>bd', '<cmd>bd<cr>', { desc = '[B]uffer [D]elete' })
map('n', ']b', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Previous Buffer' })
map('n', '<leader>l', '<cmd>Lazy<cr>', { desc = '[L]azy' })
map('n', '<Esc>', '<cmd>noh<cr>', { desc = 'Clear highlights' })

