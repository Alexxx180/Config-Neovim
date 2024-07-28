function luasnip_build()
    if is_windows or vim.fn.executable 'make' == 0 then return end
    return 'make install_jsregexp'
end

function config_autocompletion()
    local luasnip = require('luasnip')
    luasnip.config.setup {}
    local cmp = require('cmp') -- See `:help cmp`
    cmp.setup({
        event = 'InsertEnter',
        snippet = autocompletion_snippet(),
        completion = { completeopt = 'menu,menuone,noinsert' },
        mapping = autocompletion_map(cmp),
        sources = autocompletion_sources(),
    })
end
