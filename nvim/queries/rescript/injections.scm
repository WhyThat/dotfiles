((comment) @injection.content
  (#set! injection.language "jsdoc"))

; %re
(extension_expression
  (extension_identifier) @_name
  (#eq? @_name "re")
  (expression_statement (string (string_fragment) @injection.content))
  (#set! injection.language "regex"))
  

; %raw
(extension_expression
  (extension_identifier) @_name
  (#eq? @_name "raw")
  (expression_statement (string (string_fragment) @injection.content))
  (#set! injection.language "javascript"))

