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
        completion = { completeopt = 'menu,menuone,noinsert' },
        snippet = autocompletion_snippet(luasnip),
        mapping = autocompletion_map(luasnip, cmp),
        sources = autocompletion_sources(),
    })
end
