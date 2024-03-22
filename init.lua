-- Map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- options setting --
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.showmode = true
vim.opt.scrolloff = 5
vim.opt.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = 4
vim.o.smartindent = true
vim.o.cursorline = true
vim.o.clipboard = 'unnamedplus'

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- keymaps setting --
require("keymaps")

-- Plugins manager --
require("lazyconf")

-- autocmds setting --
require("autocmds")

-- colorscheme setting --
require("themes")

