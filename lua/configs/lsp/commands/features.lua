function cursor_features(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    code_inlay_hints(client, vim.lsp.inlay_hint, event.buf)
--and vim.lsp.protocol.Methods
    if client and client.server_capabilities.documentHighlightProvider then
        local name = 'lsp-highlight'
        cursor_highlight_on_hold(name, event.buf)
        cursor_detach_on_move(name, event.buf)
    end
end
