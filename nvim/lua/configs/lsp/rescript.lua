local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'

local rescriptLspPath =  '/media/disk/home/mathieu/Sources/rescript-vscode/server/out/server.js'
if not lspconfig.rescriptlsp then
  configs.rescriptlsp = {
    default_config = {
      cmd = {'node', rescriptLspPath, '--stdio'};
      root_dir = lspconfig.util.root_pattern('bsconfig.json', '.git');
      settings = {};
    };
  }
end

local M = {}

local init = function (custom_attach)
  lspconfig.rescriptlsp.setup{
    filetypes = {"rescript"},
    on_attach = custom_attach
  }
end

M.init = init
return M
