local ls = require("luasnip")

ls.config.set_config({})

ls.snippets = {
    rescript = R("snips/rescript"),
}

vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})
