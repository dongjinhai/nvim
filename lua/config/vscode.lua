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
        vim.api.nvim_input('<Esc>')
    end,
    { noremap = true }
)

