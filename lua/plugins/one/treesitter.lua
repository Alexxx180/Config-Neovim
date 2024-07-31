function config_treesitter(_, opts)
    require('nvim-treesitter').setup {
        ensure_installed = {
            'c', 'cpp', 'c#', 'java', 'python', 'lua', 
            'html', 'css', 'js', 'markdown', 'vim', 'vimdoc',
            'makefile', 'bash', 'powershell', 'batchfile'
        },
        auto_install = true,
        higlight = { enable = true },
        indent = { enable = true }
    }
    require('nvim-treesitter.install').prefer_git = true
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup(opts)
end
