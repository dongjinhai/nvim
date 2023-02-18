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

-- load plugins 
require('plugins')
-- vim.cmd("colorscheme onedarker")
vim.cmd[[colorscheme tokyonight]]
-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Key mappings -- 
vim.keymap.set('', 'Q', 'gq')
vim.keymap.set({'n', 'v'}, 'H', '^', { noremap = true })
vim.keymap.set({'n', 'v'}, 'L', '$', { noremap = true })
vim.keymap.set({'n', 'v'}, 'J', '5<Down>', { noremap = true })
vim.keymap.set({'n', 'v'}, 'K', '5<Up>', { noremap = true })

vim.keymap.set('n', '<Leader>sc', ':nohlsearch<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>fs', ':w<CR>', { noremap = true })

-- Auto command
-- 自动将光标移动到上次关闭文件前的位置
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = {"*"},
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.api.nvim_exec("normal! g'\"",false)
        end
    end
})
