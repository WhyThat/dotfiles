local M = {}

local rescriptExtensionPath = "/media/disk/home/mathieu/Sources/rescript-vscode/"
local rescriptAnalystBinary = rescriptExtensionPath .. "analysis/rescript-editor-analysis.exe"
local title = "Reanalyze"

local function to_qflist(data)
    return {
        text = data.message,
        filename = data.file,
        lnum = data.range[1] + 1,
        lnumend = data.range[3] + 1,
        col = data.range[2] + 1,
        colend = data.range[4] + 1,
        type = "E",
    }
end

local function add_datas_to_quickfix(mode, datas)
    local qf_entries = {}
    for _, data in ipairs(datas) do
        table.insert(qf_entries, to_qflist(data))
    end
    vim.fn.setqflist({}, mode, { title = title, items = qf_entries })
end

local function run_reanalyze()
    local cmd = rescriptAnalystBinary .. " reanalyze -dce -json"
    local index = 1
    local result

    vim.fn.jobstart(cmd, {
        on_stdout = function(_, data, _)
            if index == 2 then
                result = vim.fn.json_decode(data)
            end
            index = index + 1
        end,
        on_exit = function()
            if result then
                local qf_entries = vim.fn.getqflist({ context = 1, id = 1, title = 1 })
                local mode = " "
                if qf_entries.title == title then
                    mode = "r"
                end

                add_datas_to_quickfix(mode, result)
            end
        end,
    })
end

local autocmd_group = nil

function M.start()
    if autocmd_group == nil then
        autocmd_group = vim.api.nvim_create_augroup(title, { clear = true })
        vim.api.nvim_create_autocmd("BufWritePost", {
            group = autocmd_group,
            pattern = { "*.res", "*.resi" },
            callback = function()
                run_reanalyze()
            end,
        })
    end
end

function M.stop()
    if not autocmd_group == nil then
        vim.api.nvim_del_augroup_by_id({ id = autocmd_group })
        autocmd_group = nil
    end
end

return M
