function config_nvimtree()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local treeview = { width = 45 }

    require("nvim-tree").setup({ view = treeview })
    map_features(mappings['tree'], nvimtree)
end
