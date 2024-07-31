function keysmap(params, feature, buffer)
    local mode = 'n'
    if params.mode then mode = params.mode end

    local attributes = { desc = params.description }
    if buffer then attributes.buffer = buffer end

    vim.keymap.set(mode, params.key, feature, attributes)
end

function map_features(mapping, plugin, features, buffer)
    for _, feature in ipairs(features) do
        keysmap(mapping[feature], plugin[feature], buffer)
    end
end

function map_linked_features(group, providers, buffer)
    for subgroup, provider in pairs(providers) do
        local mapping = mappings[group][subgroup]
        map_features(mapping, provider.plugin, provider.features, buffer)
    end
end
