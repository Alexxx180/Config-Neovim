-- LSP features communication, :Mason - status : `g?` - help.
function lsp_communication()
    require("core.configs.lsp.support.godot")

    local lspconfig = require('lspconfig')
    local default = require("cmp_nvim_lsp").default_capabilities()
    local features = vim.lsp.protocol.make_client_capabilities()
    features = vim.tbl_deep_extend('force', features, default)

    require('core.configs.lsp.config.servers')
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
