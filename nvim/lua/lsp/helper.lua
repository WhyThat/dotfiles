local lsp,util = vim.lsp,vim.lsp.util
local helper = {}

local handler = function(_, _, result)
  if not (result)
  then
    print(" ")
    return
  end
  if (type(result) == "number")
  then
    print(" ")
    return
  end
  if not (result.contents)
  then
    print(" ")
    return
  end
  local markdown_lines = lsp.util.convert_input_to_markdown_lines(result.contents)
  markdown_lines = lsp.util.trim_empty_lines(markdown_lines)

  if vim.tbl_isempty(markdown_lines)
  then
    print(" ")
    return
  end
  local first_type_line = markdown_lines[2]
  print(first_type_line)
end

function helper.render_hover_doc()
  local params = util.make_position_params()
  vim.lsp.buf_request(0,'textDocument/hover', params, helper.handler)
end

helper.handler = handler

return helper;
