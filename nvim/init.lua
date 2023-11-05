-- require("mat.disable")
-- vim.filetype.add({
--     extension = {
--         eslintrc = "json",
--         scm = "scheme",
--         prettierrc = "json",
--         conf = "conf",
--         mdx = "markdown",
--         re = "reason",
--         rei = "reason",
--         norg = "norg",
--         toto = "rescript",
--     },
--     filename = {
--         ["a.toto"] = function()
--             print("coucou a.toto")
--             return "rescript"
--         end,
--     },
-- })
-- require("my_filetype")
require("global")
require("mat.options")
require("mat.mapping")
require("mat.theme")
require("mat.plugins")


-- FOLDS MANAGEMENT
-- local vim = vim
-- local api = vim.api
-- local opt = vim.opt
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- local format_group = api.nvim_create_augroup("FormatGroup", { clear = true })
-- api.nvim_create_autocmd(
-- 	{ "BufReadPost", "FileReadPost", "BufWritePost" },
-- 	{ pattern = "*", command = "normal zvzz", group = format_group }
-- )
--
