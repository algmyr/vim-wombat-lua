local lush = require "lush"

local c = require "wombat_lua.colors"

local s = {
  none = "none ", -- ok?
  bold = "bold ",
  italic = "italic ",
  underline = "underline ",
  underlineline = "underlineline ",
  underdouble = "underdouble ",
  undercurl = "undercurl ",
  underdot = "underdot ",
  underdotted = "underdotted ",
  underdash = "underdash ",
  underdashed = "underdashed ",
  strikethrough = "strikethrough ",
  altfont = "altfont ",
  reverse = "reverse ",
  standout = "standout ",
  nocombine = "nocombine ",
}

---@diagnostic disable: undefined-global
local wombat = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- General
    Normal { fg = c.norm, bg = c.main_bg },
    Cursor { fg = c.main_bg, bg = c.norm },
    Visual { fg = c.none, bg = c.visual_bg },
    VisualNOS { fg = c.none, bg = c.bg_very_subtle },
    Search { fg = c.search, bg = c.search_bg },
    Folded { fg = c.fold, bg = c.fold_bg },
    WinSeparator { fg = c.norm_accent, bg = c.bg_accent },
    LineNr { fg = c.norm_accent, bg = c.bg_accent, gui = s.none },
    CursorLine { fg = c.none, bg = c.bg_very_subtle, gui = s.none },
    CursorColumn { fg = c.none, bg = c.bg_very_subtle, gui = s.none },
    ColorColumn { fg = c.none, bg = c.error, gui = s.none },
    MatchParen { fg = c.match_paren, bg = c.match_paren_bg, gui = s.bold },
    Title { fg = c.bright_text, bg = c.none, gui = s.bold },

    -- Pmenu (and pmenu scrollbar)
    Pmenu { fg = c.norm, bg = c.bg_accent, gui = s.none },
    PmenuSel { fg = c.norm, bg = c.bg_very_subtle, gui = s.bold },
    -- PmenuSbar { fg=c.norm, bg=c.bg_subtle, gui = s.none},
    -- PmenuThumb { fg=c.norm, bg=c.bg_subtle, gui = s.none},

    -- Diff
    DiffAdd { fg = c.none, bg = c.diff_add },
    DiffDelete { fg = c.none, bg = c.diff_delete },
    DiffChange { fg = c.none, bg = c.diff_change },
    DiffText { fg = c.none, bg = c.none, gui = s.underline .. s.bold },

    VcsignsDiffTextAdd { fg = c.none, bg = c.diff_text_add },
    VcsignsDiffTextDelete { fg = c.none, bg = c.diff_text_delete },
    -- Unsure why I have to specify the bg here,
    -- seems the default uses the diff line color?
    SignAdd { fg = c.sign_add, bg = c.bg_accent, gui = s.none },
    SignChange { fg = c.sign_change, bg = c.bg_accent, gui = s.none },
    SignChangeDelete {
      fg = c.sign_change_delete,
      bg = c.bg_accent,
      gui = s.none,
    },
    SignDelete { fg = c.sign_delete, bg = c.bg_accent, gui = s.none },
    SignDeleteFirstLine {
      fg = c.sign_delete_first_line,
      bg = c.bg_accent,
      gui = s.none,
    },

    SignifySignAdd { SignAdd },
    SignifySignChange { SignChange },
    SignifySignChangeDelete { SignChangeDelete },
    SignifySignDelete { SignDelete },
    SignifySignDeleteFirstLine { SignDeleteFirstLine },

    GitGutterAdd { SignAdd },
    GitGutterDelete { SignDelete },
    GitGutterChange { SignChange },
    GitGutterChangeDelete { SignChangeDelete },

    -- Misc
    SpecialKey { fg = c.mid_gray, bg = c.none, gui = s.none },
    Underlined { fg = c.none, bg = c.none, gui = s.underline .. s.bold },
    Ignore { fg = c.main_bg, bg = c.none, gui = s.none },

    Error { fg = c.error, bg = c.none, gui = s.none },
    Warning { fg = c.warning, bg = c.none, gui = s.none },
    Hint { fg = c.annotation, bg = c.none, gui = s.none },
    Info { fg = c.annotation, bg = c.none, gui = s.none },

    ErrorMsg { fg = c.error, bg = c.none, gui = s.none },
    WarningMsg { fg = c.warning, bg = c.none, gui = s.none },
    MoreMsg { fg = c.mid_gray, bg = c.none, gui = s.none },
    ModeMsg { MoreMsg },

    NonText { fg = c.non_text, bg = c.none, gui = s.none },
    Note { fg = c.none, bg = c.none, gui = s.bold }, --

    -- ?
    SignColumn { fg = c.mid_gray, bg = c.bg_accent, gui = s.none },
    FoldColumn { fg = c.mid_gray, bg = c.bg_accent, gui = s.none },

    -- Syntax - Main groups
    Statement { fg = c.statement, bg = c.none, gui = s.none },
    Keyword { Statement },
    Conditional { Statement },
    Repeat { Statement },
    Label { Statement },
    Exception { Statement },

    Constant { fg = c.constant, bg = c.none, gui = s.none },
    Number { Constant },
    Boolean { Constant },
    Float { Constant },

    PreProc { Constant },
    Include { PreProc },
    Define { PreProc },
    Macro { PreProc },
    PreCondit { PreProc },

    Identifier { fg = c.identifier, bg = c.none, gui = s.none },
    Function { fg = c.func, bg = c.none, gui = s.none },
    FunctionCall { fg = c.func, bg = c.none, gui = s.none },

    Type { fg = c.type, bg = c.none, gui = s.none },
    StorageClass { Type },
    Structure { Type },
    Typedef { Type },

    Special { fg = c.special, bg = c.none, gui = s.none },
    SpecialChar { Special },
    Tag { Special },
    Delimiter { Special },
    SpecialComment { Special },
    Debug { Special },

    String { fg = c.string, bg = c.none },
    Character { fg = c.character, bg = c.none },
    StringEscape { fg = c.escape, bg = c.none },
    DocString { fg = c.docstring, bg = c.none },

    Comment { fg = c.comment, bg = c.none },
    Operator { fg = c.operator, bg = c.none },
    Todo { fg = c.main_bg, bg = c.todo },

    Namespace { fg = c.namespace, bg = c.none },
    Attribute { fg = c.attribute, bg = c.none },

    Noop { fg = c.norm_accent, bg = c.none, gui = s.none },
    CocFadeOut { Noop },

    Annotation { fg = c.annotation, bg = c.none },
    LspInlayHint { NonText },
    CocInlayHint { NonText },
    DiagnosticHint { NonText },

    DiagnosticSignHint { Hint },
    DiagnosticSignInfo { Info },
    DiagnosticSignWarn { Warning },
    DiagnosticSignError { Error },
    DiagnosticHint { Hint },
    DiagnosticInfo { Info },
    DiagnosticWarn { Warning },
    DiagnosticError { Error },
    DiagnosticUnnecessary { NonText },

    -- require("wombat_lua.groups.treesitter").build(Group, c, g, s)

    -- TOSORT
    WombatGreen { fg = c.type, bg = c.none, gui = s.none },

    NoiceCmdlineIcon { Normal },
    NoiceCmdlinePopupBorder { Normal },
    NoiceCmdlineIconSearch { WombatGreen },
    NoiceCmdlinePopupBorderSearch { WombatGreen },

    NormalFloat { fg = c.norm_accent, bg = c.bg_accent },

    IblIndent { fg = c.bg_more_subtle, bg = c.none, gui = s.none },
    IblScope { fg = c.norm_accent, bg = c.none, gui = s.none },

    BufferLineFill { fg = c.none, bg = c.bg_accent },
    BufferLineSeparator { fg = c.bg_accent, bg = c.bg_accent },
    BufferLineSeparatorVisible { fg = c.bg_accent, bg = c.main_bg },
    BufferLineSeparatorSelected { fg = c.bg_accent, bg = c.main_bg },

    -- Treesitter
    UnknownThing { fg = c.norm, bg = c.unknown },
    -- Structured following:
    --   https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights

    -- Identifiers
    sym("@variable") { Identifier }, -- various variable names
    sym("@variable.builtin") { Identifier }, -- built-in variable names (e.g. `this`)
    sym("@variable.parameter") { Normal }, -- parameters of a function
    sym("@variable.parameter.builtin") { Normal }, -- special parameters (e.g. `_`, `it`)
    sym("@variable.member") { Identifier }, -- object and struct fields

    sym("@constant") { Constant }, -- constant identifiers
    sym("@constant.builtin") { Constant }, -- built-in constant values
    sym("@constant.macro") { Constant }, -- constants defined by the preprocessor

    sym("@module") { Namespace }, -- modules or namespaces
    sym("@module.builtin") { Namespace }, -- built-in modules or namespaces
    sym("@label") { Label }, -- GOTO and other labels (e.g. `label:` in C), including heredoc labels

    -- Literals
    sym("@string") { String }, -- string literals
    sym("@string.documentation") { DocString }, -- string documenting code (e.g. Python docstrings)
    sym("@string.regexp") { String }, -- regular expressions
    sym("@string.escape") { StringEscape }, -- escape sequences
    sym("@string.special") { String }, -- other special strings (e.g. dates)
    sym("@string.special.symbol") { Special }, -- symbols or atoms
    sym("@string.special.url") { String }, -- URIs (e.g. hyperlinks)
    sym("@string.special.path") { String }, -- filenames

    sym("@character") { Character }, -- character literals
    sym("@character.special") { Character }, -- special characters (e.g. wildcards)

    sym("@boolean") { Boolean }, -- boolean literals
    sym("@number") { Number }, -- numeric literals
    sym("@number.float") { Float }, -- floating-point number literals

    -- Types
    sym("@type") { Type }, -- type or class definitions and annotations
    sym("@type.builtin") { Type }, -- built-in types
    sym("@type.definition") { Type }, -- identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)

    sym("@attribute") { Attribute }, -- attribute annotations (e.g. Python decorators, Rust lifetimes)
    sym("@attribute.builtin") { Attribute }, -- builtin annotations (e.g. `@property` in Python)
    sym("@property") { Identifier }, -- the key in key/value pairs
    sym("@property.toml") { Type },
    sym("@property.jjconfig") { Type },

    -- Functions
    sym("@function") { Function }, -- function definitions
    sym("@function.builtin") { Function }, -- built-in functions
    sym("@function.call") { FunctionCall }, -- function calls
    sym("@function.macro") { Function }, -- preprocessor macros

    sym("@function.method") { Function }, -- method definitions
    sym("@function.method.call") { FunctionCall }, -- method calls

    sym("@constructor") { Function }, -- constructor calls and definitions
    sym("@operator") { Operator }, -- symbolic operators (e.g. `+` / `*`)

    -- Keywords
    sym("@keyword") { Keyword }, -- keywords not fitting into specific categories
    sym("@keyword.coroutine") { Keyword }, -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
    sym("@keyword.function") { Keyword }, -- keywords that define a function (e.g. `func` in Go, `def` in Python)
    sym("@keyword.operator") { Keyword }, -- operators that are English words (e.g. `and` / `or`)
    sym("@keyword.import") { Include }, -- keywords for including or exporting modules (e.g. `import` / `from` in Python)
    sym("@keyword.type") { Keyword }, -- keywords describing namespaces and composite types (e.g. `struct`, `enum`)
    sym("@keyword.modifier") { Keyword }, -- keywords modifying other constructs (e.g. `const`, `static`, `public`)
    sym("@keyword.repeat") { Repeat }, -- keywords related to loops (e.g. `for` / `while`)
    sym("@keyword.return") { Keyword }, -- keywords like `return` and `yield`
    sym("@keyword.debug") { Keyword }, -- keywords related to debugging
    sym("@keyword.exception") { Exception }, -- keywords related to exceptions (e.g. `throw` / `catch`)

    sym("@keyword.conditional") { Conditional }, -- keywords related to conditionals (e.g. `if` / `else`)
    sym("@keyword.conditional.ternary") { Conditional }, -- ternary operator (e.g. `?` / `:`)

    sym("@keyword.directive") { PreProc }, -- various preprocessor directives & shebangs
    sym("@keyword.directive.define") { PreProc }, -- preprocessor definition directives

    -- Punctuation
    sym("@punctuation.delimiter") { Special }, -- delimiters (e.g. `;` / `.` / `,`)
    sym("@punctuation.bracket") { Special }, -- brackets (e.g. `()` / `{}` / `[]`)
    sym("@punctuation.special") { Special }, -- special symbols (e.g. `{}` in string interpolation)

    -- Comments
    sym("@comment") { Comment }, -- line and block comments
    sym("@comment.documentation") { Comment }, -- comments documenting code

    sym("@comment.error") { Error }, -- error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED`)
    sym("@comment.warning") { Warning }, -- warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)
    sym("@comment.todo") { Todo }, -- todo-type comments (e.g. `TODO`, `WIP`)
    sym("@comment.note") { Note }, -- note-type comments (e.g. `NOTE`, `INFO`, `XXX`)

    -- Markup
    -- Mainly for markup languages.
    --sym("@markup.strong") { Normal },         -- bold text
    --sym("@markup.italic") { Normal },         -- italic text
    --sym("@markup.strikethrough") { Normal },  -- struck-through text
    --sym("@markup.underline") { Normal },      -- underlined text (only for literal underline markup!)

    Header { fg = c.header, bg = c.none, gui = s.bold }, -- headings, titles (e.g. `#` in Markdown)
    sym("@markup.heading") { Header }, -- headings, titles (including markers)
    sym("@markup.heading.1") { Header }, -- top-level heading
    sym("@markup.heading.2") { Header }, -- section heading
    sym("@markup.heading.3") { Header }, -- subsection heading
    sym("@markup.heading.4") { Header }, -- and so on
    sym("@markup.heading.5") { Header }, -- and so forth
    sym("@markup.heading.6") { Header }, -- six levels ought to be enough for anybody

    sym("@markup.quote") { String }, -- block quotes
    sym("@markup.math") { Special }, -- math environments (e.g. `$ ... $` in LaTeX)

    sym("@markup.link") { Operator }, -- text references, footnotes, citations, etc.
    sym("@markup.link.label") {}, -- link, reference descriptions
    sym("@markup.link.url") { Special }, -- URL-style links

    sym("@markup.raw") { String }, -- literal or verbatim text (e.g. inline code)
    sym("@markup.raw.block") { String }, -- literal or verbatim text as a stand-alone block
    --                                  -- (use priority 90 for blocks with injections)

    sym("@markup.list") { Operator }, -- list markers
    sym("@markup.list.checked") { Operator, gui = s.bold }, -- checked todo-style list markers
    sym("@markup.list.unchecked") { Operator }, -- unchecked todo-style list markers

    sym("@diff.plus") { DiffAdd }, -- added text (for diff files)
    sym("@diff.minus") { DiffDelete }, -- deleted text (for diff files)
    sym("@diff.delta") { DiffChange }, -- changed text (for diff files)

    sym("@tag") { Keyword }, -- XML-style tag names (and similar)
    sym("@tag.builtin") { Keyword }, -- builtin tag names (e.g. HTML5 tags)
    sym("@tag.attribute") { Attribute }, -- XML-style tag attributes
    sym("@tag.delimiter") { Delimiter }, -- XML-style tag delimiters

    -- Non-highlighting captures
    sym("@conceal") {}, -- captures that are only meant to be concealed

    sym("@spell") {}, -- for defining regions to be spellchecked
    sym("@nospell") {}, -- for defining regions that should NOT be spellchecked
  }
end)

return wombat

-- vim: set fdm=marker:
