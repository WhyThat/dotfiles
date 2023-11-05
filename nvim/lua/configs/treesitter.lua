local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.rescript = {
    install_info = {
        url = "https://github.com/nkrkv/tree-sitter-rescript",
        branch = "main",
        files = { "src/parser.c", "src/scanner.c" },
        requires_generate_from_grammar = true,
    },
    filetype = "rescript",
}
--
-- Load custom tree-sitter grammar for org filetype
require("nvim-treesitter.configs").setup({
    autotag = {
        enable = true,
        filetypes = {
            "html",
            "javascript",
            "javascriptreact",
            "typescriptreact",
            "svelte",
            "vue",
            "rescript",
        },
    },
    matchup = {
        enable = true,
    },
    query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "org" },
    },
    indent = {
        enable = true,
    },
    markid = {
        enable = true,
        colors = {
            "#DD6722",
            "#81C71F",
            "#116E1F",
            "#1FC7B9",
            "#2283DD",
            "#461FC7",
            "#BE1FC7",
            "#657383",
            "#342D7E",
            "#578E8D",
            "#8E5758",
            "#678349",
            "#654983",
            "#8E8357",
            "#4E577E",
            "#785462",
            "#54786A",
            "#7A7C50",
            "#5C5A8C",
            "#B93B8F",
            "#48CCCD",
            "#79BAEC",
            "#3EA99F",
            "#736AFF",
            "#667C26",
            "#C68E17",
            "#7E2217",
            "#817339",
        },
        is_supported = function(lang)
            return true
        end,
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
        },
    },
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ib"] = "@block.inner",
                ["ab"] = "@block.outer",
                ["ip"] = "@parameter.inner",
                ["ap"] = "@parameter.outer",

                -- Or you can define your own textobjects like this
                -- ["iF"] = {
                --   rescript = "(let_binding (function body: (block @function.inner))) @function.outer"
                -- },
            },
        },
    },
})
require("nvim-biscuits").setup({
    default_config = {
        toggle_keybind = "<leader>cb",
        show_on_start = false,
        max_length = 120,
        min_distance = 15,
        prefix_string = " 📎 ",
    },
    language_config = {
        html = {
            prefix_string = " 🌐 ",
        },
        javascript = {
            prefix_string = " ✨ ",
            max_length = 80,
        },
        rescript = {},
    },
})
