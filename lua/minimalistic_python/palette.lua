-- Color palette for minimalistic-python.vim.
--
-- A minimal dark theme: a pure-black background and mostly white symbols,
-- with a tiny warm/cool accent set. Strings are red, literals pink, and a
-- green pair (instead of blue) carries structure and names. Tuned for Python.
return {
  bg     = "#000000", -- pure black background
  fg     = "#f0f0f0", -- white symbols: text, variables, operators, builtins
  gray   = "#6e757f", -- comments, punctuation, line numbers
  dim    = "#7a828c", -- faded-out / unused code (coc CocFadeOut, unused vars)
  red    = "#f15b5b", -- strings, chars, escapes
  pink   = "#f48fb8", -- numbers, booleans, None, constants
  green  = "#7fb86a", -- keywords: def/class/return/import/control, decorators
  green2 = "#5fc99e", -- function, class and type names (cool sea-green)

  -- Derived dark UI shades (neutral chrome, not part of the syntax palette).
  selection  = "#2a2f3a", -- visual selection
  cursorline = "#0c0c0c", -- current line highlight
  panel      = "#141414", -- popup / menu background
  linenr     = "#3a3f47", -- inactive line numbers
  split      = "#1c1c1c", -- separators, inactive statusline
}
