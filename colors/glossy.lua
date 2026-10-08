-- glossy.lua: Neovim-Farbschema passend zu Hyprland, Waybar und Kitty (dunkelblau, türkis, amber)
-- Ablage: ~/.config/nvim/colors/glossy.lua    Aktivieren: vim.cmd.colorscheme("glossy")

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "glossy"

-- true: Hintergrund durchsichtig (Kitty-Deckkraft und Hyprland-Blur scheinen durch)
-- false: fester dunkelblauer Hintergrund
local transparent = true

local c = {
  bg = "#071426", surface = "#0D1B2A", surface2 = "#11253D", sel = "#17405F",
  primary = "#35D2F5", primary_dark = "#139CBF", secondary = "#2A6FA6",
  text = "#EAF4FF", dim = "#9CB3C9", comment = "#6F86A0", muted = "#53677D",
  red = "#FF6B6B", green = "#77D9A8", amber = "#FFB45E",
  blue = "#4DA8DA", magenta = "#B79CED", border = "#1A2737",
}
local bg = transparent and "NONE" or c.bg

local function hl(group, spec) vim.api.nvim_set_hl(0, group, spec) end
local function link(group, target) vim.api.nvim_set_hl(0, group, { link = target }) end

-- Oberfläche
hl("Normal",       { fg = c.text, bg = bg })
hl("NormalNC",     { fg = c.text, bg = bg })
hl("NormalFloat",  { fg = c.text, bg = c.surface })
hl("FloatBorder",  { fg = c.primary_dark, bg = c.surface })
hl("FloatTitle",   { fg = c.primary, bg = c.surface, bold = true })
hl("SignColumn",   { bg = bg })
hl("LineNr",       { fg = c.muted })
hl("CursorLineNr", { fg = c.amber, bold = true })
hl("CursorLine",   { bg = c.surface2 })
hl("ColorColumn",  { bg = c.surface })
hl("Visual",       { bg = c.sel })
hl("Search",       { fg = c.bg, bg = c.amber })
hl("IncSearch",    { fg = c.bg, bg = c.primary })
hl("CurSearch",    { fg = c.bg, bg = c.primary })
hl("MatchParen",   { fg = c.amber, bold = true, underline = true })
hl("Cursor",       { fg = c.bg, bg = c.primary })
hl("WinSeparator", { fg = c.border })
hl("VertSplit",    { fg = c.border })
hl("EndOfBuffer",  { fg = c.surface })
hl("NonText",      { fg = c.muted })
hl("Whitespace",   { fg = c.border })
hl("Folded",       { fg = c.dim, bg = c.surface })
hl("Directory",    { fg = c.blue })
hl("Title",        { fg = c.primary, bold = true })
hl("ErrorMsg",     { fg = c.red })
hl("WarningMsg",   { fg = c.amber })
hl("MoreMsg",      { fg = c.green })
hl("Question",     { fg = c.primary })

hl("Pmenu",        { fg = c.text, bg = c.surface })
hl("PmenuSel",     { fg = c.bg, bg = c.primary })
hl("PmenuSbar",    { bg = c.surface2 })
hl("PmenuThumb",   { bg = c.primary_dark })
hl("StatusLine",   { fg = c.text, bg = c.surface })
hl("StatusLineNC", { fg = c.dim, bg = c.surface })
hl("TabLine",      { fg = c.dim, bg = c.surface })
hl("TabLineSel",   { fg = c.bg, bg = c.primary, bold = true })
hl("TabLineFill",  { bg = c.surface })

-- Syntax
hl("Comment",      { fg = c.comment, italic = true })
hl("Constant",     { fg = c.amber })
hl("String",       { fg = c.green })
hl("Character",    { fg = c.green })
hl("Number",       { fg = c.amber })
hl("Boolean",      { fg = c.amber })
hl("Identifier",   { fg = c.text })
hl("Function",     { fg = c.primary })
hl("Statement",    { fg = c.magenta })
hl("Operator",     { fg = c.dim })
hl("Keyword",      { fg = c.magenta })
hl("PreProc",      { fg = c.blue })
hl("Type",         { fg = c.blue })
hl("Special",      { fg = c.primary_dark })
hl("Delimiter",    { fg = c.dim })
hl("Todo",         { fg = c.bg, bg = c.amber, bold = true })
hl("Error",        { fg = c.red })

-- Treesitter
hl("@variable",         { fg = c.text })
hl("@variable.builtin", { fg = c.red })
hl("@variable.parameter", { fg = c.text, italic = true })
hl("@property",         { fg = c.text })
hl("@function.builtin", { fg = c.primary })
hl("@constant.builtin", { fg = c.amber })
hl("@punctuation",      { fg = c.dim })
hl("@tag",              { fg = c.blue })
hl("@tag.attribute",    { fg = c.magenta })
hl("@module",           { fg = c.text })
link("@function",       "Function")
link("@keyword",        "Keyword")
link("@string",         "String")
link("@comment",        "Comment")
link("@type",           "Type")
link("@constant",       "Constant")
link("@number",         "Number")
link("@operator",       "Operator")

-- Diagnose
hl("DiagnosticError", { fg = c.red })
hl("DiagnosticWarn",  { fg = c.amber })
hl("DiagnosticInfo",  { fg = c.blue })
hl("DiagnosticHint",  { fg = c.primary })
hl("DiagnosticOk",    { fg = c.green })
hl("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hl("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.amber })
hl("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.blue })
hl("DiagnosticUnderlineHint",  { undercurl = true, sp = c.primary })

-- Diff und Git
hl("DiffAdd",    { bg = "#0F2F2A" })
hl("DiffChange", { bg = "#12273F" })
hl("DiffDelete", { bg = "#3A1A22" })
hl("DiffText",   { bg = "#1F4468" })
hl("Added",      { fg = c.green })
hl("Changed",    { fg = c.blue })
hl("Removed",    { fg = c.red })
hl("GitSignsAdd",    { fg = c.green })
hl("GitSignsChange", { fg = c.blue })
hl("GitSignsDelete", { fg = c.red })

-- Telescope und ähnliche Plugins
hl("TelescopeNormal",       { fg = c.text, bg = c.surface })
hl("TelescopeBorder",       { fg = c.primary_dark, bg = c.surface })
hl("TelescopeSelection",    { bg = c.surface2 })
hl("TelescopeMatching",     { fg = c.amber, bold = true })
hl("TelescopePromptPrefix", { fg = c.primary })
