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
    },
    pattern = {
        [".env.*"] = "sh",
    },
})
