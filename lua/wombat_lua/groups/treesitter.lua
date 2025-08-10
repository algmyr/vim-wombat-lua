local M = {}

function M.build(Group, c, g, s)
  Group.new("UnknownThing", c.norm, c.unknown)

  -- Structured following:
  --   https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights

  -- Misc {{{1
  -- @errors is TS errors. Wildly noisy if you enable it.
  -- Group.link("@error", g.ErrorMsg)     -- syntax/parser errors
  Group.link("@comment", g.Comment) -- line and block comments
  -- Group.link("@none", g.UnknownThing) -- completely disable the highlight
  -- Group.link("@preproc", g.UnknownThing) -- various preprocessor directives & shebangs
  -- Group.link("@define", g.UnknownThing) -- preprocessor definition directives
  Group.link("@operator", g.Operator) -- symbolic operators (e.g. `+` / `*`)

  -- Punctuation {{{1
  Group.link("@punctuation.delimiter", g.Special) -- delimiters (e.g. `;` / `.` / `,`)
  Group.link("@punctuation.bracket", g.Special) -- brackets (e.g. `()` / `{}` / `[]`)
  Group.link("@punctuation.special", g.Special) -- special symbols (e.g. `{}` in string interpolation)

  -- Literals {{{1
  Group.link("@string", g.String) -- string literals
  Group.link("@string.regex", g.String) -- regular expressions
  Group.link("@string.escape", g.StringEscape) -- escape sequences
  Group.link("@string.special", g.String) -- other special strings (e.g. dates)

  Group.link("@character", g.Character) -- character literals
  Group.link("@character.special", g.Character) -- special characters (e.g. wildcards)

  Group.link("@boolean", g.Boolean) -- boolean literals
  Group.link("@number", g.Number) -- numeric literals
  Group.link("@float", g.Float) -- floating-point number literals

  -- Functions {{{1
  Group.link("@function", g.Function) -- function definitions
  Group.link("@function.builtin", g.Function) -- built-in functions
  -- Group.link("@function.call", g.UnknownThing) -- function calls
  Group.link("@function.macro", g.Function) -- preprocessor macros

  Group.link("@method", g.Function) -- method definitions
  -- Group.link("@method.call", g.UnknownThing) -- method calls

  Group.link("@constructor", g.Function) -- constructor calls and definitions
  Group.link("@parameter", g.Normal) -- parameters of a function

  -- Keywords {{{1
  Group.link("@keyword", g.Keyword) -- various keywords
  Group.link("@keyword.function", g.Keyword) -- keywords that define a function (e.g. `func` in Go,  `def` in Python)
  Group.link("@keyword.operator", g.Keyword) -- operators that are English words (e.g. `and` / `or`)
  Group.link("@keyword.return", g.Keyword) -- keywords like `return` and `yield`

  Group.link("@conditional", g.Conditional) -- keywords related to conditionals (e.g. `if` / `else`)
  Group.link("@repeat", g.Repeat) -- keywords related to loops (e.g. `for` / `while`)
  -- Group.link("@debug", g.UnknownThing) -- keywords related to debugging
  Group.link("@label", g.Label) -- GOTO and other labels (e.g. `label:` in C)
  Group.link("@include", g.Include) -- keywords for including modules (e.g. `import` / `from` in Python)
  Group.link("@exception", g.Exception) -- keywords related to exceptions (e.g. `throw` / `catch`)

  -- Types {{{1
  Group.link("@type", g.Type) -- type or class definitions and annotations
  Group.link("@type.builtin", g.Type) -- built-in types
  -- Group.link("@type.definition", g.UnknownThing) -- type definitions (e.g. `typedef` in C)
  -- Group.link("@type.qualifier", g.UnknownThing) -- type qualifiers (e.g. `const`)

  -- Group.link("@storageclass", g.UnknownThing) -- visibility/life-time modifiers
  -- Group.link("@storageclass.lifetime", g.UnknownThing) -- life-time modifiers (e.g. `static`)
  -- Group.link("@attribute", g.UnknownThing) -- attribute annotations (e.g. Python decorators)
  -- Group.link("@field", g.UnknownThing) -- object and struct fields
  Group.link("@property", g.Identifier) -- similar to `@field`
  Group.link("@property.toml", g.Type)
  Group.link("@property.jjconfig", g.Type)

  -- Identifiers {{{1
  Group.link("@variable", g.Identifier) -- various variable names
  -- Group.link("@variable.builtin", g.UnknownThing) -- built-in variable names (e.g. `this`)

  Group.link("@constant", g.Constant) -- constant identifiers
  -- Group.link("@constant.builtin", g.UnknownThing) -- built-in constant values
  -- Group.link("@constant.macro", g.UnknownThing) -- constants defined by the preprocessor

  Group.new("@namespace", c.namespace, c.none) -- modules or namespaces
  Group.link("@symbol", g.Special) -- symbols or atoms

  -- Text {{{1
  Group.link("@text", g.Normal) -- non-structured text
  Group.link("@text.strong", g.Normal) -- bold text
  Group.link("@text.emphasis", g.Normal) -- text with emphasis
  Group.link("@text.underline", g.Normal) -- underlined text
  Group.link("@text.strike", g.Normal) -- strikethrough text
  Group.link("@text.title", g.Normal) -- text that is part of a title
  Group.link("@text.literal", g.Normal) -- literal or verbatim text
  Group.link("@text.uri", g.UnknownThing) -- URIs (e.g. hyperlinks)
  Group.link("@text.math", g.UnknownThing) -- math environments (e.g. `$ ... $` in LaTeX)
  Group.link("@text.environment", g.UnknownThing) -- text environments of markup languages
  Group.link("@text.environment.name", g.UnknownThing) -- text indicating the type of an environment
  Group.link("@text.reference", g.Normal) -- text references, footnotes, citations, etc.

  -- I think the defaults are fine here?
  -- Group.link("@text.todo", g.TODO)    -- todo notes
  Group.link("@text.note", g.Note) -- info notes
  Group.link("@text.warning", g.Warning) -- warning notes
  Group.link("@text.danger", g.Error) -- danger/error notes

  Group.link("@text.diff.add", g.DiffAdd) -- added text (for diff files)
  Group.link("@text.diff.delete", g.DiffDelete) -- deleted text (for diff files)

  -- Tags {{{1
  Group.link("@tag", g.Special) -- XML tag names
  Group.link("@tag.attribute", g.Special) -- XML tag attributes
  Group.link("@tag.delimiter", g.Special) -- XML tag delimiters

  -- Conceal {{{1
  -- Group.link("@conceal", g.UnknownThing) -- for captures that are only used for concealing

  -- Spell {{{1
  -- Group.link("@spell", g.UnknownThing) -- for defining regions to be spellchecked
  -- Other/Unknown {{{1

  -- Non-standard
  -- @variable.global

  -- Undocumented or invalid?
  Group.link("@annotation", g.UnknownThing)
  --Group.link("@parameter.reference", g.UnknownThing)
  -- }}}1
end

return M

-- vim: set fdm=marker:
