-- ******************************
--
-- 放置配置的快捷键
--
-- ******************************

-- 定义快捷函数
local map = vim.keymap.set
local vscode = not vim.g.vscode or require("vscode-neovim")

-- Common --
map('', 'Q', 'gq')
map({'n', 'v'}, 'H', '^', { noremap = true })
map({'n', 'v'}, 'L', '$', { noremap = true })
map({'n', 'v'}, 'J', '5<Down>', { noremap = true })
map({'n', 'v'}, 'K', '5<Up>', { noremap = true })

map('n', '<Leader>sc', ':nohlsearch<CR>', { noremap = true })
map('n', '<Leader>j', 'J', { noremap = true })
map('n', '<Leader>k', 'K', { noremap = true })

-- Move to window using the <ctrl> hjkl keys
-- map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
-- map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
-- map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
-- map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })


-- vscode or neovim --
if vim.g.vscode then
    -- 在vscode中:w不能使用，需要使用:Write来代替
    map('n', '<Leader>fs', ':Write<CR>', { noremap = true })
    --- 使用vscode自带的注释功能
    map('n', 'gcc',
        function()
            vscode.call("editor.action.commentLine") 
        end,
        { noremap = true }
    )
    map({'x', 'n', 'o'}, 'gc',
        function()
            vscode.call("editor.action.commentLine") 
            -- 在执行注释之后，执行esc，自动推出visual select模式
            vim.api.nvim_input('<Esc>')
        end,
        { noremap = true }
    )
    map('n', '<Leader>ff', function() vscode.call("prettier.forceFormatDocument") end,
        { noremap = true }
    )
    map('n', '<Leader>rn', function() vscode.call("editor.action.rename") end, { noremap = true }
    )
    --- 需要在vscode中keybindings.json中添加以下配置
    -- {"key": "alt+n", "command": "vscode-neovim.send", "args": "<a-n>", "when": "editorTextFocus && neovim.init"},
    -- {"key": "alt+p", "command": "vscode-neovim.send", "args": "<a-p>", "when": "editorTextFocus && neovim.init"},
    -- 在vscode中使用ctrl+p打开搜索，然后输入>keyboard, 选非default的kebindings.josn(default的不让修改)
    map('n', '<A-n>', ':Tabnext<CR>', { noremap = true })
    map('n', '<A-p>', ':Tabprev<CR>', { noremap = true })
    -- 显示或者隐藏主侧边栏
    map('n', '<Leader>e', function() vscode.call("workbench.action.toggleSidebarVisibility") end)
else
    map('n', '<Leader>fs', ':w<CR>', { noremap = true })
    map('n', '<Leader>e', ':Vexplore .<CR>', { noremap = true })
    -- map('n', '<Leader>ec', ':Vexplore ~\\AppData\\Local\\nvim\\', { noremap = true })
    map('n', '<Leader>ec',
        function()
            local home = os.getenv("USERPROFILE") or os.getenv("HOMEDRIVE") .. os.getenv("HOMEPATH")
            vim.cmd(":Vexplore " .. home .. "\\AppData\\Local\\nvim\\")
        end
    )

    -- 原生的tab使用这个配置
    map('n', '<A-n>', ':tabnext<CR>', { noremap = true })
    map('n', '<A-p>', ':tabprev<CR>', { noremap = true })

    -- Resize window using <ctrl> arrow keys
    map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
    map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
    map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
    map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
end
