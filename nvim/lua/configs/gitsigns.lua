local map_with_bufnr = function(bufnr)
    return function(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
    end
end

local navigation_mapping = function(gs, map)
    map("n", "]C", function()
        gs.next_hunk()
        return "zz"
    end, { expr = true })

    map("n", "[C", function()
        gs.prev_hunk()
        return "zz"
    end, { expr = true })
end

local hunk_action = function(gs, map)
    map("n", "<leader>hs", gs.stage_hunk)
    map("n", "<leader>hr", gs.reset_hunk)
    map("v", "<leader>hs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end)
    map("v", "<leader>hr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end)
    map("n", "<leader>hS", gs.stage_buffer)
    map("n", "<leader>hu", gs.undo_stage_hunk)
    map("n", "<leader>hR", gs.reset_buffer)
    map("n", "<leader>hp", gs.preview_hunk)
    map("n", "<leader>hb", function()
        gs.blame_line({ full = true })
    end)
    map("n", "<leader>tb", gs.toggle_current_line_blame)
    map("n", "<leader>hd", gs.diffthis)
    map("n", "<leader>hD", function()
        gs.diffthis("~")
    end)
    map("n", "<leader>td", gs.toggle_deleted)
end

local gitsignOnAttach = function()
    return function(bufnr)
        local gs = package.loaded.gitsigns
        local map = map_with_bufnr(bufnr)
        navigation_mapping(gs, map)
        hunk_action(gs, map)
    end
end

require("gitsigns").setup({
    on_attach = gitsignOnAttach(),
})
