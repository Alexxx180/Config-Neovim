function retrieve_dependencies_telescope()
    return {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function() return vim.fn.executable 'make' == 1 end,
        },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    }
end

function enable_extensions()
    for _, extension in ipairs({ 'fzf', 'ui-select' }) do
        pcall(require('telescope').load_extension, extension)
    end
end

function telescope_config()
    --  :Telescope help_tags `:help telescope` `:help telescope.setup()`
    require('telescope').setup { --  Keymaps: - Insert mode: <c-/> - Normal mode: ?
        extensions = { ['ui-select'] = { require('telescope.themes').get_dropdown(), }, },
    }
    enable_extensions()
    map_linked_features('telescope', get_telescope_features()) -- See `:help telescope.builtin`
end
