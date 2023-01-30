vim.g.tokyonight_italic_functions = true
-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
-- Load the colorscheme
vim.cmd([[colorscheme tokyonight]])

-- local navic = require("nvim-navic")
require("lualine").setup({
    theme = "tokyonight",
    -- sections = {
    --     lualine_c = {
    --         { navic.get_location, cond = navic.is_available },
    --     },
    -- },
})

local alacrittyTheme = {
    dark = "alacritty_tokyonight_night.yml",
    light = "alacritty_tokyonight_day.yml",
}

local changeAlacrittyTheme = function(theme)
    vim.api.nvim_command("silent !alacritty-colorscheme apply " .. theme)
end

local setLight = function()
    changeAlacrittyTheme(alacrittyTheme.light)
    vim.o.background = "light"
end

local setDark = function()
    changeAlacrittyTheme(alacrittyTheme.dark)
    vim.o.background = "dark"
end

local toggle = function()
    if vim.o.background == "light" then
        setDark()
    else
        setLight()
    end
end

return {
    toggle = toggle,
    setLight = setLight,
    setDark = setDark,
}
