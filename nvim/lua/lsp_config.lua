vim.lsp.set_log_level("debug")
local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'

-- local rescriptLspPath =  '/home/mathieu/Downloads/rescript/extension/server/out/server.js'
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

local mapN = function(key, value)
	vim.api.nvim_buf_set_keymap(0,'n',key,value,{noremap = true, silent = false});
end

local inline_autocmd = function(filetype)
 vim.api.nvim_command('augroup InlineHover')
 vim.api.nvim_command('autocmd CursorHold * :lua require("lsp/helper").render_hover_doc() ')
 vim.api.nvim_command('augroup END')
end

local custom_attach = function(client)
	print("LSP started ("..client.name..").");
  inline_autocmd()
	require'completion'.on_attach(client)
  require('lspkind').init({})
  require'lsp_signature'.on_attach()
	mapN('gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
	mapN('gd','<cmd>lua vim.lsp.buf.definition()<CR>')
	mapN('K','<cmd>lua require\'lspsaga.hover\'.render_hover_doc()<CR>')
	mapN('gr',':Lspsaga rename<CR>')
	mapN('gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
	mapN('gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
	mapN('gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
	mapN('<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
	mapN('<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
	mapN('<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
	mapN('<leader>ee','<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
	mapN('<leader>rn','<cmd>lua vim.lsp.buf.rename()<CR>')
	mapN('<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
	mapN('<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
	mapN('<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
  mapN(
    ']c',
    '<cmd>lua require\'lspsaga.diagnostic\'.lsp_jump_diagnostic_next()<CR>'
  )
  mapN(
    '[c',
    '<cmd>lua require\'lspsaga.diagnostic\'.lsp_jump_diagnostic_prev()<CR><cmd>'
  )
end

lspconfig.tsserver.setup{
  filetypes={ "typescript", "typescriptreact", "javascript" },
  on_attach=custom_attach
}

lspconfig.ocamllsp.setup{
  filetypes = { "ocaml", "reason", "reason.react" },
  on_attach=custom_attach
}

lspconfig.vimls.setup{on_attach=custom_attach}
lspconfig.hls.setup{on_attach=custom_attach}

lspconfig.rescriptlsp.setup{
  filetypes = {"rescript"},
  on_attach = custom_attach
}

lspconfig.diagnosticls.setup{
  on_attach=custom_attach,
  filetypes = { 'json', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'scss', 'markdown', 'pandoc' },
  init_options = {
    linters = {
      eslint = {
        command = './node_modules/.bin/eslint',
        rootPatterns = { '.git' },
        debounce = 100,
        args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
        sourceName = 'eslint',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '[eslint] ${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning'
        }
      },
      markdownlint = {
        command = 'markdownlint',
        rootPatterns = { '.git' },
        isStderr = true,
        debounce = 100,
        args = { '--stdin' },
        offsetLine = 0,
        offsetColumn = 0,
        sourceName = 'markdownlint',
        securities = {
          undefined = 'hint'
        },
        formatLines = 1,
        formatPattern = {
          '^.*:(\\d+)\\s+(.*)$',
          {
            line = 1,
            column = -1,
            message = 2,
          }
        }
      }
    },
    filetypes = {
      javascript = 'eslint',
      javascriptreact = 'eslint',
      typescript = 'eslint',
      typescriptreact = 'eslint',
      markdown = 'markdownlint',
      pandoc = 'markdownlint'
    },
    formatters = {
      prettierEslint = {
        command = 'prettier-eslint',
        args = { '--stdin' },
        rootPatterns = { '.git' },
      },
      prettier = {
        command = 'prettier',
        args = { '--stdin-filepath', '%filename' }
      }
    },
    formatFiletypes = {
       css = 'prettier',
       javascript = 'prettierEslint',
       javascriptreact = 'prettierEslint',
       json = 'prettier',
       scss = 'prettier',
       typescript = 'prettierEslint',
       typescriptreact = 'prettierEslint'
    }
  }
}

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end
local sumneko_root_path = '/media/disk/home/mathieu/Sources/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

lspconfig.sumneko_lua.setup {
  on_attach=custom_attach,
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        enable = true,
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
}

local saga = require 'lspsaga'
saga.init_lsp_saga()
require'lsp_signature'.on_attach()


