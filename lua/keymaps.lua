-- =========================================================
-- Telescope
-- =========================================================

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {
desc = 'Find files',
})

vim.keymap.set('n', '<leader>fg', builtin.live_grep, {
desc = 'Live grep',
})

vim.keymap.set('n', '<leader>fb', builtin.buffers, {
desc = 'Find buffers',
})

vim.keymap.set('n', '<leader>fh', builtin.help_tags, {
desc = 'Help',
})

vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {
desc = 'Recent files',
})

-- =========================================================
-- LSP
-- =========================================================

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {
desc = 'Go to definition',
})

vim.keymap.set('n', 'K', vim.lsp.buf.hover, {
desc = 'Show documentation',
})

vim.keymap.set('n', 'gr', vim.lsp.buf.references, {
desc = 'Find references',
})

vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {
desc = 'Rename',
})

vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {
desc = 'Code action',
})

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, {
desc = 'Show diagnostic',
})
-- =========================================================
-- Git
-- =========================================================

local gs = require('gitsigns')

vim.keymap.set('n', ']c', gs.next_hunk, {
  desc = 'Next Git hunk',
})

vim.keymap.set('n', '[c', gs.prev_hunk, {
  desc = 'Previous Git hunk',
})

vim.keymap.set('n', '<leader>hp', gs.preview_hunk, {
  desc = 'Preview Git hunk',
})

vim.keymap.set('n', '<leader>hs', gs.stage_hunk, {
  desc = 'Stage Git hunk',
})

vim.keymap.set('n', '<leader>hr', gs.reset_hunk, {
  desc = 'Reset Git hunk',
})

vim.keymap.set('n', '<leader>hb', gs.blame_line, {
  desc = 'Git blame line',
})
-- =========================================================
-- File Explorer
-- =========================================================

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', {
  desc = 'Toggle file explorer',
})
