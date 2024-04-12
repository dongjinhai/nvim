-- Map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- options setting --
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.wrap = false
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

if not vim.g.vscode then
    vim.g.netrw_banner=0  --禁用没用的横幅
    vim.g.netrw_winsize=25  --初始窗口大小为25%
    vim.g.netrw_liststyle=3 --使用树状模式
    vim.g.netrw_altv=1 --分割窗口时默认在右边
    vim.g.netrw_browse_split=4 -- enter时在上一个窗口打开
end

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- keymaps setting --
require("keymaps")

-- Plugins manager --
require("lazyconf")

-- autocmds setting --
require("autocmds")

-- colorscheme setting --
require("themes")

