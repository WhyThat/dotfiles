TelescopeMapArgs = TelescopeMapArgs or {}

local map_tele = function(key, f, options, buffer)
    local map_key = vim.api.nvim_replace_termcodes(key .. f, true, true, true)

    TelescopeMapArgs[map_key] = options or {}

    local mode = "n"
    local rhs = string.format("<cmd>lua R('mat.telescope')['%s'](TelescopeMapArgs['%s'])<CR>", f, map_key)

    local map_options = {
        noremap = true,
        silent = true,
    }

    if not buffer then
        vim.api.nvim_set_keymap(mode, key, rhs, map_options)
    else
        vim.api.nvim_buf_set_keymap(0, mode, key, rhs, map_options)
    end
end

map_tele("<leader>ff", "git_files")
map_tele("<leader>fF", "file_browser", { hidden = true, depth = false })
map_tele("<leader>fe", "git_status")
map_tele("<leader>fb", "buffers")
map_tele("<leader>ev", "edit_neovim")
map_tele("<leader>fN", "file_browser")
map_tele("<leader>ft", "design_system")

map_tele("??", "live_grep")
map_tele("//", "curbuf")
