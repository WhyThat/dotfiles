local lspconfig = require("lspconfig")
local M = {}
local system_name
if vim.fn.has("mac") == 1 then
    system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
elseif vim.fn.has("win32") == 1 then
    system_name = "Windows"
else
    print("Unsupported system for sumneko")
end
local sumneko_root_path = "/media/disk/home/mathieu/Sources/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"

local init = function(custom_attach)
    lspconfig.lua_ls.setup({
        on_attach = custom_attach,
        cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
        commands = {
            Format = {
                function()
                    vim.cmd("!stylua --config-path ~/dotfiles/nvim/lua/stylua.toml %")
                end,
            },
        },
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = "LuaJIT",
                    -- Setup your lua path
                    path = vim.split(package.path, ";"),
                },
                diagnostics = {
                    enable = true,
                    -- Get the language server to recognize the `vim` global
                    globals = { "vim" },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                    },
                },
            },
        },
    })
end

M.init = init
return M
