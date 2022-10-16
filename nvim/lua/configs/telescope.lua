local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        layout_strategy = "flex",
        scroll_strategy = "cycle",
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous
            }
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    },
    pickers = {
        lsp_references = { theme = "dropdown" },
        lsp_code_actions = { theme = "dropdown" },
        lsp_definitions = { theme = "dropdown" },
        lsp_implementations = { theme = "dropdown" },
        buffers = {
            sort_lastused = true,
            previewer = false,
        },
    },
})
telescope.load_extension("luasnip")
