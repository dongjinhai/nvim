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


-- Key mappings -- 
vim.keymap.set('', 'Q', 'gq')
vim.keymap.set({'n', 'v'}, 'H', '^', { noremap = true })
vim.keymap.set({'n', 'v'}, 'L', '$', { noremap = true })
vim.keymap.set({'n', 'v'}, 'J', '5<Down>', { noremap = true })
vim.keymap.set({'n', 'v'}, 'K', '5<Up>', { noremap = true })

vim.keymap.set('n', '<Leader>sc', ':nohlsearch<CR>', { noremap = true })
if vim.g.vscode then
    -- 在vscode中:w不能使用，需要使用:Write来代替
    vim.keymap.set('n', '<Leader>fs', ':Write<CR>', { noremap = true })
else
    vim.keymap.set('n', '<Leader>fs', ':w<CR>', { noremap = true })
end
vim.keymap.set('n', '<Leader>J', 'J', { noremap = true })


-- Plugins manager --
require("config.lazy")


if not vim.g.vscode then
    -- Auto command
    require("config.autocmds")
end


-- VsCode action keymaps -- 
if vim.g.vscode then
    require("config.vscode")
end


-- Autocmd -- 
-- 在复制文本的时候高亮被复制的文本
vim.api.nvim_create_autocmd({"TextYankPost"}, {
    pattern = "*",
    callback = function() vim.highlight.on_yank({ higroup="IncSearch", timeout=250 }) end
})
