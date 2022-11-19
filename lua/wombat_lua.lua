-- vim: set fdm=marker:
-- TODO port work config changes?

local Color, colors, Group, groups, styles = require("colorbuddy").setup()
local c = colors
local g = groups
local s = styles

local my_colors = {
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
  character      = '#D787FF',

  search         = '#D787FF',
  search_bg      = '#636066',
  fold           = '#E3E0D7', -- norm, for now
  fold_bg        = '#3A4046',
  match_paren    = '#EAE788',
  match_paren_bg = '#857B6F',
  visual_bg      = '#554D4B',

  comment        = '#9C998E',
  non_text       = '#9C998E',

  bg_accent      = '#1C1C1C',
  norm_accent    = '#9C998E',
  main_bg        = '#242424',
  norm           = '#E3E0D7',
  bg_very_subtle = '#303030',
  bg_subtle      = '#444444',

  mid_gray       = '#636066',

  bright_text    = '#ffffd7',

  warning        = '#E4E967',
  error          = '#FF2026',
  todo           = '#D4D987',

  diff_add       = '#006600',
  diff_delete    = '#880000',
  diff_change    = '#444400',

  note           = '#00FF00',
  note_bg        = '#0000FF',

  unknown        = '#FF2026',
}

for key, value in pairs(my_colors) do
  Color.new(key, value)
end

-- General {{{1
Group.new("Normal",     c.norm,         c.main_bg)
Group.new("Cursor",     c.main_bg,      c.norm)
Group.new("Visual",     c.none,         c.visual_bg)
Group.new("VisualNOS",  c.none,         c.bg_very_subtle)
Group.new("Search",     c.search,       c.search_bg)
Group.new("Folded",     c.fold,         c.fold_bg)

Group.new('VertSplit',  c.norm_accent, c.bg_accent)

Group.new("LineNr", c.norm_accent, c.bg_accent, s.none)

Group.new("CursorLine",    c.none,         c.bg_very_subtle,  s.none)
Group.new("CursorColumn",  c.none,         c.bg_very_subtle,  s.none)
Group.new("ColorColumn",  c.none,          c.error,  s.none)

Group.new("MatchParen",    c.match_paren,  c.match_paren_bg,  s.bold)

Group.new("Title",      c.bright_text,  c.none,            styles.bold)

-- Pmenu (and pmenu scrollbar) {{{1
Group.new("Pmenu",         c.norm,         c.bg_accent,       s.none)
Group.new("PmenuSel",      c.norm,         c.bg_very_subtle,  s.bold)
--Group.new("PmenuSbar", c.norm, c.bg_subtle, s.none)
--Group.new("PmenuThumb", c.norm, c.bg_subtle, s.none)

-- Diff {{{1
Group.new("DiffAdd",    c.none, c.diff_add)
Group.new("DiffDelete", c.none, c.diff_delete)
Group.new("DiffChange", c.none, c.diff_change)
Group.new("DiffText",   c.none, c.diff_change, s.underline+s.bold)

-- Misc {{{1
Group.new("SpecialKey",  c.mid_gray,      c.none,  s.none)
Group.new("Error",       c.error,         c.none,  s.none)
Group.new("Warning",     c.warning,       c.none,  s.none)
Group.new("Underlined",  c.none,          c.none,  s.underline)
Group.new("Ignore",      c.main_bg,       c.none,  s.none)

-- Messages, setting ErrorMsg to bold will make errors rather visible,
-- setting ErrorMsg to have a bg color even more so. :)
-- Sadly this is also noisy af, not recommended for day to day usage.
-- Should probably be a config option, like a debug mode.
Group.new("ErrorMsg",    c.error,         c.none,  s.none)
Group.new("WarningMsg",  c.warning,       c.none,  s.none)
Group.new("MoreMsg",     c.mid_gray,      c.none,  s.none)
Group.link("ModeMsg",    g.MoreMsg)

Group.new("NonText", c.non_text, c.none, s.none)
Group.new("Note",    c.none,      c.none,  s.bold) -- e.g. TODO and FIXME

-- ? {{{1
--Group.new("Directory", c.dark_blue, c.none, s.none)
--Group.new("IncSearch", c.light_black, c.yellow, s.none)
--Group.new("CursorLineNr", c.purple, c.bg_very_subtle, s.none)
--Group.new("Question", c.unknown, c.none, s.none)
--Group.new("WildMenu", c.main_bg, c.norm, s.none)
--Group.new("Folded", c.medium_gray, c.none, s.none)
--Group.new("FoldColumn", c.bg_subtle, c.none, s.none)
Group.new("SignColumn", c.none, c.bg_accent, s.none)

--Group.new("TabLine", c.norm, c.bg_very_subtle, s.none)
--Group.new("TabLineSel", c.purple, c.bg_subtle, s.bold)
--Group.new("TabLineFill", c.norm, c.bg_very_subtle, s.none)

--Group.new("MatchParen", c.norm, c.bg_subtle, s.none)
--Group.new("qfLineNr", c.medium_gray, c.none, s.none)
--Group.new("htmlH1", c.norm, c.bg, s.none)
--Group.new("htmlH2", c.norm, c.bg, s.none)
--Group.new("htmlH3", c.norm, c.bg, s.none)
--Group.new("htmlH4", c.norm, c.bg, s.none)
--Group.new("htmlH5", c.norm, c.bg, s.none)
--Group.new("htmlH6", c.norm, c.bg, s.none)

-- Signify {{{1
Group.link("SignifySignAdd",             g.LineNr)
Group.link("SignifySignDelete",          g.LineNr)
Group.link("SignifySignChange",          g.LineNr)
Group.link("GitGutterAdd",               g.LineNr)
Group.link("GitGutterDelete",            g.LineNr)
Group.link("GitGutterChange",            g.LineNr)
Group.link("GitGutterChangeDelete",      g.LineNr)

-- Syntax - Main groups {{{1
Group.new("Statement", c.statement, c.none, s.none)
Group.link("Keyword",      g.Statement)
Group.link("Conditional",  g.Statement)
Group.link("Repeat",       g.Statement)
Group.link("Label",        g.Statement)
Group.link("Keyword",      g.Statement)
Group.link("Exception",    g.Statement)

Group.new("Constant", c.constant, c.none, s.none)
Group.link("Number",    g.Constant)
Group.link("Boolean",   g.Constant)
Group.link("Float",     g.Constant)

Group.link("PreProc",   g.Constant)
Group.link("Include",   g.PreProc)
Group.link("Define",    g.PreProc)
Group.link("Macro",     g.PreProc)
Group.link("PreCondit", g.PreProc)

Group.new("Identifier", c.identifier, c.none, s.none)
Group.new("Function", c.func, c.none, s.none)

Group.new("Type", c.type, c.none, s.none)
Group.link("StorageClass", g.Type)
Group.link("Structure",    g.Type)
Group.link("Typedef",      g.Type)

Group.new("Special", c.special, c.none, s.none)
Group.link("SpecialChar",    g.Special)
Group.link("Tag",            g.Special)
Group.link("Delimiter",      g.Special)
Group.link("SpecialComment", g.Special)
Group.link("Debug",          g.Special)

Group.new("String", c.string, c.none)
Group.new("Character", c.character, c.none)
Group.new("StringEscape", c.escape, c.none)
--Group.link("Character", g.String)

Group.new("Comment", c.comment, c.none)

Group.new("Operator", c.operator, c.none)

Group.new("Todo", c.main_bg, c.todo)

-- Not sure for what this is.
Group.new("Noop", c.norm_accent, c.none, s.none)
Group.link("CocFadeOut", g.Noop)

-- Syntax - Treesitter {{{1
Group.new("UnknownThing", c.norm, c.unknown)

Group.link("TSBoolean",             g.Boolean)
Group.link("TSFloat",               g.Float)
Group.link("TSConstant",            g.Constant)
Group.link("TSNumber",              g.Number)

Group.link("TSCharacter",           g.Character)
Group.link("TSString",              g.String)
Group.link("TSStringRegex",         g.String)
Group.link("TSStringSpecial",       g.String)
Group.link("TSStringEscape",        g.StringEscape)

Group.link("TSLabel",               g.Label)

Group.link("TSKeyword",             g.Keyword)
Group.link("TSKeywordFunction",     g.Keyword)
Group.link("TSKeywordOperator",     g.Keyword)
Group.link("TSKeywordReturn",       g.Keyword)

Group.link("TSFunction",            g.Function)
Group.link("TSFuncBuiltin",         g.Function)
Group.link("TSFuncMacro",           g.Function)
Group.link("TSMethod",              g.Function)
Group.link("TSConstructor",         g.Function)

Group.link("TSInclude",             g.Include)

Group.link("TSConditional",         g.Conditional)
Group.link("TSRepeat",              g.Repeat)
Group.link("TSException",           g.Exception)

Group.link("TSTag",                 g.Special)
Group.link("TSTagAttribute",        g.Special)
Group.link("TSTagDelimiter",        g.Special)

Group.link("TSWarning",             g.Warning)
Group.link("TSDanger",              g.Error)

Group.link("TSComment",             g.Comment)

Group.link("TSType",                g.Type)
Group.link("TSTypeBuiltin",         g.Type)

Group.link("TSError",               g.ErrorMsg)

Group.link("TSText",                g.Normal)
Group.link("TSStrong",              g.Normal)
Group.link("TSEmphasis",            g.Normal)
Group.link("TSUnderline",           g.Normal)
Group.link("TSStrike",              g.Normal)
Group.link("TSTitle",               g.Normal)
Group.link("TSLiteral",             g.Normal)
Group.link("TSTextReference",       g.Normal)

Group.link("TSParameter",           g.Normal)

Group.link("TSPunctDelimiter",      g.Special)
Group.link("TSPunctBracket",        g.Special)
Group.link("TSPunctSpecial",        g.Special)

Group.link("TSAnnotation",          g.UnknownThing)
--Group.link("TSAttribute",           g.UnknownThing)
--Group.link("TSField",               g.UnknownThing)
--Group.link("TSNone",                g.UnknownThing)
Group.link("TSMath",                g.UnknownThing)
Group.link("TSURI",                 g.UnknownThing)
Group.link("TSEnvironment",         g.UnknownThing)
Group.link("TSEnvironmentName",     g.UnknownThing)
Group.link("TSNote",                g.Note)

Group.new("TSNamespace",  c.namespace, c.none)
Group.link("TSOperator",            g.Operator)
Group.link("TSProperty",            g.Identifier)
Group.link("TSVariable",            g.Identifier)
Group.link("TSSymbol",              g.Special)
--Group.link("TSParameterReference",  g.UnknownThing)
--Group.link("TSVariableBuiltin",     g.UnknownThing)
--Group.link("TSConstBuiltin",        g.UnknownThing)
--Group.link("TSConstMacro",          g.UnknownThing)

Group.new("TODO", c.none, c.none)  -- what even set this?
