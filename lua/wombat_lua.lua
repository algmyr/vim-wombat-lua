-- vim: set fdm=marker:
-- TODO port work config changes?

local Color = require("colorbuddy.init").Color
local Group = require("colorbuddy.init").Group
local c = require("colorbuddy.init").colors
local g = require("colorbuddy.init").groups
local s = require("colorbuddy.init").styles

local my_colors = {
  -- Syntax elements
  constant       = '#E5786D',
  namespace      = '#E5786D',
  statement      = '#88B8F6',
  operator       = '#88B8F6',
  identifier     = '#E3E0D7',
  func           = '#CAE682',
  type           = '#D4D987',
  special        = '#EADEAD',
  string         = '#95E454',
  escape         = '#D787FF',
  character      = '#E5786D',

  -- Diffing
  diff_add               = '#006600',
  diff_delete            = '#880000',
  diff_change            = '#444400',
  sign_add               = '#33cc33',
  sign_change            = '#cccc33',
  sign_change_delete     = '#ee9933',
  sign_delete            = '#cc3333',
  sign_delete_first_line = '#cc3333',

  -- Misc highlight
  comment        = '#9C998E',
  non_text       = '#6e696c',
  bright_text    = '#ffffd7',

  -- UI
  search         = '#D787FF',
  search_bg      = '#636066',
  fold           = '#E3E0D7', -- norm, for now
  fold_bg        = '#3A4046',
  match_paren    = '#EAE788',
  match_paren_bg = '#857B6F',
  visual_bg      = '#554D4B',

  bg_accent      = '#1C1C1C',
  norm_accent    = '#9C998E',
  main_bg        = '#242424',
  norm           = '#E3E0D7',
  bg_very_subtle = '#303030',
  bg_more_subtle = '#3a3a3a',
  bg_subtle      = '#444444',

  mid_gray       = '#838086',

  -- LSP and diagnostics
  annotation     = '#00bbbb',
  warning        = '#E7ED30',
  error          = '#FF444A',
  todo           = '#D4D987',

  -- TODO
  note           = '#00FF00',
  note_bg        = '#0000FF',

  unknown        = '#FF2026',
}

for key, value in pairs(my_colors) do
  Color.new(key, value)
end

-- General {{{1
Group.new("Normal",       c.norm,        c.main_bg)
Group.new("Cursor",       c.main_bg,     c.norm)
Group.new("Visual",       c.none,        c.visual_bg)
Group.new("VisualNOS",    c.none,        c.bg_very_subtle)
Group.new("Search",       c.search,      c.search_bg)
Group.new("Folded",       c.fold,        c.fold_bg)
Group.new('VertSplit',    c.norm_accent, c.bg_accent)
Group.new("LineNr",       c.norm_accent, c.bg_accent,      s.none)
Group.new("CursorLine",   c.none,        c.bg_very_subtle, s.none)
Group.new("CursorColumn", c.none,        c.bg_very_subtle, s.none)
Group.new("ColorColumn",  c.none,        c.error,          s.none)
Group.new("MatchParen",   c.match_paren, c.match_paren_bg, s.bold)
Group.new("Title",        c.bright_text, c.none,           s.bold)

-- Pmenu (and pmenu scrollbar) {{{1
Group.new("Pmenu",    c.norm, c.bg_accent,      s.none)
Group.new("PmenuSel", c.norm, c.bg_very_subtle, s.bold)
--Group.new("PmenuSbar", c.norm, c.bg_subtle, s.none)
--Group.new("PmenuThumb", c.norm, c.bg_subtle, s.none)

-- Diff {{{1
Group.new("DiffAdd",    c.none, c.diff_add)
Group.new("DiffDelete", c.none, c.diff_delete)
Group.new("DiffChange", c.none, c.diff_change)
Group.new("DiffText",   c.none, c.diff_change, s.underline+s.bold)

-- Unsure why I have to specify the bg here,
-- seems the default uses the diff line color?
Group.new("SignAdd", c.sign_add, c.bg_accent, s.none)
Group.new("SignChange", c.sign_change, c.bg_accent, s.none)
Group.new("SignChangeDelete", c.sign_change_delete, c.bg_accent, s.none)
Group.new("SignDelete", c.sign_delete, c.bg_accent, s.none)
Group.new("SignDeleteFirstLine", c.sign_delete_first_line, c.bg_accent, s.none)

Group.link("SignifySignAdd",             g.SignAdd)
Group.link("SignifySignChange",          g.SignChange)
Group.link("SignifySignChangeDelete",    g.SignChangeDelete)
Group.link("SignifySignDelete",          g.SignDelete)
Group.link("SignifySignDeleteFirstLine", g.SignDeleteFirstLine)

Group.link("GitGutterAdd",          g.SignAdd)
Group.link("GitGutterDelete",       g.SignDelete)
Group.link("GitGutterChange",       g.SignChange)
Group.link("GitGutterChangeDelete", g.SignChangeDelete)

-- Misc {{{1
Group.new("SpecialKey", c.mid_gray, c.none, s.none)
Group.new("Underlined", c.none,     c.none, s.underline)
Group.new("Ignore",     c.main_bg,  c.none, s.none)

Group.new("Error",   c.error,    c.none, s.none)
Group.new("Warning", c.warning,  c.none, s.none)
Group.new("Hint",    c.annotation, c.none, s.none)
Group.new("Info",    c.annotation, c.none, s.none)

Group.new("ErrorMsg",   c.error,    c.none, s.none)
Group.new("WarningMsg", c.warning,  c.none, s.none)
Group.new("MoreMsg",    c.mid_gray, c.none, s.none)
Group.link("ModeMsg",   g.MoreMsg)

Group.new("NonText", c.non_text, c.none, s.none)
Group.new("Note",    c.none,     c.none, s.bold) -- e.g. TODO and FIXME

-- ? {{{1
--Group.new("Directory",    c.dark_blue,   c.none,           s.none)
--Group.new("IncSearch",    c.light_black, c.yellow,         s.none)
--Group.new("CursorLineNr", c.purple,      c.bg_very_subtle, s.none)
--Group.new("Question",     c.unknown,     c.none,           s.none)
--Group.new("WildMenu",     c.main_bg,     c.norm,           s.none)
--Group.new("Folded",       c.medium_gray, c.none,           s.none)

Group.new("SignColumn", c.none,     c.bg_accent, s.none)
Group.new("FoldColumn", c.mid_gray, c.bg_accent, s.none)

--Group.new("TabLine",     c.norm,   c.bg_very_subtle, s.none)
--Group.new("TabLineSel",  c.purple, c.bg_subtle,      s.bold)
--Group.new("TabLineFill", c.norm,   c.bg_very_subtle, s.none)

--Group.new("MatchParen", c.norm,        c.bg_subtle, s.none)
--Group.new("qfLineNr",   c.medium_gray, c.none,      s.none)
--Group.new("htmlH1",     c.norm,        c.bg,        s.none)
--Group.new("htmlH2",     c.norm,        c.bg,        s.none)
--Group.new("htmlH3",     c.norm,        c.bg,        s.none)
--Group.new("htmlH4",     c.norm,        c.bg,        s.none)
--Group.new("htmlH5",     c.norm,        c.bg,        s.none)
--Group.new("htmlH6",     c.norm,        c.bg,        s.none)

-- Syntax - Main groups {{{1
Group.new("Statement",    c.statement, c.none, s.none)
Group.link("Keyword",     g.Statement)
Group.link("Conditional", g.Statement)
Group.link("Repeat",      g.Statement)
Group.link("Label",       g.Statement)
Group.link("Keyword",     g.Statement)
Group.link("Exception",   g.Statement)

Group.new("Constant", c.constant, c.none, s.none)
Group.link("Number",  g.Constant)
Group.link("Boolean", g.Constant)
Group.link("Float",   g.Constant)

Group.link("PreProc",   g.Constant)
Group.link("Include",   g.PreProc)
Group.link("Define",    g.PreProc)
Group.link("Macro",     g.PreProc)
Group.link("PreCondit", g.PreProc)

Group.new("Identifier", c.identifier, c.none, s.none)
Group.new("Function",   c.func,       c.none, s.none)

Group.new("Type",          c.type, c.none, s.none)
Group.link("StorageClass", g.Type)
Group.link("Structure",    g.Type)
Group.link("Typedef",      g.Type)

Group.new("Special",         c.special, c.none, s.none)
Group.link("SpecialChar",    g.Special)
Group.link("Tag",            g.Special)
Group.link("Delimiter",      g.Special)
Group.link("SpecialComment", g.Special)
Group.link("Debug",          g.Special)

Group.new("String",       c.string,    c.none)
Group.new("Character",    c.character, c.none)
Group.new("StringEscape", c.escape,    c.none)
--Group.link("Character", g.String)

Group.new("Comment",  c.comment,  c.none)
Group.new("Operator", c.operator, c.none)
Group.new("Todo",     c.main_bg,  c.todo)

Group.new("Noop",        c.norm_accent, c.none, s.none)
Group.link("CocFadeOut", g.Noop)

Group.new("Annotation",      c.annotation, c.none)
Group.link("LspInlayHint",   g.NonText)
Group.link("CocInlayHint",   g.NonText)
Group.link("DiagnosticHint", g.NonText)

Group.link("DiagnosticSignHint",    g.Hint)
Group.link("DiagnosticSignInfo",    g.Info)
Group.link("DiagnosticSignWarn",    g.Warning)
Group.link("DiagnosticSignError",   g.Error)
Group.link("DiagnosticHint",        g.Hint)
Group.link("DiagnosticInfo",        g.Info)
Group.link("DiagnosticWarn",        g.Warning)
Group.link("DiagnosticError",       g.Error)
Group.link("DiagnosticUnnecessary", g.NonText)

-- Syntax - Treesitter {{{1
Group.new("UnknownThing", c.norm, c.unknown)

-- Structured following:
--   https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights

-- Misc {{{2

-- @errors is TS errors. Wildly noisy if you enable it.
--Group.link("@error",     g.ErrorMsg)     -- syntax/parser errors
Group.link("@comment",   g.Comment)      -- line and block comments
--Group.link("@none",    g.UnknownThing) -- completely disable the highlight
--Group.link("@preproc", g.UnknownThing) -- various preprocessor directives & shebangs
--Group.link("@define",  g.UnknownThing) -- preprocessor definition directives
Group.link("@operator",  g.Operator)     -- symbolic operators (e.g. `+` / `*`)

-- Punctuation {{{2
Group.link("@punctuation.delimiter", g.Special) -- delimiters (e.g. `;` / `.` / `,`)
Group.link("@punctuation.bracket",   g.Special) -- brackets (e.g. `()` / `{}` / `[]`)
Group.link("@punctuation.special",   g.Special) -- special symbols (e.g. `{}` in string interpolation)

-- Literals {{{2
Group.link("@string",         g.String)       -- string literals
Group.link("@string.regex",   g.String)       -- regular expressions
Group.link("@string.escape",  g.StringEscape) -- escape sequences
Group.link("@string.special", g.String)       -- other special strings (e.g. dates)

Group.link("@character",         g.Character) -- character literals
Group.link("@character.special", g.Character) -- special characters (e.g. wildcards)

Group.link("@boolean", g.Boolean) -- boolean literals
Group.link("@number",  g.Number)  -- numeric literals
Group.link("@float",   g.Float)   -- floating-point number literals

-- Functions {{{2
Group.link("@function",         g.Function)     -- function definitions
Group.link("@function.builtin", g.Function)     -- built-in functions
--Group.link("@function.call",  g.UnknownThing) -- function calls
Group.link("@function.macro",   g.Function)     -- preprocessor macros

Group.link("@method",         g.Function)     -- method definitions
-- Group.link("@method.call", g.UnknownThing) -- method calls

Group.link("@constructor", g.Function) -- constructor calls and definitions
Group.link("@parameter",   g.Normal)   -- parameters of a function

-- Keywords {{{2
Group.link("@keyword",          g.Keyword) -- various keywords
Group.link("@keyword.function", g.Keyword) -- keywords that define a function (e.g. `func` in Go,  `def` in Python)
Group.link("@keyword.operator", g.Keyword) -- operators that are English words (e.g. `and` / `or`)
Group.link("@keyword.return",   g.Keyword) -- keywords like `return` and `yield`

Group.link("@conditional", g.Conditional)  -- keywords related to conditionals (e.g. `if` / `else`)
Group.link("@repeat",      g.Repeat)       -- keywords related to loops (e.g. `for` / `while`)
--Group.link("@debug",     g.UnknownThing) -- keywords related to debugging
Group.link("@label",       g.Label)        -- GOTO and other labels (e.g. `label:` in C)
Group.link("@include",     g.Include)      -- keywords for including modules (e.g. `import` / `from` in Python)
Group.link("@exception",   g.Exception)    -- keywords related to exceptions (e.g. `throw` / `catch`)

-- Types {{{2
Group.link("@type",              g.Type)         -- type or class definitions and annotations
Group.link("@type.builtin",      g.Type)         -- built-in types
--Group.link("@type.definition", g.UnknownThing) -- type definitions (e.g. `typedef` in C)
--Group.link("@type.qualifier",  g.UnknownThing) -- type qualifiers (e.g. `const`)

--Group.link("@storageclass",          g.UnknownThing) -- visibility/life-time modifiers
--Group.link("@storageclass.lifetime", g.UnknownThing) -- life-time modifiers (e.g. `static`)
--Group.link("@attribute",             g.UnknownThing) -- attribute annotations (e.g. Python decorators)
--Group.link("@field",                 g.UnknownThing) -- object and struct fields
Group.link("@property",                g.Identifier)   -- similar to `@field`

-- Identifiers {{{2
Group.link("@variable",           g.Identifier)   -- various variable names
--Group.link("@variable.builtin", g.UnknownThing) -- built-in variable names (e.g. `this`)

Group.link("@constant",           g.Constant)     -- constant identifiers
--Group.link("@constant.builtin", g.UnknownThing) -- built-in constant values
--Group.link("@constant.macro",   g.UnknownThing) -- constants defined by the preprocessor

Group.new("@namespace", c.namespace, c.none) -- modules or namespaces
Group.link("@symbol",   g.Special)           -- symbols or atoms

-- Text {{{2
Group.link("@text",                  g.Normal)       -- non-structured text
Group.link("@text.strong",           g.Normal)       -- bold text
Group.link("@text.emphasis",         g.Normal)       -- text with emphasis
Group.link("@text.underline",        g.Normal)       -- underlined text
Group.link("@text.strike",           g.Normal)       -- strikethrough text
Group.link("@text.title",            g.Normal)       -- text that is part of a title
Group.link("@text.literal",          g.Normal)       -- literal or verbatim text
Group.link("@text.uri",              g.UnknownThing) -- URIs (e.g. hyperlinks)
Group.link("@text.math",             g.UnknownThing) -- math environments (e.g. `$ ... $` in LaTeX)
Group.link("@text.environment",      g.UnknownThing) -- text environments of markup languages
Group.link("@text.environment.name", g.UnknownThing) -- text indicating the type of an environment
Group.link("@text.reference",        g.Normal)       -- text references, footnotes, citations, etc.


-- I think the defaults are fine here?
-- Group.link("@text.todo", g.TODO)    -- todo notes
Group.link("@text.note",    g.Note)    -- info notes
Group.link("@text.warning", g.Warning) -- warning notes
Group.link("@text.danger",  g.Error)   -- danger/error notes

Group.link("@text.diff.add",    g.DiffAdd)    -- added text (for diff files)
Group.link("@text.diff.delete", g.DiffDelete) -- deleted text (for diff files)

-- Tags {{{2
Group.link("@tag",           g.Special) -- XML tag names
Group.link("@tag.attribute", g.Special) -- XML tag attributes
Group.link("@tag.delimiter", g.Special) -- XML tag delimiters

-- Conceal {{{2
--Group.link("@conceal", g.UnknownThing) -- for captures that are only used for concealing

-- Spell {{{2
--Group.link("@spell", g.UnknownThing) -- for defining regions to be spellchecked

-- Non-standard
-- @variable.global

-------------------------------------

-- Undocumented or invalid?
Group.link("@annotation",            g.UnknownThing)
--Group.link("@parameter.reference", g.UnknownThing)

Group.new("TODO", c.none, c.none)  -- what even set this?

-- TOSORT {{{1
Group.new("WombatGreen", c.type, c.none, s.none)

Group.link("NoiceCmdlineIcon",              g.Normal) -- cmdline icon
Group.link("NoiceCmdlinePopupBorder",       g.Normal) -- cmdline border
Group.link("NoiceCmdlineIconSearch",        g.WombatGreen) -- search icon
Group.link("NoiceCmdlinePopupBorderSearch", g.WombatGreen) -- search border

Group.new('NormalFloat',    c.norm_accent, c.bg_accent)

Group.new("NoicePopupmenu",    c.norm, c.error,      s.none)

Group.new("IblIndent", c.bg_more_subtle, c.none, s.none)
Group.new("IblScope", c.norm_accent, c.none, s.none)
