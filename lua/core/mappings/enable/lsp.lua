lsp_features = {
    builtin = {
        plugin = require('telescope.builtin'),
        features = {
            lsp_references, lsp_definitions, lsp_implementations, lsp_type_definitions,
            lsp_document_symbols, lsp_dynamic_workspace_symbols,
        }
    },
    buffer = {
        plugin = vim.lsp.buf,
        features = { hover, rename, code_action, declaration, }
    },
    diagnostics = {
        plugin = vim.diagnostic,
        features = { goto_prev, goto_next, setloclist, open_float }
    }
}
