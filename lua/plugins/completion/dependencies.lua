function config_from_vscode()
    require('luasnip.loaders.from_vscode').lazy_load()
end

-- Snippet Engine & its associated nvim-cmp source
function retrieve_dependencies_cmp()
    return {
        {
            'L3MON4D3/LuaSnip',
            build = luasnip_build(),
            dependencies = {
                { 'rafamadriz/friendly-snippets', config = config_from_vscode, },
            },
        },
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
    }
end
