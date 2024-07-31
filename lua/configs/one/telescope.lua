local t = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', t.find_files, {})
vim.keymap.set('n', '<leader>fg', t.live_grep, {})
vim.keymap.set('n', '<leader>fb', t.buffers, {})
vim.keymap.set('n', '<leader>fh', t.help_tags, {})

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

builtin = {
    -- Word under cursor actions
    lsp_references = '[G]oto [R]eferences', -- Find references for the word.
    lsp_definitions = '[G]oto [D]efinition', -- Jump to the word definition
    lsp_implementations  = '[G]oto [I]mplementation', -- Jump to the word implementation.
    lsp_type_definitions = 'Type [D]efinition', -- Jump to the word type.
    -- Symbols = methods, variables and so on
    lsp_document_symbols = '[D]ocument [S]ymbols', -- Find all in current document.
    lsp_dynamic_workspace_symbols = '[W]orkspace [S]ymbols', -- Find all in current workspace.
}

buffer = {
    hover = 'Hover Documentation', -- Docs Popup about the word under your cursor
    rename = '[R]e[n]ame', -- Rename the variable. Even across files if supported
    code_action = '[C]ode [A]ction', -- Execute a code action at error top
    declaration = '[G]oto [D]eclaration', --  Jump to the word declaration (or header).
}

diagnostics = {
    goto_prev = 'Go to previous [D]iagnostic message',
    goto_next = 'Go to next [D]iagnostic message',
    setloclist = 'Show diagnostic [E]rror messages',
    open_float = 'Open diagnostic [Q]uickfix list'
}

map_features = function(provider, events, buf)
    for feature, description in pairs(events) do
        keysmap(description, provider[feature], buf)
    end
end

events = 

telescope = {
    {
        plugin = require('telescope.builtin'),
        features = {
            help_tags = '[S]earch [H]elp',
            keymaps = '[S]earch [K]eymaps',
            find_files = '[S]earch [F]iles',
            builtin = '[S]earch [S]elect Telescope',
            grep_string = '[S]earch current [W]ord',
            live_grep = '[S]earch by [G]rep',
            diagnostics = '[S]earch [D]iagnostics',
            resume = '[S]earch [R]esume',
            oldfiles = '[S]earch Recent Files ("." for repeat)',
            buffers = '[ ] Find existing buffers',
        }
    },
    {
        plugin = {
            buffer_search = buffer_search,
            live_grep = live_grep,
            find_files = find_files
        },
        features = {
            buffer_search = '[/] Fuzzily search in current buffer',
            live_grep = '[S]earch [/] in Open Files',
            find_files = '[S]earch [N]eovim files',  -- Search Neovim config files
        }
    }
}



function telescope_config()
    --  :Telescope help_tags `:help telescope` `:help telescope.setup()`
    --  Keymaps: - Insert mode: <c-/> - Normal mode: ?
    require('telescope').setup {
        extensions = { ['ui-select'] = { require('telescope.themes').get_dropdown(), }, },
    }
    enable_extensions()
    -- See `:help telescope.builtin`
    map_linked_features(telescope)
end
