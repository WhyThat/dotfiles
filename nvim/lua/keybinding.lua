local mapN = function(key, value)
    vim.api.nvim_buf_set_keymap(0, "n", key, value, { noremap = true, silent = false })
end

-- Toggle between light and dark theme
