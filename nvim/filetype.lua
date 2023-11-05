vim.filetype.add({
    extension = {
        eslintrc = "json",
        scm = "scheme",
        prettierrc = "json",
        conf = "conf",
        mdx = "markdown",
        re = "reason",
        rei = "reason",
        norg = "norg",
        env = "sh",
        res="rescript",
        resi="rescript",
    },
    pattern = {
        [".env.*"] = "sh",
        ["README"] = function(path, bufnr)
            if string.find("#", vim.api.nvim_buf_get_lines(bufnr, 0, 1, true)) then
                return "markdown"
            end

            -- no return means the filetype won't be set and to try the next method
        end,
    },
})
