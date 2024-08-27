mappings = {
    common = {
        modes = {
            ['<cmd>nohlsearch<CR>'] = { desc = 'Clear search highlights in normal mode', key = '<Esc>' },
            ['<C-\\><C-n>'] = { desc = 'Exit terminal mode', key = '<Esc><Esc>', as = 't' },
        },
        windows = { -- See `:help wincmd` for a list of all window commands
            ['<C-w><C-h>'] = { desc = 'Move focus to the left window', key = '<C-h>' },
            ['<C-w><C-l>'] = { desc = 'Move focus to the right window', key = '<C-l>' },
            ['<C-w><C-j>'] = { desc = 'Move focus to the lower window', key = '<C-j>' },
            ['<C-w><C-k>'] = { desc = 'Move focus to the upper window', key = '<C-k>' },
        },
    },
    lsp = {
        builtin = { -- Word under cursor actions -- Symbols = methods, variables and so on
            lsp_references = { desc = 'LSP [G]oto [R]eferences', key = 'gr' }, -- Find references for the word.
            lsp_definitions = { desc = 'LSP [G]oto [D]efinition', key = 'gd' }, -- Jump to the word definition
            lsp_implementations  = { desc = 'LSP [G]oto [I]mplementation', key = 'gI' }, -- Jump to the word implementation.
            lsp_type_definitions = { desc = 'LSP Type [D]efinition', key = '<leader>D' }, -- Jump to the word type.
            lsp_document_symbols = { desc = 'LSP [D]ocument [S]ymbols', key = '<leader>ds' }, -- Find all in current document.
            lsp_dynamic_workspace_symbols = { desc = 'LSP [W]orkspace [S]ymbols', key = '<leader>ws' }, -- Find all in current workspace.
        },
        buffer = {
            hover = { desc = 'Hover Documentation', key = 'K' }, -- Docs Popup about the word under your cursor
            rename = { desc = '[R]e[n]ame', key = '<leader>rn' }, -- Rename the variable. Even across files if supported
            code_action = { desc = '[C]ode [A]ction', key = '<leader>ca' }, -- Execute a code action at error top
            declaration = { desc = '[G]oto [D]eclaration', key = 'gD' }, --  Jump to the word declaration (or header).
        },
        diagnostics = {
            goto_prev = { desc = 'Go to previous [D]iagnostic message', key = '[d' },
            goto_next = { desc = 'Go to next [D]iagnostic message', key = ']d' },
            setloclist = { desc = 'Show diagnostic [E]rror messages', key = '<leader>e' },
            open_float = { desc = 'Open diagnostic [Q]uickfix list', key = '<leader>q' },
        },
    },
    toggle_inlay_hints = { desc = '[T]oggle Inlay [H]ints', key = '<leader>th' },
    telescope = {
        builtin = {
            help_tags = { desc = '[S]earch [H]elp', key = '<leader>sh' },
            keymaps = { desc = '[S]earch [K]eymaps', key = '<leader>sk' },
            find_files = { desc = '[S]earch [F]iles', key = '<leader>sf' },
            builtin = { desc = '[S]earch [S]elect Telescope', key = '<leader>ss' },
            grep_string = { desc = '[S]earch current [W]ord', key = '<leader>sw' },
            live_grep = { desc = '[S]earch by [G]rep', key = '<leader>sg' },
            diagnostics = { desc = '[S]earch [D]iagnostics', key = '<leader>sd' },
            resume = { desc = '[S]earch [R]esume', key = '<leader>sr' },
            oldfiles = { desc = '[S]earch Recent Files ("." for repeat)', key = '<leader>s.' },
            buffers = { desc = '[ ] Find existing buffers', key = '<leader><leader>' },
        },
        buffer = {
            buffer_search = { desc = '[/] Fuzzily search in current buffer', key = '<leader>/' },
			live_grep = { desc = '[S]earch [/] in Open Files', key = '<leader>sn' },
			find_files = { desc = '[S]earch [N]eovim files', key = '<leader>s/' },  -- Search Neovim config files,
        },
    },
    tree = {
        [':NvimTreeFindFile'] = { desc = 'NTree Find File', key = '<c-n>' },
        [':NvimTreeToggle<CR>'] = { desc = 'NTree Find File', key = '<c-o>' },
    }
}
