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

            -- vim.cmd.colorscheme "catppuccin"
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
        cond = not vim.g.vscode -- 在vsocde模式下不加载此插件
    },
    {
        'akinsho/bufferline.nvim',
        version = "*",
        event = "VeryLazy",
        dependencies = 'nvim-tree/nvim-web-devicons',
        keys = {
            { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
            { "<leader>bd", "<Cmd>bd<CR>bN<CR>", desc = "Delete current Buffer and go to PreBuffer" },
            { "<A-n>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
            { "<A-p>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
        },
        opts = {
            options = {
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "Neo-tree",
                        highlight = "Directory",
                        text_align = "left",
                    }
                },
            }
        },
        config = function(_, opts)
            vim.opt.termguicolors = true
            require("bufferline").setup(opts)
        end,
        cond = not vim.g.vscode -- 在vsocde模式下不加载此插件
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        cond = not vim.g.vscode, -- 在vsocde模式下不加载此插件
        init = function()
            vim.g.lualine_laststatus = vim.o.laststatus
            if vim.fn.argc(-1) > 0 then
                -- set an empty statusline till lualine loads
                vim.o.statusline = " "
            else
                -- hide the statusline on the starter page
                vim.o.laststatus = 0
            end
        end,
        opts = function()
            -- PERF: we don't need this lualine require madness 🤷
            local lualine_require = require("lualine_require")
            lualine_require.require = require
            vim.o.laststatus = vim.g.lualine_laststatus
            return {
                options = {
                    theme = "auto",
                    globalstatus = true,
                    disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },
                    lualine_c = {
                        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                        {
                            'filename',
                            file_status = true,      -- Displays file status (readonly status, modified status)
                            newfile_status = false,  -- Display new file status (new file means no write after created)
                            path = 1,                -- 0: Just the filename
                                                     -- 1: Relative path
                                                     -- 2: Absolute path
                                                     -- 3: Absolute path, with tilde as the home directory
                                                     -- 4: Filename and parent dir, with tilde as the home directory

                            shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                                                     -- for other components. (terrible name, any suggestions?)
                            symbols = {
                                modified = '[+]',      -- Text to show when the file is modified.
                                readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
                                unnamed = '[No Name]', -- Text to show for unnamed buffers.
                                newfile = '[New]',     -- Text to show for newly created file before first write
                            }
                        }
                    },
                    lualine_y = {
                        { "progress", separator = " ", padding = { left = 1, right = 0 } },
                        { "location", padding = { left = 0, right = 1 } },
                    },
                    lualine_z = {
                        function()
                            return " " .. os.date("%R")
                        end,
                    },
                },
                extensions = { "neo-tree", "lazy" },
            }
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old and doesn't work on Windows
        build = ":TSUpdate",
        event = { "VeryLazy" },
        init = function()
            require("nvim-treesitter.configs").setup({
                highlight = { enable = true },
                indent = { enable = true },
                ensure_installed = {
                  "lua",
                  "luadoc",
                  "luap",
                  "toml",
                  "vimdoc",
                }
            })
        end,
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" }
    }
})
