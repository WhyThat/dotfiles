local M = {}

local lspconfig = require("lspconfig")

local lspconfig_util = require("lspconfig.util")

local rescriptExtensionPath = "/media/disk/home/mathieu/Sources/rescript-vscode/"
local rescriptLspPath = rescriptExtensionPath .. "server/out/server.js"
-- local rescriptLspPath = "/home/mathieu/Downloads/rescript/extension/server/out/server.js"
--

M.init = function(custom_attach)
    lspconfig.rescriptls.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
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
            StartReanalyze = {
                function()
                    require("./reanalyze").start()
                end,
                description = "Start Reanalyze",
            },
            StopReanalyze = {
                function()
                    require("configs/reanalyze").stop()
                end,
                description = "Stop Reanalyze",
            },
        },
    })
end

return M
