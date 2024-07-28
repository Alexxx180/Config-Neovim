-- Clear the highlights on cursor move
function cursor_detach_on_move(name, vim, buffer)
    local command = {
        callback = function(event2)
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds { group = name, buffer = buffer }
        end,
        group = vim.api.nvim_create_augroup('lsp-detach', { clear = true })
    }

    vim.api.nvim_create_autocmd('LspDetach', command)
end
