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
