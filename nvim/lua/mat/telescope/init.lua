--[[

TODO:
- do the thing with auto picking shorter results if possible for conni
- I wanna add something that gives a little minus points for certain pattern

  - scratch files get mins -0.001

--]]

SHOULD_RELOAD_TELESCOPE = true

local reloader = function()
    if SHOULD_RELOAD_TELESCOPE then
        RELOAD("plenary")
        RELOAD("popup")
        RELOAD("telescope")
    end
end

local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local themes = require("telescope.themes")

local set_prompt_to_entry_value = function(prompt_bufnr)
        local entry = action_state.get_selected_entry()
    if not entry or not type(entry) == "table" then
        return
    end

    action_state.get_current_picker(prompt_bufnr):reset_prompt(entry.ordinal)
end

local _ = pcall(require, "nvim-nonicons")

local M = {}

--[[
lua require('plenary.reload').reload_module("my_user.tele")

nnoremap <leader>en <cmd>lua require('my_user.tele').edit_neovim()<CR>
--]]
function M.edit_neovim()
    local opts_with_preview, opts_without_preview

    opts_with_preview = {
        prompt_title = "~ dotfiles ~",
        shorten_path = false,
        cwd = "~/.config/nvim",

        layout_strategy = "flex",
        layout_config = {
            width = 0.9,
            height = 0.8,

            horizontal = {
                width = { padding = 0.15 },
            },
            vertical = {
                preview_height = 0.75,
            },
        },

        attach_mappings = function(_, map)
            map("i", "<c-y>", set_prompt_to_entry_value)
            map("i", "<M-c>", function(prompt_bufnr)
                actions.close(prompt_bufnr)
                vim.schedule(function()
                    require("telescope.builtin").find_files(opts_without_preview)
                end)
            end)

            return true
        end,
    }

    opts_without_preview = vim.deepcopy(opts_with_preview)
    opts_without_preview.previewer = false

    require("telescope.builtin").find_files(opts_with_preview)
end

function M.edit_zsh()
    require("telescope.builtin").find_files({
        shorten_path = false,
        cwd = "~/.config/zsh/",
        prompt = "~ dotfiles ~",
        hidden = true,

        layout_strategy = "horizontal",
        layout_config = {
            preview_width = 0.55,
        },
    })
end

function M.edit_dmenu()
    require("telescope.builtin").find_files({
        shorten_path = false,
        cwd = "~/.dmenu/",
        prompt = "~ dotfiles ~",
        hidden = true,

        layout_strategy = "horizontal",
        layout_config = {
            preview_width = 0.55,
        },
    })
end

function M.fd()
    local opts = themes.get_ivy({ hidden = false })
    require("telescope.builtin").fd(opts)
end

function M.builtin()
    require("telescope.builtin").builtin()
end

function M.git_files()
    local path = vim.fn.expand("%:h")
    if path == "" then
        path = nil
    end

    local width = 0.65

    local opts = themes.get_dropdown({
        winblend = 5,
        shorten_path = false,

        cwd = path,

        layout_config = {
            width = width,
        },
    })

    require("telescope.builtin").git_files(opts)
end

function M.org_files()
    require("telescope.builtin").find_files({
        cwd = "~/orgmode/",
    })
end

function M.design_system()
    local basePath = vim.fn.expand("%:h")
    local baseName = vim.fn.expand("%:t:r")

    local opts

    opts = themes.get_dropdown({
        prompt_title = "~ similar ~",
        winblend = 5,
        sorting_strategy = "ascending",
        scroll_telesstrategy = "cycle",
        previewer = false,
        layout_config = {
            prompt_position = "top",
            width = 0.25,
        },
        find_command = {
            "rg",
            "--no-ignore",
            "--files",
            basePath,
            "__tests__",
            "__stories__",
            "cypress/integrations",
        },
        default_text = baseName,
    })

    require("telescope.builtin").find_files(opts)
end

function M.lsp_code_actions()
    local opts = themes.get_dropdown({
        winblend = 10,
        border = true,
        previewer = false,
        shorten_path = false,
    })

    require("telescope.builtin").lsp_code_actions(opts)
end

function M.live_grep()
    require("telescope.builtin").live_grep({
        -- shorten_path = true,
        -- cwd = "./node_modules/@arte/arte-vp/dist",
        fzf_separator = "|>",
    })
end

function M.grep_prompt()
    require("telescope.builtin").grep_string({
        path_display = { "shorten" },
        search = vim.fn.input("Grep String > "),
    })
end

function M.grep_last_search(opts)
    opts = opts or {}

    -- \<getreg\>\C
    -- -> Subs out the search things
    local register = vim.fn.getreg("/"):gsub("\\<", ""):gsub("\\>", ""):gsub("\\C", "")

    opts.path_display = { "shorten" }
    opts.word_match = "-w"
    opts.search = register

    require("telescope.builtin").grep_string(opts)
end

function M.oldfiles()
    require("telescope").extensions.frecency.frecency()
end

function M.installed_plugins()
    require("telescope.builtin").find_files({
        cwd = vim.fn.stdpath("data") .. "/site/pack/packer/start/",
    })
end

function M.buffers()
    require("telescope.builtin").buffers({
        shorten_path = false,
    })
end

function M.curbuf()
    local opts = themes.get_dropdown({
        winblend = 10,
        border = true,
        previewer = false,
        shorten_path = false,
    })
    require("telescope.builtin").current_buffer_fuzzy_find(opts)
end

function M.help_tags()
    require("telescope.builtin").help_tags({
        show_version = true,
    })
end

function M.file_browser(opts)
    require 'telescope'.extensions.file_browser.file_browser(opts)
end

function M.git_status()
    local opts = themes.get_dropdown({
        winblend = 10,
        border = true,
        previewer = false,
        shorten_path = false,
    })

    require("telescope.builtin").git_status(opts)
end

function M.git_commits()
    require("telescope.builtin").git_commits({
        winblend = 5,
    })
end

function M.search_only_certain_files()
    require("telescope.builtin").find_files({
        find_command = {
            "rg",
            "--files",
            "--type",
            vim.fn.input("Type: "),
        },
    })
end

function M.lspreferences()
    require("telescope.builtin").lsp_references({
        layout_strategy = "vertical",
        layout_config = {
            width=0.9,
            prompt_position = "top",
        },
        sorting_strategy = "ascending",
        ignore_filename = false,
    })
end

-- configure telescope to open lsp diagnostics_by_line
function M.lsp_diagnostic()
    local theme = themes.get_dropdown({
            previewer = true,
        -- layout_strategy = "vertical",
        -- layout_config = {
        --     prompt_position = "top",
        -- },
        -- sorting_strategy = "ascending",
        -- ignore_filename = false,
    })
    require("telescope.builtin").diagnostics(theme)
end


function M.lsp_implementations()
    require("telescope.builtin").lsp_implementations({
        layout_strategy = "vertical",
        layout_config = {
            prompt_position = "top",
        },
        sorting_strategy = "ascending",
        ignore_filename = false,
    })
end

return setmetatable({}, {
    __index = function(_, k)
        reloader()

        if M[k] then
            return M[k]
        else
            return require("telescope.builtin")[k]
        end
    end,
})
