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

lsp_on_attach = function(event)
    local telescope = require('telescope.builtin')
    map_features(telescope, builtin, event.buf)
    map_features(vim.lsp.buf, buffer, event.buf)
    map_features(vim.diagnostic, diagnostics, event.buf)
    cursor_features(event)
end

function keysmap(description, feature, buffer)
    print(description)
    keys = mappings[description]
    vim.keymap.set('n', keys, feature, {
        buffer = buffer,
        desc = 'LSP: '..description
    })
end
