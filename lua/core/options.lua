packer_name = 'lazy'
vim.wo.number = true
vim.opt.number = true
vim.opt.relativenumber = false

vim.opt.cursorline = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'

vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.g.have_nerd_font = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.backspace = '2'

vim.opt.showmode = false
vim.opt.showcmd = true
vim.opt.autowrite = true
vim.opt.autoread = true

vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.shiftround = true
vim.opt.list = true
vim.opt.listchars = {
	tab = '>_',
	space = '_',
	trail = '·',
	nbsp = '␣',
}
vim.opt.expandtab = false

vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = 'split'
vim.opt.scrolloff = 1
vim.opt.hlsearch = true

vim.cmd [[ set noswapfile ]]
