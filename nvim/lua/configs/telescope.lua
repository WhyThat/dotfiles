local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        layout_strategy = "flex",
        scroll_strategy = "cycle",
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
    },
    extensions = {
        -- fzf = {
        --     fuzzy = true,
        --     override_generic_sorter = true,
        --     override_file_sorter = true,
        --     case_mode = "smart_case",
        -- },
        file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                },
                ["n"] = {
                    -- your custom normal mode mappings
                },
            },
        },
    },
    pickers = {
        lsp_references = require("telescope.themes").get_ivy(),
        lsp_definitions = require("telescope.themes").get_dropdown({
            layout_config = {
                width = 0.8,
            },
        }),
        diagnostics = require("telescope.themes").get_ivy(),
        lsp_implementations = require("telescope.themes").get_dropdown(),
        buffers = {
            sort_lastused = true,
            previewer = false,
        },
    },
})
telescope.load_extension("luasnip")
telescope.load_extension("file_browser")
telescope.load_extension("fzy_native")
