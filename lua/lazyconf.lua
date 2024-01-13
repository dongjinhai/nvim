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
    { "folke/which-key.nvim", lazy = true },
    -- { 
    --     "numToStr/Comment.nvim",
    --     init = function()
    --         require("Comment").setup()
    --     end
    -- },
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
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        -- 在vsocde模式下不加载此插件 --
        cond = not vim.g.vscode,
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
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
          -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        -- 在vsocde模式下不加载此插件 --
        cond = not vim.g.vscode 
    }
})
