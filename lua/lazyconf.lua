local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "kylechui/nvim-surround",
        init = function()
            require("nvim-surround").setup({})
        end
    },
    { 
        'echasnovski/mini.ai',
        version = '*',
        init = function()
            require("mini.ai").setup()
        end
    },
    { 
        'echasnovski/mini.comment',
        version = '*',
        init = function()
            require("mini.comment").setup()
        end,
        cond = not vim.g.vscode -- 在vsocde模式下不加载此插件
    },
    { 
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        cond = not vim.g.vscode,  -- 在vsocde模式下不加载此插件
        init = function()
            require("catppuccin").setup({
                flavour = "mocha",
                background = {
                    light = "latte",
                    dark = "mocha"
                },
            })

            vim.cmd.colorscheme "catppuccin"
        end
    }
})
