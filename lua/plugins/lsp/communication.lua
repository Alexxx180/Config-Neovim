-- LSP features communication, :Mason - status : `g?` - help.
function lsp_communication()
    local lspconfig = require('lspconfig')
    local default = require("cmp_nvim_lsp").default_capabilities()
    local features = vim.lsp.protocol.make_client_capabilities()
    features = vim.tbl_deep_extend('force', features, default)

    local install = vim.tbl_keys(servers or {})
    vim.list_extend(install, { 'stylua' }) -- Lua code format
    require('mason').setup()
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }
    require('mason-lspconfig').setup {
        handlers = {
            function(name) -- Turn on/off LSP features via override
                local server = servers[name] or {}
                server.capabilities = vim.tbl_deep_extend('force', {},
                    features, server.capabilities or {})
                lspconfig[name].setup(server)
            end,
        },
    }
    lspconfig.gdscript.setup(add_gdscript(features))
end

function lsp_attach_commands()
    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = lsp_on_attach
    })
end

function lsp_config()
    lsp_attach_commands()
    lsp_communication()
end
