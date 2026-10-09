-- nebel: Neovim-Farbschema, Farben kommen aus ~/.config/nvim/lua/nebel_palette.lua
-- (erzeugt von ~/.config/nebel/theme.py). Aktivieren: vim.cmd.colorscheme("nebel")

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "nebel"

-- true: Hintergrund durchsichtig (Kitty-Deckkraft und Hyprland-Blur scheinen durch)
local transparent = true

-- Rückfallwerte, falls die erzeugte Palette fehlt
local fallback = {
  bg = "#161D21", surface = "#1E282D", surface2 = "#27343A", border = "#34454D",
  fg = "#D9E3E7", fg_bright = "#F4F8FA", fg_dim = "#8FA3AC", fg_muted = "#758A94",
  accent = "#A9C7D4", selection = "#2F4550",
  danger = "#D98A8A", ok = "#8FB3A0", warn = "#C9B38A",
  red = "#C27C7C", green = "#8FB3A0", yellow = "#C9B38A",
  blue = "#7F9FB5", magenta = "#A394B8", cyan = "#8DB4BF",
}
local ok, loaded = pcall(require, "nebel_palette")
local c = setmetatable(ok and loaded or {}, { __index = fallback })

local bg = transparent and "NONE" or c.bg
local function hl(group, spec) vim.api.nvim_set_hl(0, group, spec) end
local function link(group, target) vim.api.nvim_set_hl(0, group, { link = target }) end

-- Oberfläche
hl("Normal",       { fg = c.fg, bg = bg })
hl("NormalNC",     { fg = c.fg, bg = bg })
hl("NormalFloat",  { fg = c.fg, bg = c.surface })
hl("FloatBorder",  { fg = c.border, bg = c.surface })
hl("FloatTitle",   { fg = c.accent, bg = c.surface, bold = true })
hl("SignColumn",   { bg = bg })
hl("LineNr",       { fg = c.fg_muted })
hl("CursorLineNr", { fg = c.accent, bold = true })
hl("CursorLine",   { bg = c.surface })
hl("ColorColumn",  { bg = c.surface })
hl("Visual",       { bg = c.selection })
hl("Search",       { fg = c.bg, bg = c.fg_dim })
hl("IncSearch",    { fg = c.bg, bg = c.accent })
hl("CurSearch",    { fg = c.bg, bg = c.accent })
hl("MatchParen",   { fg = c.accent, bold = true, underline = true })
hl("Cursor",       { fg = c.bg, bg = c.accent })
hl("WinSeparator", { fg = c.border })
hl("VertSplit",    { fg = c.border })
hl("EndOfBuffer",  { fg = c.surface })
hl("NonText",      { fg = c.border })
hl("Whitespace",   { fg = c.border })
hl("Folded",       { fg = c.fg_dim, bg = c.surface })
hl("Directory",    { fg = c.accent })
hl("Title",        { fg = c.fg_bright, bold = true })
hl("ErrorMsg",     { fg = c.danger })
hl("WarningMsg",   { fg = c.warn })
hl("MoreMsg",      { fg = c.ok })
hl("Question",     { fg = c.accent })

hl("Pmenu",        { fg = c.fg, bg = c.surface })
hl("PmenuSel",     { fg = c.fg_bright, bg = c.surface2 })
hl("PmenuSbar",    { bg = c.surface2 })
hl("PmenuThumb",   { bg = c.fg_muted })
hl("StatusLine",   { fg = c.fg, bg = c.surface })
hl("StatusLineNC", { fg = c.fg_muted, bg = c.surface })
hl("TabLine",      { fg = c.fg_muted, bg = c.surface })
hl("TabLineSel",   { fg = c.fg_bright, bg = c.surface2, bold = true })
hl("TabLineFill",  { bg = c.surface })

-- Syntax: gedämpfte Pastelltöne, Kommentare zurückgenommen
hl("Comment",      { fg = c.fg_muted, italic = true })
hl("Constant",     { fg = c.yellow })
hl("String",       { fg = c.green })
hl("Character",    { fg = c.green })
hl("Number",       { fg = c.yellow })
hl("Boolean",      { fg = c.yellow })
hl("Identifier",   { fg = c.fg })
hl("Function",     { fg = c.accent })
hl("Statement",    { fg = c.magenta })
hl("Operator",     { fg = c.fg_dim })
hl("Keyword",      { fg = c.magenta })
hl("PreProc",      { fg = c.blue })
hl("Type",         { fg = c.blue })
hl("Special",      { fg = c.cyan })
hl("Delimiter",    { fg = c.fg_dim })
hl("Todo",         { fg = c.bg, bg = c.warn, bold = true })
hl("Error",        { fg = c.danger })

-- Treesitter
hl("@variable",           { fg = c.fg })
hl("@variable.builtin",   { fg = c.red })
hl("@variable.parameter", { fg = c.fg, italic = true })
hl("@property",           { fg = c.fg })
hl("@function.builtin",   { fg = c.accent })
hl("@constant.builtin",   { fg = c.yellow })
hl("@punctuation",        { fg = c.fg_dim })
hl("@tag",                { fg = c.blue })
hl("@tag.attribute",      { fg = c.magenta })
hl("@module",             { fg = c.fg })
link("@function",         "Function")
link("@keyword",          "Keyword")
link("@string",           "String")
link("@comment",          "Comment")
link("@type",             "Type")
link("@constant",         "Constant")
link("@number",           "Number")
link("@operator",         "Operator")

-- Diagnose
hl("DiagnosticError", { fg = c.danger })
hl("DiagnosticWarn",  { fg = c.warn })
hl("DiagnosticInfo",  { fg = c.blue })
hl("DiagnosticHint",  { fg = c.cyan })
hl("DiagnosticOk",    { fg = c.ok })
hl("DiagnosticUnderlineError", { undercurl = true, sp = c.danger })
hl("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.warn })
hl("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.blue })
hl("DiagnosticUnderlineHint",  { undercurl = true, sp = c.cyan })

-- Diff und Git
hl("DiffAdd",    { bg = "#17302A" })
hl("DiffChange", { bg = "#1A2B3A" })
hl("DiffDelete", { bg = "#34202A" })
hl("DiffText",   { bg = "#27424F" })
hl("Added",      { fg = c.ok })
hl("Changed",    { fg = c.blue })
hl("Removed",    { fg = c.danger })
hl("GitSignsAdd",    { fg = c.ok })
hl("GitSignsChange", { fg = c.blue })
hl("GitSignsDelete", { fg = c.danger })

-- Telescope
hl("TelescopeNormal",       { fg = c.fg, bg = c.surface })
hl("TelescopeBorder",       { fg = c.border, bg = c.surface })
hl("TelescopeSelection",    { bg = c.surface2 })
hl("TelescopeMatching",     { fg = c.accent, bold = true })
hl("TelescopePromptPrefix", { fg = c.accent })
