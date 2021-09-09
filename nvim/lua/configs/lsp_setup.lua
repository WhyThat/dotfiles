vim.lsp.set_log_level("debug")
local lspconfig = require'lspconfig'


local mapN = function(key, value)
	vim.api.nvim_buf_set_keymap(0,'n',key,value,{noremap = true, silent = false});
end

local inline_autocmd = function()
  vim.api.nvim_command('augroup InlineHover')
  vim.api.nvim_command('autocmd CursorHold * :lua require("configs.lsp.hover").render_hover_doc() ')
  vim.api.nvim_command('augroup END')
end

local custom_attach = function(client)
  print("LSP started ("..client.name..").");
  inline_autocmd()
  -- require'completion'.on_attach(client)
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

require('configs.lsp.rescript').init(custom_attach)
require('configs.lsp.lua').init(custom_attach)
require('configs.lsp.diagnosticls').init(custom_attach)

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

local saga = require 'lspsaga'
saga.init_lsp_saga()
require'lsp_signature'.on_attach()


