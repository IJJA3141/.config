;; extends

(template_declaration
  (function_definition)
) @template_function

(
 (function_definition)@_def
 (#not-has-parent? @_def template_function)
) @function
