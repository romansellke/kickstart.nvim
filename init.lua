-- =========================================================
-- Leader + Basics
-- =========================================================

vim.g.mapleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>')

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 8
vim.opt.clipboard = "unnamedplus"
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Tabstops
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Linebreak
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- Cursor line
vim.opt.cursorline = true
-- =========================================================
-- Plugin Manager: lazy.nvim
-- =========================================================

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.uv.fs_stat(lazypath) then
vim.fn.system({
'git',
'clone',
'--filter=blob:none',
'https://github.com/folke/lazy.nvim.git',
'--branch=stable',
lazypath,
})
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

-- =======================================================
-- Which-Key
-- =======================================================
{
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    preset = 'modern',

    spec = {
      { '<leader>f', group = 'Find' },
      { '<leader>h', group = 'Git hunk' },
      { '<leader>r', group = 'Rename' },
      { '<leader>c', group = 'Code' },
      { '<leader>d', desc = 'Show diagnostic' },
      { '<leader>e', desc = 'File explorer' },
    },
  },
},

-- =======================================================
-- Color scheme
-- =======================================================
{
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('tokyonight').setup({
      style = 'night',
    })
    vim.cmd.colorscheme('tokyonight')
  end,
},
-- =======================================================
-- Statusline: Lualine
-- =======================================================
{
  'nvim-lualine/lualine.nvim',

  event = 'VeryLazy',

  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  opts = {
    options = {
      theme = 'auto',
      globalstatus = true,
      section_separators = '',
      component_separators = '',
    },

    sections = {
      lualine_a = {
        'mode',
      },

      lualine_b = {
        'branch',
        'diff',
        'diagnostics',
      },

      lualine_c = {
        {
          'filename',
          path = 1,
        },
      },

      lualine_x = {
        'encoding',
        'fileformat',
        'filetype',
      },

      lualine_y = {
        'progress',
      },

      lualine_z = {
        'location',
      },
    },
  },
},
-- =======================================================
-- Icon scheme
-- =======================================================

{ "nvim-tree/nvim-web-devicons", lazy = true },

-- =======================================================
-- Telescope
-- =======================================================
{
'nvim-telescope/telescope.nvim',

lazy = false,

dependencies = {
  'nvim-lua/plenary.nvim',

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
},

config = function()
  local telescope = require('telescope')

  telescope.setup({
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case',
      },
    },
  })

  telescope.load_extension('fzf')
end,

},

-- =======================================================
-- Treesitter
-- =======================================================
{
'nvim-treesitter/nvim-treesitter',
lazy = false,
build = ':TSUpdate',
},
  -- =======================================================
  -- File Explorer
  -- =======================================================
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup()
    end,
  },
-- =======================================================
-- Autocomplete
-- =======================================================
{
'saghen/blink.cmp',

version = '1.*',

opts = {
  keymap = {
    preset = 'default',
  },

  appearance = {
    nerd_font_variant = 'mono',
  },

  completion = {
    documentation = {
      auto_show = true,
    },
  },

  sources = {
    default = { 'lsp', 'path', 'buffer' },
  },

  fuzzy = {
    implementation = 'prefer_rust_with_warning',
  },
},

},
  -- =======================================================
  -- Git
  -- =======================================================
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  },
-- =======================================================
-- LSP
-- =======================================================
{
'neovim/nvim-lspconfig',
},

{
'williamboman/mason.nvim',
config = function()
require('mason').setup()
end,
},

{
'williamboman/mason-lspconfig.nvim',
dependencies = {
'williamboman/mason.nvim',
'neovim/nvim-lspconfig',
},

config = function()
  require('mason-lspconfig').setup({
    ensure_installed = {
      'pyright',
      'jsonls',
      'yamlls',
    },
  })

  local capabilities = vim.lsp.protocol.make_client_capabilities()

  local servers = {
    pyright = {},
    jsonls = {},
    yamlls = {},
  }

  for server, config in pairs(servers) do
    config.capabilities = capabilities
    vim.lsp.config(server, config)
    vim.lsp.enable(server)
  end
end,

},
})

-- =========================================================
-- Keymaps
-- =========================================================

require('keymaps')


-- =========================================================
-- Platten sortieren 
-- =========================================================
vim.api.nvim_create_user_command('SortPlatten', function()
  vim.cmd([[%!grep -v '^-\+$' | sort | awk -F' - ' '{if(NR>1 && $1\!=prev) print "----------------------------------------"; print; prev=$1}']])
end, {})
