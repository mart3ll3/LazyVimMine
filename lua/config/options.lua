-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.hlsearch = true
vim.opt.incsearch = true
vim.wo.relativenumber = true
vim.opt.clipboard = ""
-- Make line numbers default
vim.wo.number = true

-- Joshua Morony settings
vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.showmatch = true
vim.opt.synmaxcol = 300
vim.opt.laststatus = 3 -- always show statusline

-- Sidebar
vim.opt.numberwidth = 3
vim.opt.showcmd = true
vim.opt.cmdheight = 0

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"
vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"

-- Enable mouse mode
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.o.clipboard = ''

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
vim.o.guifont = "JetBrainsMono Nerd Font:h12"
vim.o.lines = 999
vim.o.columns = 999
vim.o.cursorline = true
