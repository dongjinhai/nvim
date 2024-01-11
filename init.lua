-- Map leader to space
vim.g.mapleader = ' '

-- Common settings
vim.o.nohlsearch = true
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.showmode = true
vim.o.scrolloff = 5
vim.o.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = 4
vim.o.smartindent = true
vim.o.cursorline = true
vim.o.clipboard = 'unnamedplus'

-- keymaps setting --
require("keymaps")

-- Plugins manager --
require("lazyconf")

-- autocmds setting --
require("autocmds")
