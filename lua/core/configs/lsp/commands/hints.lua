function code_inlay_hints(client, inlay, buffer)
    if client and client.server_capabilities.inlayHintProvider and inlay then
        local hint = function() vim.lsp.inlay.enable(not inlay.is_enabled()) end
        keysmap('[T]oggle Inlay [H]ints', hint, buffer)
    end
end
