-- ~/.config/nvim/colors/nebel.lua
-- Colorscheme "Nebel", von Hand gepflegt. Gleiche Palette wie kitty.conf.
-- Aktivieren mit: vim.cmd.colorscheme('nebel')

-- true  = Hintergrund transparent (kitty-Opacity + Hyprland-Blur scheinen durch)
-- false = deckender Hintergrund
local transparent = true

vim.cmd('highlight clear')
if vim.fn.exists('syntax_on') == 1 then vim.cmd('syntax reset') end
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.g.colors_name = 'nebel'

-- ---------------------------------------------------------
-- Palette
-- ---------------------------------------------------------
local c = {
  bg        = '#161D21',
  bg_alt    = '#1E282D',
  bg_sel    = '#2F4550',
  bg_hl     = '#222E34',
  border    = '#34454D',
  fg        = '#E6EEF1',
  fg_dim    = '#9AB0BC',
  comment   = '#6F8594',
  accent    = '#7FD3EA',
  red       = '#E07A7A',
  green     = '#7FCFA0',
  yellow    = '#E8BE7A',
  blue      = '#6AAEE0',
  purple    = '#B79CED',
  cyan      = '#5CCBE6',
  orange    = '#F0A870',
  ice       = '#8DE0F2',
}

local bg = transparent and 'NONE' or c.bg

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ---------------------------------------------------------
-- Editor-UI
-- ---------------------------------------------------------
hi('Normal',        { fg = c.fg, bg = bg })
hi('NormalNC',      { fg = c.fg, bg = bg })
hi('NormalFloat',   { fg = c.fg, bg = c.bg_alt })
hi('FloatBorder',   { fg = c.border, bg = c.bg_alt })
hi('FloatTitle',    { fg = c.accent, bg = c.bg_alt, bold = true })
hi('Cursor',        { fg = c.bg, bg = c.accent })
hi('lCursor',       { link = 'Cursor' })
hi('TermCursor',    { link = 'Cursor' })
hi('CursorLine',    { bg = c.bg_hl })
hi('CursorColumn',  { bg = c.bg_hl })
hi('ColorColumn',   { bg = c.bg_hl })
hi('LineNr',        { fg = c.comment })
hi('CursorLineNr',  { fg = c.accent, bold = true })
hi('SignColumn',    { fg = c.comment, bg = bg })
hi('FoldColumn',    { fg = c.comment, bg = bg })
hi('Folded',        { fg = c.fg_dim, bg = c.bg_alt })
hi('Visual',        { bg = c.bg_sel })
hi('VisualNOS',     { bg = c.bg_sel })
hi('Search',        { fg = c.fg, bg = c.bg_sel, underline = true })
hi('CurSearch',     { fg = c.bg, bg = c.accent, bold = true })
hi('IncSearch',     { fg = c.bg, bg = c.accent, bold = true })
hi('Substitute',    { fg = c.bg, bg = c.red })
hi('MatchParen',    { fg = c.orange, bold = true, underline = true })
hi('NonText',       { fg = c.border })
hi('Whitespace',    { fg = c.border })
hi('EndOfBuffer',   { fg = c.bg })
hi('SpecialKey',    { fg = c.border })
hi('Conceal',       { fg = c.comment })
hi('Directory',     { fg = c.blue })
hi('Title',         { fg = c.accent, bold = true })
hi('WinSeparator',  { fg = c.border, bg = bg })
hi('VertSplit',     { link = 'WinSeparator' })

hi('StatusLine',    { fg = c.fg, bg = c.bg_alt })
hi('StatusLineNC',  { fg = c.comment, bg = c.bg_alt })
hi('TabLine',       { fg = c.fg_dim, bg = c.bg_alt })
hi('TabLineSel',    { fg = c.bg, bg = c.accent, bold = true })
hi('TabLineFill',   { bg = c.bg_alt })
hi('WinBar',        { fg = c.fg_dim, bg = bg })
hi('WinBarNC',      { fg = c.comment, bg = bg })

hi('Pmenu',         { fg = c.fg, bg = c.bg_alt })
hi('PmenuSel',      { fg = c.fg, bg = c.bg_sel, bold = true })
hi('PmenuSbar',     { bg = c.bg_alt })
hi('PmenuThumb',    { bg = c.border })
hi('WildMenu',      { link = 'PmenuSel' })

hi('ErrorMsg',      { fg = c.red, bold = true })
hi('WarningMsg',    { fg = c.yellow })
hi('MoreMsg',       { fg = c.green })
hi('ModeMsg',       { fg = c.fg_dim, bold = true })
hi('Question',      { fg = c.cyan })

-- ---------------------------------------------------------
-- Klassische Syntax-Gruppen
-- ---------------------------------------------------------
hi('Comment',       { fg = c.comment, italic = true })
hi('Constant',      { fg = c.orange })
hi('String',        { fg = c.green })
hi('Character',     { fg = c.green })
hi('Number',        { fg = c.orange })
hi('Boolean',       { fg = c.orange })
hi('Float',         { fg = c.orange })
hi('Identifier',    { fg = c.fg })
hi('Function',      { fg = c.blue })
hi('Statement',     { fg = c.purple })
hi('Conditional',   { fg = c.purple })
hi('Repeat',        { fg = c.purple })
hi('Label',         { fg = c.purple })
hi('Operator',      { fg = c.ice })
hi('Keyword',       { fg = c.purple })
hi('Exception',     { fg = c.red })
hi('PreProc',       { fg = c.purple })
hi('Include',       { fg = c.purple })
hi('Define',        { fg = c.purple })
hi('Macro',         { fg = c.purple })
hi('PreCondit',     { fg = c.purple })
hi('Type',          { fg = c.cyan })
hi('StorageClass',  { fg = c.cyan })
hi('Structure',     { fg = c.cyan })
hi('Typedef',       { fg = c.cyan })
hi('Special',       { fg = c.cyan })
hi('SpecialChar',   { fg = c.orange })
hi('Tag',           { fg = c.blue })
hi('Delimiter',     { fg = c.fg_dim })
hi('SpecialComment',{ fg = c.comment, bold = true })
hi('Debug',         { fg = c.red })
hi('Underlined',    { underline = true })
hi('Error',         { fg = c.red })
hi('Todo',          { fg = c.bg, bg = c.yellow, bold = true })

-- ---------------------------------------------------------
-- Treesitter
-- ---------------------------------------------------------
hi('@variable',                { fg = c.fg })
hi('@variable.builtin',        { fg = c.red })
hi('@variable.parameter',      { fg = c.orange })
hi('@variable.member',         { fg = c.ice })
hi('@property',                { fg = c.ice })
hi('@field',                   { fg = c.ice })
hi('@constant',                { fg = c.orange })
hi('@constant.builtin',        { fg = c.orange })
hi('@module',                  { fg = c.fg })
hi('@string',                  { fg = c.green })
hi('@string.escape',           { fg = c.cyan })
hi('@string.regexp',           { fg = c.cyan })
hi('@number',                  { fg = c.orange })
hi('@boolean',                 { fg = c.orange })
hi('@function',                { fg = c.blue })
hi('@function.call',           { fg = c.blue })
hi('@function.builtin',        { fg = c.cyan })
hi('@function.method',         { fg = c.blue })
hi('@constructor',             { fg = c.cyan })
hi('@keyword',                 { fg = c.purple })
hi('@keyword.function',        { fg = c.purple })
hi('@keyword.return',          { fg = c.purple })
hi('@keyword.operator',        { fg = c.purple })
hi('@operator',                { fg = c.ice })
hi('@type',                    { fg = c.cyan })
hi('@type.builtin',            { fg = c.cyan })
hi('@punctuation.delimiter',   { fg = c.fg_dim })
hi('@punctuation.bracket',     { fg = c.fg_dim })
hi('@comment',                 { link = 'Comment' })
hi('@tag',                     { fg = c.blue })
hi('@tag.attribute',           { fg = c.ice })
hi('@tag.delimiter',           { fg = c.fg_dim })
hi('@markup.heading',          { fg = c.accent, bold = true })
hi('@markup.strong',           { bold = true })
hi('@markup.italic',           { italic = true })
hi('@markup.link',             { fg = c.cyan, underline = true })
hi('@markup.raw',              { fg = c.green })

-- ---------------------------------------------------------
-- LSP und Diagnose
-- ---------------------------------------------------------
hi('DiagnosticError',          { fg = c.red })
hi('DiagnosticWarn',           { fg = c.yellow })
hi('DiagnosticInfo',           { fg = c.blue })
hi('DiagnosticHint',           { fg = c.cyan })
hi('DiagnosticOk',             { fg = c.green })
hi('DiagnosticVirtualTextError', { fg = c.red,    bg = '#2A2023' })
hi('DiagnosticVirtualTextWarn',  { fg = c.yellow, bg = '#29261F' })
hi('DiagnosticVirtualTextInfo',  { fg = c.blue,   bg = '#1D2831' })
hi('DiagnosticVirtualTextHint',  { fg = c.cyan,   bg = '#1B2A30' })
hi('DiagnosticUnderlineError', { undercurl = true, sp = c.red })
hi('DiagnosticUnderlineWarn',  { undercurl = true, sp = c.yellow })
hi('DiagnosticUnderlineInfo',  { undercurl = true, sp = c.blue })
hi('DiagnosticUnderlineHint',  { undercurl = true, sp = c.cyan })
hi('LspReferenceText',         { bg = c.bg_hl })
hi('LspReferenceRead',         { bg = c.bg_hl })
hi('LspReferenceWrite',        { bg = c.bg_sel })

-- ---------------------------------------------------------
-- Diff und Git
-- ---------------------------------------------------------
hi('DiffAdd',       { bg = '#1F3329' })
hi('DiffChange',    { bg = '#1F2C38' })
hi('DiffDelete',    { bg = '#38262A' })
hi('DiffText',      { bg = '#2F4550' })
hi('Added',         { fg = c.green })
hi('Changed',       { fg = c.blue })
hi('Removed',       { fg = c.red })
hi('GitSignsAdd',    { fg = c.green })
hi('GitSignsChange', { fg = c.blue })
hi('GitSignsDelete', { fg = c.red })

-- ---------------------------------------------------------
-- Plugins
-- ---------------------------------------------------------
-- Telescope
hi('TelescopeNormal',        { fg = c.fg, bg = c.bg_alt })
hi('TelescopeBorder',        { fg = c.border, bg = c.bg_alt })
hi('TelescopePromptNormal',  { fg = c.fg, bg = c.bg_hl })
hi('TelescopePromptBorder',  { fg = c.border, bg = c.bg_hl })
hi('TelescopePromptTitle',   { fg = c.bg, bg = c.accent, bold = true })
hi('TelescopePreviewTitle',  { fg = c.bg, bg = c.green, bold = true })
hi('TelescopeResultsTitle',  { fg = c.bg, bg = c.blue, bold = true })
hi('TelescopeSelection',     { fg = c.fg, bg = c.bg_sel, bold = true })
hi('TelescopeMatching',      { fg = c.accent, bold = true })

-- blink.cmp
hi('BlinkCmpMenu',           { link = 'Pmenu' })
hi('BlinkCmpMenuBorder',     { link = 'FloatBorder' })
hi('BlinkCmpMenuSelection',  { link = 'PmenuSel' })
hi('BlinkCmpLabelMatch',     { fg = c.accent, bold = true })
hi('BlinkCmpDoc',            { link = 'NormalFloat' })
hi('BlinkCmpDocBorder',      { link = 'FloatBorder' })

-- nvim-tree
hi('NvimTreeNormal',         { fg = c.fg, bg = bg })
hi('NvimTreeFolderName',     { fg = c.blue })
hi('NvimTreeOpenedFolderName', { fg = c.accent, bold = true })
hi('NvimTreeRootFolder',     { fg = c.accent, bold = true })
hi('NvimTreeIndentMarker',   { fg = c.border })
hi('NvimTreeGitDirty',       { fg = c.yellow })
hi('NvimTreeGitNew',         { fg = c.green })

-- which-key
hi('WhichKey',               { fg = c.accent })
hi('WhichKeyGroup',          { fg = c.purple })
hi('WhichKeyDesc',           { fg = c.fg })
hi('WhichKeySeparator',      { fg = c.comment })

-- ---------------------------------------------------------
-- Terminal-Farben im :terminal
-- ---------------------------------------------------------
vim.g.terminal_color_0  = c.bg
vim.g.terminal_color_1  = c.red
vim.g.terminal_color_2  = c.green
vim.g.terminal_color_3  = c.yellow
vim.g.terminal_color_4  = c.blue
vim.g.terminal_color_5  = c.purple
vim.g.terminal_color_6  = c.cyan
vim.g.terminal_color_7  = '#D9E7F2'
vim.g.terminal_color_8  = c.comment
vim.g.terminal_color_9  = '#F09090'
vim.g.terminal_color_10 = '#9BE5BD'
vim.g.terminal_color_11 = '#F2CE8C'
vim.g.terminal_color_12 = '#8FC7F0'
vim.g.terminal_color_13 = '#CDB7F6'
vim.g.terminal_color_14 = c.ice
vim.g.terminal_color_15 = '#FFFFFF'
