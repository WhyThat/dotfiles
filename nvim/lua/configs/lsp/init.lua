vim.lsp.set_log_level("error")

local lspconfig = require("lspconfig")
local navic = require("nvim-navic")

local mapN = function(key, value, silent)
    local ensured_silent = silent
    if not ensured_silent then
        ensured_silent = false
    end
    vim.keymap.set("n", key, value, { buffer = 0 })
end

vim.diagnostic.config({
    virtual_text = true,
    sings = false,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        show_header = true,
        border = "rounded",
        focusable = false,
        source = "always",
    },
})

local float_options = {
    border = "rounded",
    max_width = math.ceil(vim.api.nvim_win_get_width(0) * 0.6),
    max_height = math.ceil(vim.api.nvim_win_get_height(0) * 0.8),
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, float_options)

local inlayhints_group = vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
    group = inlayhints_group,
    callback = function(args)
        if not (args.data and args.data.client_id) then
            return
        end

        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        require("lsp-inlayhints").on_attach(client, bufnr)
    end,
})

local custom_attach = function(option)
    local ensuredOption = {}
    if not option then
        ensuredOption = {
            formatCmd = nil,
            navicEnabled = false,
        }
    else
        ensuredOption = option
    end

    return function(client, bufnr)
        -- print("LSP started (" .. client.name .. ").")
        if ensuredOption.navic then
            navic.attach(client, bufnr)
        end
        local lsp_format = vim.api.nvim_create_augroup("LSPFormat", { clear = true })
        vim.api.nvim_create_autocmd({ "BufWritePre" }, {
            group = lsp_format,
            callback = function()
                if not ensuredOption.formatCmd then
                    vim.lsp.buf.format()
                end
            end,
            buffer = bufnr,
        })

        if not ensuredOption.formatCmd then
            vim.keymap.set("n", "<leader>=", function()
                vim.lsp.buf.format()
            end)
        else
            mapN("<leader>=", ensuredOption.formatCmd .. "<CR><CR>", true)
        end

        require("lspkind").init({})
        mapN("<leader>dl", "<cmd>Telescope diagnostics<CR>")
        mapN("<leader>lr", "<cmd>Telescope lsp_references<CR>")
        mapN("<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>")
        mapN("gD", vim.lsp.buf.declaration)
        mapN("gd", vim.lsp.buf.definition)
        mapN("K", vim.lsp.buf.hover)
        mapN("gs", vim.lsp.buf.signature_help)
        mapN("gi", vim.lsp.buf.implementation)
        mapN("gt", vim.lsp.buf.type_definition)
        mapN("<leader>gW", vim.lsp.buf.workspace_symbol)
        mapN("<leader>af", vim.lsp.buf.code_action)
        mapN("<leader>ee", vim.diagnostic.get)
        vim.keymap.set("n", "<leader>rn", function()
            return ":IncRename " .. vim.fn.expand("<cword>")
        end, { expr = true })
        mapN("<leader>ai", vim.lsp.buf.incoming_calls)
        mapN("<leader>ao", vim.lsp.buf.outgoing_calls)
        mapN("]c", vim.diagnostic.goto_next)
        mapN("[c", vim.diagnostic.goto_prev)
    end
end

require("configs.lsp.lua").init(custom_attach({ formatCmd = ":Format", navicEnabled = true }))
require("configs.lsp.diagnosticls").init(custom_attach())
require("configs.lsp.rescript").init(custom_attach)
require("configs.lsp.typescript").init(custom_attach)
-- require("configs.lsp.nullls").setup(custom_attach)

lspconfig.rust_analyzer.setup({
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    filetypes = { "rust" },
    on_attach = custom_attach(),
})

lspconfig.ocamllsp.setup({
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    filetypes = { "ocaml", "reason", "reason.react" },
    on_attach = custom_attach(),
})

lspconfig.vimls.setup({ on_attach = custom_attach() })
lspconfig.hls.setup({ on_attach = custom_attach() })
lspconfig.terraformls.setup({ on_attach = custom_attach() })
lspconfig.tflint.setup({ on_attach = custom_attach() })
lspconfig.svelte.setup({ on_attach = custom_attach() })
