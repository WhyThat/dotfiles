local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<TAB>", ":BufferNext<CR>", opts)
map("n", "<S-TAB>", ":BufferPrevious<CR>", opts)
map("n", "gb", ":BufferPick<CR>", opts)
-- Close buffer
map("n", "<leader>q", ":BufferWipeout<CR>", opts)
map("n", "<leader>qA", ":BufferCloseAllButCurrent<CR>", opts)
