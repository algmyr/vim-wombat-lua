-- stylua: ignore
local M = {
  -- Syntax elements
  constant               = "#e5786d",
  namespace              = "#e5786d",
  statement              = "#88b8f6",
  operator               = "#88b8f6",
  identifier             = "#e3e0d7",
  func                   = "#cae682",
  type                   = "#d4d987",
  special                = "#eadead",
  string                 = "#95e454",
  docstring              = "#95e454",
  escape                 = "#d787ff",
  attribute              = "#e5786d",

  -- Markdown
  header                 = "#eadead",

  -- Diffing
  diff_add               = "#003300",
  diff_delete            = "#440000",
  diff_change            = "#222200",
  diff_text_add          = "#005900",
  diff_text_delete       = "#770000",
  sign_add               = "#33cc33",
  sign_change            = "#cccc33",
  sign_change_delete     = "#ee9933",
  sign_delete            = "#cc3333",
  sign_delete_first_line = "#cc3333",

  -- Misc highlight
  comment                = "#9c998e",
  non_text               = "#6e696c",
  bright_text            = "#ffffd7",

  -- UI
  search                 = "#d787ff",
  search_bg              = "#636066",
  fold                   = "#e3e0d7",
  fold_bg                = "#3a4046",
  match_paren            = "#eae788",
  match_paren_bg         = "#857b6f",
  visual_bg              = "#554d4b",

  bg_accent              = "#1c1c1c",
  norm_accent            = "#9c998e",
  main_bg                = "#242424",
  norm                   = "#e3e0d7",
  bg_very_subtle         = "#303030",
  bg_more_subtle         = "#3a3a3a",
  bg_subtle              = "#444444",

  mid_gray               = "#838086",

  -- LSP and diagnostics
  annotation             = "#00bbbb",
  warning                = "#e7ed30",
  error                  = "#ff444a",
  todo                   = "#d4d987",

  -- TODO
  note                   = "#00ff00",
  note_bg                = "#0000ff",

  unknown                = "#ff2026",
}

return M
