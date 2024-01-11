-- 配置自动命令

-- common --
-- 在复制文本的时候高亮被复制的文本
vim.api.nvim_create_autocmd({"TextYankPost"}, {
    pattern = "*",
    callback = function() vim.highlight.on_yank({ higroup="IncSearch", timeout=250 }) end
})


-- vscode or neovim --
if not vim.g.vscode then
    -- 自动将光标移动到上次关闭文件前的位置
    vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = {"*"},
        callback = function()
            if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
                vim.api.nvim_exec("normal! g'\"",false)
            end
        end
    })
end
