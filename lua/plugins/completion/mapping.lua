function autocompletion_snippet(luasnip)
    return { expand = function(args) luasnip.lsp_expand(args.body) end, }
end

function to_right_expansion(snippet) -- move to the right of snippet expansions.
    if snippet.expand_or_locally_jumpable() then snippet.expand_or_jump() end
end

function to_expansion_backwards(snippet) -- similar with right, except moving you backwards.
    if snippet.locally_jumpable(-1) then snippet.jump(-1) end
end

function autocompletion_map(luasnip, cmp)
    local keys = { 'i', 's' }
    local map = cmp.mapping
    local items = {
        ok = '<C-y>',
        -- ok = '<CR>',
        back = '<C-p>',
        -- back = '<Tab>',
        forw = '<C-n>',
        -- forw = '<S-Tab>',
    }
    -- Chosen mappings explanation `:help ins-completion`
    return cmp.mapping.preset.insert {
        [items.forw] = map.select_next_item(), -- Select the [n]ext
        [items.back] = map.select_prev_item(), -- / [p]revious item
        [items.ok] = map.confirm { select = true }, 
        ['<C-b>'] = map.scroll_docs(-4), -- scroll [b]ack /
        ['<C-f>'] = map.scroll_docs(4), -- docs [f]orward
        ['<C-Space>'] = map.complete {}, -- Complete? ([y]es). Expand snippets if send any.
        ['<C-l>'] = map(function() to_right_expansion(luasnip) end, keys),
        ['<C-h>'] = map(function() to_expansion_backwards(luasnip) end, keys),
        -- More advanced keymaps (choice nodes): L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
    }
end

function autocompletion_sources()
    return {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
    }
end
