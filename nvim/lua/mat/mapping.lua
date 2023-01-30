-- move block
vim.keymap.set('n', '<C-k>', [[<Esc>:m .-2<CR>==]])
vim.keymap.set('n', '<C-j>', [[<Esc>:m .+1<CR>==]])


vim.keymap.set('v', '<C-k>', [[:m '<-2<CR>gv-gv]])
vim.keymap.set('v', '<C-j>', [[:m '>+1<CR>gv-gv]])
--
-- save buffer
vim.keymap.set('n', '<leader>w', vim.cmd.write)
