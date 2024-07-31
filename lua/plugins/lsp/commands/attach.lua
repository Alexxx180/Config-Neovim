lsp_on_attach = function(event)
    map_linked_features('lsp', get_lsp_features(), event.buf)
    cursor_features(event)
end
