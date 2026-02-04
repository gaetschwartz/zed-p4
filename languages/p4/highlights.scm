; highlights.scm for P4 language
; Converted from TextMate grammar and tree-sitter-p4 queries

; ============================================================================
; Comments
; ============================================================================

(comment) @comment

; ============================================================================
; Preprocessor directives
; ============================================================================

(preproc) @keyword.directive

; ============================================================================
; Strings
; ============================================================================

(string_literal) @string

; ============================================================================
; Numbers
; ============================================================================

(number) @number
(decimal) @number
(hex) @number
(whex) @number
(wdecimal) @number

; ============================================================================
; Constants / Booleans
; ============================================================================

(bool) @constant.builtin
"true" @constant.builtin
"false" @constant.builtin

; ============================================================================
; Types - Built-in
; ============================================================================

"bool" @type.builtin
"error" @type.builtin
"int" @type.builtin
"bit" @type.builtin
"varbit" @type.builtin
"packet_in" @type.builtin
"packet_out" @type.builtin
"tuple" @type.builtin

(bit_type) @type.builtin
(varbit_type) @type.builtin
(tuple_type) @type.builtin

; ============================================================================
; Types - User-defined
; ============================================================================

(type_identifier) @type

; ============================================================================
; Keywords - Definitions
; ============================================================================

"header" @keyword
"struct" @keyword
"typedef" @keyword
"extern" @keyword
"parser" @keyword
"control" @keyword
"package" @keyword
"action" @keyword
"table" @keyword
"const" @keyword

; ============================================================================
; Keywords - Control flow
; ============================================================================

"if" @keyword.conditional
"else" @keyword.conditional
"return" @keyword.return
"default" @keyword
"transition" @keyword
"select" @keyword
"state" @keyword
"apply" @keyword

; ============================================================================
; Keywords - Table elements
; ============================================================================

"key" @keyword
"actions" @keyword
"size" @keyword
"default_action" @keyword
"meters" @keyword
"counters" @keyword

; ============================================================================
; Keywords - Match types
; ============================================================================

(key_type) @type.builtin
"exact" @type.builtin
"ternary" @type.builtin
"lpm" @type.builtin
"range" @type.builtin
"optional" @type.builtin

; ============================================================================
; Keywords - Direction modifiers
; ============================================================================

(direction) @keyword
"in" @keyword
"out" @keyword
"inout" @keyword

; ============================================================================
; Special identifiers
; ============================================================================

"NoAction" @function.builtin
"_" @variable.builtin

; ============================================================================
; Functions and methods
; ============================================================================

; Method/function calls
(call
  (fval
    (method_identifier) @function.call))

; Method/function definitions in actions
(action
  (method_identifier) @function)

; Method/function definitions in control/parser
(control_definition
  (method_identifier) @function)

(parser_definition
  (method_identifier) @function)

(function_declaration
  (method_identifier) @function)

; Method definitions in extern
(method
  (method_identifier) @function)

; State definitions in parser
(state
  (method_identifier) @function)

; Table names
(table
  (type_identifier) @type)

; ============================================================================
; Operators
; ============================================================================

(binop) @operator

"=" @operator
"==" @operator
"!=" @operator
">=" @operator
"<=" @operator
">" @operator
"<" @operator
"+" @operator
"-" @operator
"*" @operator
"/" @operator
"%" @operator
"|" @operator
"||" @operator
"&" @operator
"&&" @operator
"&&&" @operator
"<<" @operator
">>" @operator
"!" @operator
".." @operator

; ============================================================================
; Punctuation
; ============================================================================

"(" @punctuation.bracket
")" @punctuation.bracket
"{" @punctuation.bracket
"}" @punctuation.bracket
"[" @punctuation.bracket
"]" @punctuation.bracket

";" @punctuation.delimiter
"," @punctuation.delimiter
":" @punctuation.delimiter
"." @punctuation.delimiter

; ============================================================================
; Annotations
; ============================================================================

(annotation) @attribute
(annotation
  "@" @attribute)

; ============================================================================
; Variables and identifiers
; ============================================================================

; Field names in struct/header definitions
(field
  (identifier) @variable.member)

; Parameters
(parameter
  (identifier) @variable.parameter)

; Variable declarations in control body
(control_var
  (identifier) @variable)

; Preprocessor constants (all caps identifiers)
(identifier_preproc) @constant

; Generic identifiers in lval (property access)
(lval
  (identifier) @variable)

; fval identifiers (object part before method call)
(fval
  (identifier) @variable)
