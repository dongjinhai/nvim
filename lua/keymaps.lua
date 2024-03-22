-- 放置配置的快捷键

-- Common --
vim.keymap.set('', 'Q', 'gq')
vim.keymap.set({'n', 'v'}, 'H', '^', { noremap = true })
vim.keymap.set({'n', 'v'}, 'L', '$', { noremap = true })
vim.keymap.set({'n', 'v'}, 'J', '5<Down>', { noremap = true })
vim.keymap.set({'n', 'v'}, 'K', '5<Up>', { noremap = true })

vim.keymap.set('n', '<Leader>sc', ':nohlsearch<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>J', 'J', { noremap = true })

vim.keymap.set('n', '<A-n>', ':tabnext<CR>', { noremap = true })
vim.keymap.set('n', '<A-p>', ':tabprev<CR>', { noremap = true })


-- vscode or neovim --
if vim.g.vscode then
    -- 在vscode中:w不能使用，需要使用:Write来代替
    vim.keymap.set('n', '<Leader>fs', ':Write<CR>', { noremap = true })
    --- 使用vscode自带的注释功能
    vim.keymap.set('n', 'gcc',
        function()
            require("vscode-neovim").call("editor.action.commentLine") 
        end,
        { noremap = true }
    )
    vim.keymap.set({'x', 'n', 'o'}, 'gc',
        function()
            require("vscode-neovim").call("editor.action.commentLine") 
            -- 在执行注释之后，执行esc，自动推出visual select模式
            vim.api.nvim_input('<Esc>')
        end,
        { noremap = true }
    )
    vim.keymap.set('n', '<Leader>ff',
        function()
            require("vscode-neovim").call("prettier.forceFormatDocument")
        end,
        { noremap = true }
    )
else
    vim.keymap.set('n', '<Leader>fs', ':w<CR>', { noremap = true })
    vim.keymap.set('n', '<Leader>e', ':Neotree<CR>', { noremap = true })
    vim.keymap.set('n', '<Leader>ec', ':Neotree ~/AppData/Local/nvim<CR>', { noremap = true })
end
