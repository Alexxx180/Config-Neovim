function autocompletion_snippet(luasnip)
    return { expand = function(args) luasnip.lsp_expand(args.body) end, }
end

function autocompletion_map(luasnip, cmp)
    local keys = { 'i', 's' }
    local map = cmp.mapping
    -- Chosen mappings explanation `:help ins-completion`
    return cmp.mapping.preset.insert {
        -- Select the [n]ext / [p]revious item
        ['<C-n>'] = map.select_next_item(),
        -- ['<Tab>'] = cmp.mapping.select_next_item()
        ['<C-p>'] = map.select_prev_item(),
        -- ['<S-Tab>'] = cmp.mapping.select_prev_item()
        ['<C-b>'] = map.scroll_docs(-4), -- scroll docs [b]ack
        ['<C-f>'] = map.scroll_docs(4), -- scroll docs [f]orward
        -- Complete? ([y]es). LSP support: Auto-import. Expand snippets if send any.
        ['<C-y>'] = map.confirm { select = true }, 
        -- ['<CR>'] = map.confirm { select = true },
        ['<C-Space>'] = map.complete {}, -- Manual complete trigger

        ['<C-l>'] = map(function() -- move to the right of snippet expansions.
            if luasnip.expand_or_locally_jumpable() then luasnip.expand_or_jump() end
        end, keys),
        
        ['<C-h>'] = map(function() -- <c-h> is similar, except moving you backwards.
            if luasnip.locally_jumpable(-1) then luasnip.jump(-1) end
        end, keys),
        -- More advanced keymaps (choice nodes):
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
    }
end

function autocompletion_sources()
    return {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
    }
end
