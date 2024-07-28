mappings = {
    -- Word under cursor actions
    ['[G]oto [R]eferences'] = 'gr', -- Find references for the word.
    ['[G]oto [D]efinition'] = 'gd', -- Jump to the word definition
    ['[G]oto [D]eclaration'] = 'gD', --  Jump to the word declaration (or header).
    ['[G]oto [I]mplementation'] = 'gI', -- Jump to the word implementation.
    ['Type [D]efinition'] = '<leader>D', -- Jump to the word type.
    -- Symbols = methods, variables and so on
    ['[D]ocument [S]ymbols'] = '<leader>ds', -- Find all in current document.
    ['[W]orkspace [S]ymbols'] = '<leader>ws', -- Find all in current workspace.
    ['[R]e[n]ame'] = '<leader>rn', -- Rename the variable. Even across files if supported
    ['[C]ode [A]ction'] = '<leader>ca', -- Execute a code action at error top
    ['Hover Documentation'] = 'K', -- Docs Popup about the word under your cursor
    -- Additional features
    ['[T]oggle Inlay [H]ints'] = '<leader>th',
    -- Diagnostics
    ['Go to previous [D]iagnostic message'] = '[d',
    ['Go to next [D]iagnostic message'] = ']d',
    ['Show diagnostic [E]rror messages'] = '<leader>e',
    ['Open diagnostic [Q]uickfix list'] = '<leader>q'
}

function keysmap(description, feature, buffer)
    keys = mappings[description]
    vim.keymap.set('n', keys, feature, {
        buffer = buffer,
        desc = 'LSP: '..description
    })
end
