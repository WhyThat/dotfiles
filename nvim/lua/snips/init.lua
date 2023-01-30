local ls = require("luasnip")

ls.config.set_config({})

local rescript_snippets = require("snips/rescript")
ls.add_snippets("rescript", rescript_snippets)

vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})
