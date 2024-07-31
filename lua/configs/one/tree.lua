vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local treeview = { width = 30 }

require("nvim-tree").setup({ view = treeview })

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFile<CR>')
vim.keymap.set('n', '<c-o>', ':NvimTreeToggle<CR>')
