local function bootstrap_pckr()
    local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

    if not vim.loop.fs_stat(pckr_path) then
        vim.fn.system({
            'git',
            'clone',
            '--filter=blob:none',
            'https://github.com/lewis6991/pckr.nvim',
            pckr_path
        })
    end

    vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()
--require("core.plugin_config.nvim-lspconfig")

require("core.configs.os");
require("core.configs.completion")

return require('pckr').add{
    -- fast commentary :1,10Commentary
    'tpope/vim-commentary';

    -- color scheme
    'dracula/vim';

    { 'catppuccin/nvim', as = 'catppuccin' };

    -- icons, status, highlight, tree
    'nvim-lualine/lualine.nvim';
    'nvim-treesitter/nvim-treesitter';
    'nvim-tree/nvim-tree.lua';
    'nvim-tree/nvim-web-devicons';

    -- testing
    'vim-test/vim-test';

    -- :Git commands and markings
    'lewis6991/gitsigns.nvim';
    'tpope/vim-fugitive';

    -- surrounding
    'tpope/vim-surround';

    --'saadparwaiz1/cmp_luasnip';
    --'hrsh7th/nvim-cmp';
    --'hrsh7th/cmp-nvim-lsp';
    --'L3MON4D3/LuaSnip';
    --'rafamadriz/friendly-snippets';

    -- package management
    --'williamboman/mason.nvim',
  --  'williamboman/mason-lspconfig.nvim';
--    'neovim/nvim-lspconfig';
    -- 'WhoIsSethDaniel/mason-tool-installer.nvim';
    --
    { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
            if is_windows or vim.fn.executable 'make' == 0 then return end
            return 'make install_jsregexp'
        end)(),
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
             config = function()
               require('luasnip.loaders.from_vscode').lazy_load()
             end,
          },
        },
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = config_autocompletion
  };

    { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
      -- used for completion, annotations and signatures of Neovim apis
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      require("core.configs.lsp")
      require("core.configs.lsp.communication")
      lsp_attach_commands()
      lsp_communication()
    end,
  };

    'j-hui/fidget.nvim';
    'folke/neodev.nvim';
    -- file finder
    { 'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = {'nvim-lua/plenary.nvim'}
    };


--[=[require("core.configs.os");
require('L3MON4D3/LuaSnip').setup({
    build = (function()
        if is_windows or vim.fn.executable 'make' == 0 then return end
        return 'make install_jsregexp'
    end)()
})]=]
}
