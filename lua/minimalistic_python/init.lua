-- minimalistic-python.vim — a minimal dark Neovim colorscheme.
--
-- Pure-black background, white symbols, and a tiny accent set:
--   red   -> strings           pink  -> numbers / None / True / False
--   green -> keywords           green2 -> function / class / type names
-- A green pair stands in for the usual blue, so the whole palette is one
-- warm pair (red/pink) balanced by one cool pair (two greens). Tuned for
-- Python (Treesitter + pyright via coc.nvim).

local M = {}

function M.load()
  local p = require("minimalistic_python.palette")

  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end
  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "minimalistic-python"

  local groups = {
    -- ---------------------------------------------------------------- UI --
    Normal          = { fg = p.fg, bg = p.bg },
    NormalNC        = { fg = p.fg, bg = p.bg },
    NormalFloat     = { fg = p.fg, bg = p.panel },
    FloatBorder     = { fg = p.gray, bg = p.panel },
    FloatTitle      = { fg = p.green2, bg = p.panel, bold = true },
    ColorColumn     = { bg = p.cursorline },
    Cursor          = { fg = p.bg, bg = p.fg },
    CursorLine      = { bg = p.cursorline },
    CursorColumn    = { bg = p.cursorline },
    CursorLineNr    = { fg = p.fg, bold = true },
    LineNr          = { fg = p.linenr },
    SignColumn      = { bg = p.bg },
    FoldColumn      = { fg = p.linenr, bg = p.bg },
    Folded          = { fg = p.gray, bg = p.panel, italic = true },
    VertSplit       = { fg = p.split },
    WinSeparator    = { fg = p.split },
    Visual          = { bg = p.selection },
    VisualNOS       = { bg = p.selection },
    Search          = { fg = p.bg, bg = p.green2 },
    IncSearch       = { fg = p.bg, bg = p.pink },
    CurSearch       = { fg = p.bg, bg = p.pink },
    MatchParen      = { bg = p.selection, bold = true },
    NonText         = { fg = p.linenr },
    Whitespace      = { fg = p.linenr },
    SpecialKey      = { fg = p.linenr },
    Conceal         = { fg = p.gray },
    Directory       = { fg = p.green2 },
    Title           = { fg = p.green2, bold = true },
    EndOfBuffer     = { fg = p.bg },

    Pmenu           = { fg = p.fg, bg = p.panel },
    PmenuSel        = { fg = p.fg, bg = p.selection },
    PmenuSbar       = { bg = p.panel },
    PmenuThumb      = { bg = p.linenr },
    WildMenu        = { fg = p.bg, bg = p.green2 },

    StatusLine      = { fg = p.fg, bg = p.split },
    StatusLineNC    = { fg = p.gray, bg = p.panel },
    TabLine         = { fg = p.gray, bg = p.panel },
    TabLineSel      = { fg = p.fg, bg = p.bg, bold = true },
    TabLineFill     = { bg = p.panel },
    QuickFixLine    = { bg = p.selection },

    ErrorMsg        = { fg = p.red },
    WarningMsg      = { fg = p.pink },
    MoreMsg         = { fg = p.green2 },
    ModeMsg         = { fg = p.fg, bold = true },
    Question        = { fg = p.green2 },

    -- ------------------------------------------------------ legacy syntax --
    Comment         = { fg = p.gray, italic = true },

    Constant        = { fg = p.pink },
    String          = { fg = p.red },
    Character       = { fg = p.red },
    Number          = { fg = p.pink },
    Float           = { fg = p.pink },
    Boolean         = { fg = p.pink },

    Identifier      = { fg = p.fg },
    Function        = { fg = p.green2 },

    Statement       = { fg = p.green },
    Conditional     = { fg = p.green },
    Repeat          = { fg = p.green },
    Label           = { fg = p.green },
    Operator        = { fg = p.fg },
    Keyword         = { fg = p.green },
    Exception       = { fg = p.green },

    PreProc         = { fg = p.green },
    Include         = { fg = p.green },
    Define          = { fg = p.green },
    Macro           = { fg = p.green },
    PreCondit       = { fg = p.green },

    Type            = { fg = p.green2 },
    StorageClass    = { fg = p.green },
    Structure       = { fg = p.green2 },
    Typedef         = { fg = p.green2 },

    Special         = { fg = p.red },
    SpecialChar     = { fg = p.red },
    Tag             = { fg = p.green },
    Delimiter       = { fg = p.gray },
    SpecialComment  = { fg = p.gray, italic = true },
    Debug           = { fg = p.pink },

    Underlined      = { fg = p.green2, underline = true },
    Ignore          = { fg = p.linenr },
    Error           = { fg = p.red },
    Todo            = { fg = p.bg, bg = p.pink, bold = true },

    -- --------------------------------------------------------- Treesitter --
    ["@comment"]              = { link = "Comment" },
    ["@comment.documentation"] = { fg = p.gray, italic = true },
    ["@comment.error"]        = { fg = p.red },
    ["@comment.warning"]      = { fg = p.pink },
    ["@comment.todo"]         = { link = "Todo" },
    ["@comment.note"]         = { fg = p.green2 },

    ["@string"]               = { fg = p.red },
    ["@string.documentation"] = { fg = p.gray, italic = true },
    ["@string.escape"]        = { fg = p.red },
    ["@string.regexp"]        = { fg = p.red },
    ["@string.special"]       = { fg = p.red },
    ["@character"]            = { fg = p.red },
    ["@character.special"]    = { fg = p.red },

    ["@number"]               = { fg = p.pink },
    ["@number.float"]         = { fg = p.pink },
    ["@boolean"]              = { fg = p.pink },
    ["@constant"]             = { fg = p.pink },
    ["@constant.builtin"]     = { fg = p.pink }, -- None / True / False
    ["@constant.macro"]       = { fg = p.pink },

    ["@variable"]             = { fg = p.fg },
    ["@variable.builtin"]     = { fg = p.fg }, -- self / cls
    ["@variable.parameter"]   = { fg = p.fg },
    ["@variable.member"]      = { fg = p.fg },
    ["@property"]             = { fg = p.fg },
    ["@field"]                = { fg = p.fg },

    ["@function"]             = { fg = p.green2 },
    ["@function.call"]        = { fg = p.green2 },
    ["@function.method"]      = { fg = p.green2 },
    ["@function.method.call"] = { fg = p.green2 },
    ["@function.builtin"]     = { fg = p.fg }, -- print / len stay plain
    ["@function.macro"]       = { fg = p.green2 },
    ["@constructor"]          = { fg = p.green2 },

    ["@keyword"]              = { fg = p.green },
    ["@keyword.function"]     = { fg = p.green }, -- def / lambda
    ["@keyword.operator"]     = { fg = p.green }, -- and / or / not / in / is
    ["@keyword.return"]       = { fg = p.green },
    ["@keyword.import"]       = { fg = p.green },
    ["@keyword.conditional"]  = { fg = p.green },
    ["@keyword.repeat"]       = { fg = p.green },
    ["@keyword.exception"]    = { fg = p.green },
    ["@keyword.coroutine"]    = { fg = p.green }, -- async / await
    ["@keyword.directive"]    = { fg = p.green },

    ["@operator"]             = { fg = p.fg },
    ["@punctuation.delimiter"] = { fg = p.gray },
    ["@punctuation.bracket"]  = { fg = p.gray },
    ["@punctuation.special"]  = { fg = p.green },

    ["@type"]                 = { fg = p.green2 },
    ["@type.builtin"]         = { fg = p.green2 },
    ["@type.definition"]      = { fg = p.green2 },
    ["@attribute"]            = { fg = p.green }, -- decorators
    ["@attribute.builtin"]    = { fg = p.green },
    ["@module"]               = { fg = p.fg },
    ["@namespace"]            = { fg = p.fg },
    ["@label"]                = { fg = p.green },

    ["@tag"]                  = { fg = p.green },
    ["@tag.attribute"]        = { fg = p.green2 },
    ["@tag.delimiter"]        = { fg = p.gray },

    -- markup (markdown, docstrings)
    ["@markup.heading"]       = { fg = p.green2, bold = true },
    ["@markup.strong"]        = { bold = true },
    ["@markup.italic"]        = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.raw"]           = { fg = p.green2 },
    ["@markup.raw.block"]     = { fg = p.green2 },
    ["@markup.link"]          = { fg = p.green2, underline = true },
    ["@markup.link.label"]    = { fg = p.green2 },
    ["@markup.link.url"]      = { fg = p.gray, underline = true },
    ["@markup.list"]          = { fg = p.green },
    ["@markup.quote"]         = { fg = p.red },

    ["@diff.plus"]            = { fg = p.green },
    ["@diff.minus"]           = { fg = p.red },
    ["@diff.delta"]           = { fg = p.pink },

    -- ---------------------------------------------- LSP semantic (pyright) --
    ["@lsp.type.class"]         = { fg = p.green2 },
    ["@lsp.type.enum"]          = { fg = p.green2 },
    ["@lsp.type.interface"]     = { fg = p.green2 },
    ["@lsp.type.struct"]        = { fg = p.green2 },
    ["@lsp.type.type"]          = { fg = p.green2 },
    ["@lsp.type.typeParameter"] = { fg = p.green2 },
    ["@lsp.type.function"]      = { fg = p.green2 },
    ["@lsp.type.method"]        = { fg = p.green2 },
    ["@lsp.type.decorator"]     = { fg = p.green },
    ["@lsp.type.keyword"]       = { fg = p.green },
    ["@lsp.type.namespace"]     = { fg = p.fg },
    ["@lsp.type.variable"]      = { fg = p.fg },
    ["@lsp.type.parameter"]     = { fg = p.fg },
    ["@lsp.type.property"]      = { fg = p.fg },
    ["@lsp.type.enumMember"]    = { fg = p.pink },
    ["@lsp.typemod.variable.readonly"] = { fg = p.pink }, -- constants
    ["@lsp.typemod.function.builtin"]  = { fg = p.fg },

    -- old-style treesitter groups still referenced by some configs
    TSProperty  = { fg = p.fg },
    TSParameter = { fg = p.fg },

    -- --------------------------------------------------------- Diagnostics --
    DiagnosticError = { fg = p.red },
    DiagnosticWarn  = { fg = p.pink },
    DiagnosticInfo  = { fg = p.green2 },
    DiagnosticHint  = { fg = p.gray },
    DiagnosticOk    = { fg = p.green },
    DiagnosticUnderlineError = { undercurl = true, sp = p.red },
    DiagnosticUnderlineWarn  = { undercurl = true, sp = p.pink },
    DiagnosticUnderlineInfo  = { undercurl = true, sp = p.green2 },
    DiagnosticUnderlineHint  = { undercurl = true, sp = p.gray },
    DiagnosticUnnecessary    = { fg = p.dim }, -- unused code (LSP "unnecessary")
    DiagnosticDeprecated     = { fg = p.dim, strikethrough = true },
    ["@lsp.mod.unused"]      = { fg = p.dim },

    -- ----------------------------------------------------------- coc.nvim --
    CocInlayHint     = { fg = p.gray, italic = true },
    CocFadeOut       = { fg = p.dim },
    CocUnusedHighlight = { fg = p.dim },
    CocDeprecatedHighlight = { fg = p.dim, strikethrough = true },
    CocErrorSign     = { fg = p.red },
    CocWarningSign   = { fg = p.pink },
    CocInfoSign      = { fg = p.green2 },
    CocHintSign      = { fg = p.gray },
    CocErrorFloat    = { fg = p.red, bg = p.panel },
    CocWarningFloat  = { fg = p.pink, bg = p.panel },
    CocInfoFloat     = { fg = p.green2, bg = p.panel },
    CocHintFloat     = { fg = p.gray, bg = p.panel },
    CocErrorHighlight   = { undercurl = true, sp = p.red },
    CocWarningHighlight = { undercurl = true, sp = p.pink },
    CocInfoHighlight    = { undercurl = true, sp = p.green2 },
    CocHintHighlight    = { undercurl = true, sp = p.gray },
    CocFloating      = { link = "NormalFloat" },
    CocMenuSel       = { link = "PmenuSel" },

    -- git / diff
    DiffAdd    = { bg = "#0e1f0e" },
    DiffChange = { bg = "#10151c" },
    DiffDelete = { fg = p.linenr, bg = "#1f0e0e" },
    DiffText   = { bg = p.selection },
    diffAdded   = { fg = p.green },
    diffRemoved = { fg = p.red },
    diffChanged = { fg = p.pink },

    gitcommitSummary = { fg = p.fg },
    gitcommitComment = { fg = p.gray, italic = true },
  }

  for group, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, group, spec)
  end

  -- Bundle the Treesitter setup so user configs stay clean (no-op without it).
  require("minimalistic_python.treesitter").setup()

  -- Terminal palette (best effort within the limited color set).
  vim.g.terminal_color_0  = p.bg
  vim.g.terminal_color_1  = p.red
  vim.g.terminal_color_2  = p.green
  vim.g.terminal_color_3  = p.pink
  vim.g.terminal_color_4  = p.green2
  vim.g.terminal_color_5  = p.pink
  vim.g.terminal_color_6  = p.green2
  vim.g.terminal_color_7  = p.fg
  vim.g.terminal_color_8  = p.gray
  vim.g.terminal_color_9  = p.red
  vim.g.terminal_color_10 = p.green
  vim.g.terminal_color_11 = p.pink
  vim.g.terminal_color_12 = p.green2
  vim.g.terminal_color_13 = p.pink
  vim.g.terminal_color_14 = p.green2
  vim.g.terminal_color_15 = p.fg
end

return M
