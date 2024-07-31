function format_conform()
    require('conform').format { async = true, lsp_fallback = true }
end

function autoformat_keys()
    return {
        { 
            '<leader>f',
            format_conform,
            mode = '',
            desc = '[F]ormat buffer',
        },
    }
end

function autoformat_options()
    return {
        notify_on_error = false,
        format_on_save = function(bufnr)
            local disable_filetypes = { c = true, cpp = true }
            local file = vim.bo[bufnr].filetype
            local fallback = not disable_filetypes[file]
            return { timeout_ms = 500, lsp_fallback = fallback }
        end,
        formatters_by_ft = { lua = { 'stylua' }, },
    }
end
