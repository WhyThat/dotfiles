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

vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
    group = "LspAttach_inlayhints",
    callback = function(args)
        if not (args.data and args.data.client_id) then
            return
        end

        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        require("lsp-inlayhints").on_attach(bufnr, client)
    end,
})

local rename = function()
    -- local position_params = vim.lsp.util.make_position_params()
    -- local newName = "coucou"
    -- position_params.newName = newName
    -- vim.lsp.buf_request(0, "textDocument/rename", position_params, function(err, method, result, ...)
    --     P(result)
    --     vim.lsp.handlers["textDocument/rename"](err, method, result, ...)
    -- end)
    vim.lsp.buf.rename()
end

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
        print("LSP started (" .. client.name .. ").")
        if ensuredOption.navic then
            navic.attach(client, bufnr)
        end
        local lsp_format = vim.api.nvim_create_augroup("LSPFormat", { clear = true })
        vim.api.nvim_create_autocmd({ "BufWritePre" }, {
            group = lsp_format,
            callback = function()
                if not ensuredOption.formatCmd then
                    vim.lsp.buf.formatting_sync()
                end
            end,
            buffer = bufnr,
        })

        if not ensuredOption.formatCmd then
            mapN("<leader>=", vim.lsp.buf.formatting)
        else
            mapN("<leader>=", ensuredOption.formatCmd .. "<CR><CR>", true)
        end

        require("lsp-inlayhints").on_attach(bufnr, client)
        if client.server_capabilities.codeLensProvider then
            local codelens = vim.api.nvim_create_augroup("LSPCodeLens", { clear = true })
            vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "CursorHold" }, {
                group = codelens,
                callback = function()
                    vim.lsp.codelens.refresh()
                end,
                buffer = bufnr,
            })
        end
        require("lspkind").init({})
        mapN("<leader>dl", "<cmd>Telescope diagnostics<CR>")
        mapN("<leader>lr", "<cmd>Telescope lsp_references<CR>")
        mapN("gD", vim.lsp.buf.declaration)
        mapN("gd", vim.lsp.buf.definition)
        mapN("K", vim.lsp.buf.hover)
        mapN("gs", vim.lsp.buf.signature_help)
        mapN("gi", vim.lsp.buf.implementation)
        mapN("gt", vim.lsp.buf.type_definition)
        mapN("<leader>gw", vim.lsp.buf.document_symbol)
        mapN("<leader>gW", vim.lsp.buf.workspace_symbol)
        mapN("<leader>af", vim.lsp.buf.code_action)
        mapN("<leader>ee", vim.diagnostic.get)
        mapN("<leader>rn", rename)
        mapN("<leader>ai", vim.lsp.buf.incoming_calls)
        mapN("<leader>ao", vim.lsp.buf.outgoing_calls)
        mapN("]c", vim.diagnostic.goto_next)
        mapN("[c", vim.diagnostic.goto_prev)
    end
end
require("configs.lsp.lua").init(custom_attach({ formatCmd = ":Format", navicEnabled = true }))
require("configs.lsp.diagnosticls").init(custom_attach())

local lspconfig_util = require("lspconfig.util")
local rescriptLspPath = "/media/disk/home/mathieu/Sources/rescript-vscode/server/out/server.js"
-- local rescriptLspPath = "/home/mathieu/Downloads/rescript/extension/server/out/server.js"
local function open_compiled_file(bufnr)
    bufnr = require("lspconfig").util.validate_bufnr(bufnr)
    local params = { uri = vim.uri_from_bufnr(bufnr) }
    vim.lsp.buf_request(bufnr, "rescript-vscode.open_compiled", params, function(err, ctx, _)
        if err then
            return
        end
        if ctx and ctx.uri then
            vim.api.nvim_command("edit " .. ctx.uri)
        end
    end)
end

local function create_interface(bufnr)
    bufnr = require("lspconfig").util.validate_bufnr(bufnr)
    local params = { uri = vim.uri_from_bufnr(bufnr) }
    vim.lsp.buf_request(bufnr, "rescript-vscode.create_interface", params, function(err, ctx, _)
        if err then
            return
        end
    end)
end

lspconfig.rescriptls.setup({
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    cmd = { "node", rescriptLspPath, "--stdio" },
    filetypes = { "rescript" },
    root_dir = lspconfig_util.root_pattern("bsconfig.json", ".git"),
    on_attach = custom_attach({ formatCmd = nil, navicEnabled = false }),
    init_options = {
        extensionConfiguration = {
            inlayHints = {
                enable = true,
                maxLength = 25,
            },
            signatureHelp = {
                enable = true,
            },
            -- codeLens = true,
            askToStartBuild = false,
        },
    },
    commands = {
        OpenCompiled = {
            function()
                open_compiled_file(0)
            end,
            description = "Open compiled file",
        },
        CreateInterface = {
            function()
                create_interface(0)
            end,
            description = "Create interface",
        },
    },
})

lspconfig.rust_analyzer.setup({
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    filetypes = { "rust" },
    on_attach = custom_attach(),
})

lspconfig.tsserver.setup({
    init_options = require("nvim-lsp-ts-utils").init_options,
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    filetypes = { "typescript", "typescriptreact", "javascript" },
    on_attach = function(client, bufnr)
        local ts_utils = require("nvim-lsp-ts-utils")

        custom_attach({ navicEnabled = true, formatCmd = "<cmd>!prettier -w %" })(client, bufnr)

        -- defaults
        ts_utils.setup({
            debug = false,
            disable_commands = false,
            enable_import_on_completion = false,

            -- import all
            import_all_timeout = 5000, -- ms
            -- lower numbers = higher priority
            import_all_priorities = {
                same_file = 1, -- add to existing import statement
                local_files = 2, -- git files or files with relative path markers
                buffer_content = 3, -- loaded buffer content
                buffers = 4, -- loaded buffer names
            },
            import_all_scan_buffers = 100,
            import_all_select_source = false,
            -- if false will avoid organizing imports
            always_organize_imports = true,

            -- filter diagnostics
            filter_out_diagnostics_by_severity = {},
            filter_out_diagnostics_by_code = {},

            -- inlay hints
            auto_inlay_hints = false,
            inlay_hints_highlight = "Comment",
            inlay_hints_priority = 200, -- priority of the hint extmarks
            inlay_hints_throttle = 150, -- throttle the inlay hint request
            inlay_hints_format = { -- format options for individual hint kind
                Type = {},
                Parameter = {},
                Enum = {},
                -- Example format customization for `Type` kind:
                -- Type = {
                --     highlight = "Comment",
                --     text = function(text)
                --         return "->" .. text:sub(2)
                --     end,
                -- },
            },

            -- update imports on file move
            update_imports_on_move = false,
            require_confirmation_on_move = false,
            watch_dir = nil,
        })
        ts_utils.setup_client(client)
        local opts = { silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
    end,
})

lspconfig.ocamllsp.setup({
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    filetypes = { "ocaml", "reason", "reason.react" },
    on_attach = custom_attach(),
})

lspconfig.vimls.setup({ on_attach = custom_attach() })
lspconfig.hls.setup({ on_attach = custom_attach() })
-- require('rust-tools').setup({})
-- require("lspconfig").tailwindcss.setup({})
