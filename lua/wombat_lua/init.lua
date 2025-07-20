local wombat_colors = require "wombat_lua.colors"

local Color = require("colorbuddy.init").Color
local Group = require("colorbuddy.init").Group
local c = require("colorbuddy.init").colors
local g = require("colorbuddy.init").groups
local s = require("colorbuddy.init").styles

for key, value in pairs(wombat_colors) do
  Color.new(key, value)
end

-- General {{{1
Group.new("Normal", c.norm, c.main_bg)
Group.new("Cursor", c.main_bg, c.norm)
Group.new("Visual", c.none, c.visual_bg)
Group.new("VisualNOS", c.none, c.bg_very_subtle)
Group.new("Search", c.search, c.search_bg)
Group.new("Folded", c.fold, c.fold_bg)
Group.new("WinSeparator", c.norm_accent, c.bg_accent)
Group.new("LineNr", c.norm_accent, c.bg_accent, s.none)
Group.new("CursorLine", c.none, c.bg_very_subtle, s.none)
Group.new("CursorColumn", c.none, c.bg_very_subtle, s.none)
Group.new("ColorColumn", c.none, c.error, s.none)
Group.new("MatchParen", c.match_paren, c.match_paren_bg, s.bold)
Group.new("Title", c.bright_text, c.none, s.bold)

-- Pmenu (and pmenu scrollbar) {{{1
Group.new("Pmenu", c.norm, c.bg_accent, s.none)
Group.new("PmenuSel", c.norm, c.bg_very_subtle, s.bold)
--Group.new("PmenuSbar", c.norm, c.bg_subtle, s.none)
--Group.new("PmenuThumb", c.norm, c.bg_subtle, s.none)

-- Diff {{{1
Group.new("DiffAdd", c.none, c.diff_add)
Group.new("DiffDelete", c.none, c.diff_delete)
Group.new("DiffChange", c.none, c.diff_change)
Group.new("DiffText", c.none, c.none, s.underline + s.bold)

Group.new("VcsignsDiffTextAdd", c.none, c.diff_text_add)
Group.new("VcsignsDiffTextDelete", c.none, c.diff_text_delete)

-- Unsure why I have to specify the bg here,
-- seems the default uses the diff line color?
Group.new("SignAdd", c.sign_add, c.bg_accent, s.none)
Group.new("SignChange", c.sign_change, c.bg_accent, s.none)
Group.new("SignChangeDelete", c.sign_change_delete, c.bg_accent, s.none)
Group.new("SignDelete", c.sign_delete, c.bg_accent, s.none)
Group.new("SignDeleteFirstLine", c.sign_delete_first_line, c.bg_accent, s.none)

Group.link("SignifySignAdd", g.SignAdd)
Group.link("SignifySignChange", g.SignChange)
Group.link("SignifySignChangeDelete", g.SignChangeDelete)
Group.link("SignifySignDelete", g.SignDelete)
Group.link("SignifySignDeleteFirstLine", g.SignDeleteFirstLine)

Group.link("GitGutterAdd", g.SignAdd)
Group.link("GitGutterDelete", g.SignDelete)
Group.link("GitGutterChange", g.SignChange)
Group.link("GitGutterChangeDelete", g.SignChangeDelete)

-- Misc {{{1
Group.new("SpecialKey", c.mid_gray, c.none, s.none)
Group.new("Underlined", c.none, c.none, s.underline)
Group.new("Ignore", c.main_bg, c.none, s.none)

Group.new("Error", c.error, c.none, s.none)
Group.new("Warning", c.warning, c.none, s.none)
Group.new("Hint", c.annotation, c.none, s.none)
Group.new("Info", c.annotation, c.none, s.none)

Group.new("ErrorMsg", c.error, c.none, s.none)
Group.new("WarningMsg", c.warning, c.none, s.none)
Group.new("MoreMsg", c.mid_gray, c.none, s.none)
Group.link("ModeMsg", g.MoreMsg)

Group.new("NonText", c.non_text, c.none, s.none)
Group.new("Note", c.none, c.none, s.bold) -- e.g. TODO and FIXME

-- ? {{{1
--Group.new("Directory",    c.dark_blue,   c.none,           s.none)
--Group.new("IncSearch",    c.light_black, c.yellow,         s.none)
--Group.new("CursorLineNr", c.purple,      c.bg_very_subtle, s.none)
--Group.new("Question",     c.unknown,     c.none,           s.none)
--Group.new("WildMenu",     c.main_bg,     c.norm,           s.none)
--Group.new("Folded",       c.medium_gray, c.none,           s.none)

Group.new("SignColumn", c.none, c.bg_accent, s.none)
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
Group.new("Statement", c.statement, c.none, s.none)
Group.link("Keyword", g.Statement)
Group.link("Conditional", g.Statement)
Group.link("Repeat", g.Statement)
Group.link("Label", g.Statement)
Group.link("Keyword", g.Statement)
Group.link("Exception", g.Statement)

Group.new("Constant", c.constant, c.none, s.none)
Group.link("Number", g.Constant)
Group.link("Boolean", g.Constant)
Group.link("Float", g.Constant)

Group.link("PreProc", g.Constant)
Group.link("Include", g.PreProc)
Group.link("Define", g.PreProc)
Group.link("Macro", g.PreProc)
Group.link("PreCondit", g.PreProc)

Group.new("Identifier", c.identifier, c.none, s.none)
Group.new("Function", c.func, c.none, s.none)

Group.new("Type", c.type, c.none, s.none)
Group.link("StorageClass", g.Type)
Group.link("Structure", g.Type)
Group.link("Typedef", g.Type)

Group.new("Special", c.special, c.none, s.none)
Group.link("SpecialChar", g.Special)
Group.link("Tag", g.Special)
Group.link("Delimiter", g.Special)
Group.link("SpecialComment", g.Special)
Group.link("Debug", g.Special)

Group.new("String", c.string, c.none)
Group.new("Character", c.character, c.none)
Group.new("StringEscape", c.escape, c.none)
--Group.link("Character", g.String)

Group.new("Comment", c.comment, c.none)
Group.new("Operator", c.operator, c.none)
Group.new("Todo", c.main_bg, c.todo)

Group.new("Noop", c.norm_accent, c.none, s.none)
Group.link("CocFadeOut", g.Noop)

Group.new("Annotation", c.annotation, c.none)
Group.link("LspInlayHint", g.NonText)
Group.link("CocInlayHint", g.NonText)
Group.link("DiagnosticHint", g.NonText)

Group.link("DiagnosticSignHint", g.Hint)
Group.link("DiagnosticSignInfo", g.Info)
Group.link("DiagnosticSignWarn", g.Warning)
Group.link("DiagnosticSignError", g.Error)
Group.link("DiagnosticHint", g.Hint)
Group.link("DiagnosticInfo", g.Info)
Group.link("DiagnosticWarn", g.Warning)
Group.link("DiagnosticError", g.Error)
Group.link("DiagnosticUnnecessary", g.NonText)

require("wombat_lua.groups.treesitter").build(Group, c, g, s)

Group.new("TODO", c.none, c.none) -- what even set this?

-- TOSORT {{{1
Group.new("WombatGreen", c.type, c.none, s.none)

Group.link("NoiceCmdlineIcon", g.Normal) -- cmdline icon
Group.link("NoiceCmdlinePopupBorder", g.Normal) -- cmdline border
Group.link("NoiceCmdlineIconSearch", g.WombatGreen) -- search icon
Group.link("NoiceCmdlinePopupBorderSearch", g.WombatGreen) -- search border

Group.new("NormalFloat", c.norm_accent, c.bg_accent)

Group.new("IblIndent", c.bg_more_subtle, c.none, s.none)
Group.new("IblScope", c.norm_accent, c.none, s.none)

-- vim: set fdm=marker:
