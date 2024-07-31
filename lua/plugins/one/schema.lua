function config_schema()
    vim.o.termguicolors = true
    vim.cmd [[ colorscheme tokyonight-night ]]
    vim.cmd.hi 'Comment gui=none'
end
