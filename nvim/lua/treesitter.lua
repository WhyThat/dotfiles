local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.reason = {
  install_info = {
    url = "/media/disk/home/mathieu/Sources/tree-sitter-reason", -- local path or git repo
    files = {"src/parser.c"}
  },
  filetype = "reason", -- if filetype does not agrees with parser name
}
parser_config.rescript = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-typescript",
    files = { "src/parser.c", "src/scanner.c" },
    location = "tree-sitter-tsx/tsx",
    generate_requires_npm = true,
  },
  filetype = 'rescript',
}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },

  },
}

parser_config.tsx.used_by = "rescript"
