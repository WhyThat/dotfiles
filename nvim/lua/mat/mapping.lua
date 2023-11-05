-- move block
vim.keymap.set("n", "<C-k>", [[<Esc>:m .-2<CR>==]])
vim.keymap.set("n", "<C-j>", [[<Esc>:m .+1<CR>==]])

vim.keymap.set("v", "<C-k>", [[:m '<-2<CR>gv-gv]])
vim.keymap.set("v", "<C-j>", [[:m '>+1<CR>gv-gv]])

vim.keymap.set("n", "<leader>j",  "<C-w>j")
vim.keymap.set("n", "<leader>k",  "<C-w>k")
vim.keymap.set("n", "<leader>h",  "<C-w>h")
vim.keymap.set("n", "<leader>l",  "<C-w>l")

--
-- save buffer
vim.keymap.set("n", "<leader>w", vim.cmd.write)

-- select buffer
vim.keymap.set("n", "<C-p>", [[<Esc>:BufferPick<CR>]])

vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre",
})
vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word",
})
vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word",
})
vim.keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file",
})
