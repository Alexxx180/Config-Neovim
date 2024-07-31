lsp_on_attach = function(event)
    require("core.mapping.enable.lsp")
    map_linked_features(get_lsp_features(), event.buf)
    cursor_features(event)
end
