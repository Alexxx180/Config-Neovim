function table.sclone(original)
    local clone = {}
    for key, value in pairs(orinial) do clone[key] = value end
    return clone
end

-- Cursor highlight on hold for a while `:help CursorHold`
function cursor_highlight_on_hold(name, buffer)
    local highlight = vim.api.nvim_create_augroup(name, { clear = false })
    local hold = { buffer = buffer, group = highlight }
    local commands = {
        Hold = { 'document_highlight', hold },
        Moved = { 'clear_reference', table.sclone(hold) }
    }
    for command, data in commands do
        local event = data[1]; local sets = data[2]; sets.callback = vim.lsp.buf[event]
        vim.api.nvim_create_autocmd({ 'Cursor'..command, 'Cursor'..command..'I' }, sets)
    end
end
