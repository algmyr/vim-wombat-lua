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

    Comment { fg = c.comment, bg = c.none },
    Operator { fg = c.operator, bg = c.none },
    Todo { fg = c.main_bg, bg = c.todo },

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

    TODO { fg = c.todo, bg = c.none },

    -- TOSORT
    WombatGreen { fg = c.type, bg = c.none, gui = s.none },

    NoiceCmdlineIcon { Normal },
    NoiceCmdlinePopupBorder { Normal },
    NoiceCmdlineIconSearch { WombatGreen },
    NoiceCmdlinePopupBorderSearch { WombatGreen },

    NormalFloat { fg = c.norm_accent, bg = c.bg_accent },

    IblIndent { fg = c.bg_more_subtle, bg = c.none, gui = s.none },
    IblScope { fg = c.norm_accent, bg = c.none, gui = s.none },

    -- Treesitter
    UnknownThing { fg = c.norm, bg = c.unknown },
    -- Structured following:
    --   https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights

    -- Misc
    -- @errors is TS errors. Wildly noisy if you enable it.
    -- sym("@error") { ErrorMsg },
    sym("@comment") { Comment }, -- line and block comments
    -- sym("@none") { UnknownThing }, -- completely disable the highlight
    -- sym("@preproc") { UnknownThing }, -- various preprocessor directives & shebangs
    -- sym("@define") { UnknownThing }, -- preprocessor definition directives
    sym("@operator") { Operator }, -- symbolic operators (e.g. `+` / `*`)

    -- Punctuation
    sym("@punctuation.delimiter") { Special }, -- delimiters (e.g. `;` / `.` / `,`)
    sym("@punctuation.bracket") { Special }, -- brackets (e.g. `()` / `{}` / `[]`)
    sym("@punctuation.special") { Special }, -- special symbols (e.g. `{}` in string interpolation)

    -- Literals
    sym("@string") { String }, -- string literals
    sym("@string.regex") { String }, -- regular expressions
    sym("@string.escape") { StringEscape }, -- escape sequences
    sym("@string.special") { String }, -- other special strings (e.g. dates

    sym("@character") { Character }, -- character literals
    sym("@character.special") { Character }, -- special characters (e.g. wildcards

    sym("@boolean") { Boolean }, -- boolean literals
    sym("@number") { Number }, -- numeric literals
    sym("@float") { Float }, -- floating-point number literals

    -- Functions
    sym("@function") { Function }, -- function definitions
    sym("@function.builtin") { Function }, -- built-in functions
    -- sym("@function.call") { UnknownThing }, -- function calls
    sym("@function.macro") { Function }, -- preprocessor macros

    -- sym("@method") { Function }, -- method definitions
    -- -- sym("@method.call") { UnknownThing }, -- method calls

    sym("@constructor") { Function }, -- constructor calls and definitions
    sym("@parameter") { Normal }, -- parameters of a function

    -- Keywords
    sym("@keyword") { Keyword }, -- various keywords
    sym("@keyword.function") { Keyword }, -- keywords that define a function (e.g
    sym("@keyword.operator") { Keyword }, -- operators that are English words (e.g
    sym("@keyword.return") { Keyword }, -- keywords like `return` and `yield

    sym("@conditional") { Conditional }, -- keywords related to conditionals (e.g
    sym("@repeat") { Repeat }, -- keywords related to loops (e.g.
    -- sym("@debug") { UnknownThing }, -- keywords related to debugging
    sym("@label") { Label }, -- GOTO and other labels (e.g. `label:` in C)
    sym("@include") { Include }, -- keywords for including modules (e.g. `
    sym("@exception") { Exception }, -- keywords related to exceptions (e.g. `throw` / `catch`)

    -- Types
    sym("@type") { Type }, -- type definitions and annotations
    sym("@type.builtin") { Type }, -- built-in types
    -- sym("@type.definition") { UnknownThing }, -- type definitions (e.g. `typedef` in C)
    -- sym("@type.qualifier") { UnknownThing }, -- type qualifiers (e.g. `const`)

    -- sym("@storageclass") { UnknownThing }, -- visibility/life-time modifiers
    -- sym("@storageclass.lifetime") { UnknownThing }, -- life-time modifiers (e.g. `static`)
    -- sym("@attribute") { UnknownThing }, -- attribute annotations
    -- sym("@field") { UnknownThing }, -- object and struct fields
    sym("@property") { Identifier }, -- similar to `@field`
    sym("@property.toml") { Type },
    sym("@property.jjconfig") { Type },

    -- Identifiers
    sym("@variable") { Identifier }, -- various variable names
    -- sym("@variable.builtin") { UnknownThing }, -- built-in variable names

    sym("@constant") { Constant }, -- constant identifiers
    -- sym("@constant.builtin") { UnknownThing }, -- built-in constant values
    -- sym("@constant.macro") { UnknownThing }, -- constants defined by the preprocessor

    sym("@namespace") { fg = c.namespace, bg = c.none }, -- modules or namespaces
    sym("@symbol") { Special }, -- symbols or atoms

    -- Text
    sym("@text") { Normal }, -- non-structured text
    sym("@text.strong") { Normal }, -- bold text
    sym("@text.emphasis") { Normal }, -- text with emphasis
    sym("@text.underline") { Normal }, -- underlined text
    sym("@text.strike") { Normal }, -- strikethrough text
    sym("@text.title") { Normal }, -- text that is part of a title
    sym("@text.literal") { Normal }, -- literal or verbatim text
    sym("@text.uri") { UnknownThing }, -- URIs (e.g. hyperlinks)
    sym("@text.math") { UnknownThing }, -- math environments (e.g. `$ ... $` in LaTeX)
    sym("@text.environment") { UnknownThing }, -- text environments of markup languages
    sym("@text.environment.name") { UnknownThing }, -- text indicating the type of an environment
    sym("@text.reference") { Normal }, -- text references, footnotes, citations, etc.
    -- I think the defaults are fine here?
    sym("@text.todo") { TODO }, -- todo notes
    sym("@text.note") { Note }, -- info notes
    sym("@text.warning") { Warning }, -- warning notes
    sym("@text.danger") { Error }, -- danger/error notes

    sym("@text.diff.add") { DiffAdd }, -- added text (for diff files)
    sym("@text.diff.delete") { DiffDelete }, -- deleted text (for diff

    -- Tags
    sym("@tag") { Special }, -- XML tag names
    sym("@tag.attribute") { Special }, -- XML tag attributes
    sym("@tag.delimiter") { Special }, -- XML tag delimiters

    -- Conceal
    -- sym("@conceal") { UnknownThing }, -- for captures that are only used for concealing

    -- Spell
    -- sym("@spell") { UnknownThing }, -- for defining regions to be spellchecked
  }
end)

return wombat

-- vim: set fdm=marker:
