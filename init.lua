require("core.options")
require("packers")

require("core.mappings.icons")

map_linked_features('')

require("core.configs.one.treesitter")
require("core.configs.lsp")
require("core.configs.completion")
require('lazy').setup({
  { 'numToStr/Comment.nvim', opts = {} },
  'nvim-tree/nvim-tree.lua',
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = retrieve_dependencies_telescope(),
    config = telescope_config,
  },
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      { 'folke/neodev.nvim', opts = {} },
    },
    config = lsp_config,
  },
  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = autoformat_keys(),
    opts = autoformat_options(),
  },
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = retrieve_dependencies_cmp(),
    config = config_autocompletion,
  }, -- Color schema
  { 'folke/tokyonight.nvim', priority = 1000, init = config_schema, },
  { 'catppuccin/nvim', as = 'catppuccin' };
  { -- Highlight todo, notes, etc in comments
      'folke/todo-comments.nvim',
      event = 'VimEnter',
      dependencies = { 'nvim-lua/plenary.nvim' },
      opts = { signs = false }
  }, -- Collection of various small independent plugins/modules
  { 'echasnovski/mini.nvim', config = config_mini, },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = config_treesitter,
  },

}, { ui = { icons = retrieve_icons() }, })

require("core.configs.one.tree")
require("core.startup")
