(call_expression
   arguments: [
               (arguments (labeled_argument label: (_) @markid !value) )
               (arguments (value_identifier ) @markid )
               ]
   )
(function
  parameters: [
               (formal_parameters (parameter (value_identifier) @markid))
               (formal_parameters (parameter (labeled_parameter (value_identifier) @markid)))
               ]
  )

((module_identifier) @markid)
((jsx_identifier) @markid)
(let_binding (value_identifier) @markid)
(pipe_expression (value_identifier) @markid)
(record (record_field (property_identifier) @markid))
(variant (arguments (value_identifier) @markid))
(jsx_attribute (property_identifier) @markid)
(let_binding (tuple_pattern (tuple_item_pattern (value_identifier) @markid)) )
((value_identifier) @markid)
((variant_identifier) @markid)
((type_identifier) @markid)
((property_identifier) @markid)


