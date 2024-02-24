local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup({
    {
        "EdenEast/nightfox.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins

        config = function() vim.cmd("colorscheme nordfox") end
    }, { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } }, "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim", "williamboman/mason.nvim", -- install formatters and language servers using Mason, may need config in null-ls

    "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig", "jose-elias-alvarez/null-ls.nvim", -- enables formatting, snippets, linting via config in after/

    "nvim-treesitter/nvim-treesitter", "ms-jpq/coq_nvim", "ms-jpq/coq.artifacts", "windwp/nvim-autopairs",
    "folke/trouble.nvim", "nvim-telescope/telescope.nvim", "numToStr/Comment.nvim", {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    }, "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui", "theHamsta/nvim-dap-virtual-text",
    "mfussenegger/nvim-dap-python", "Vimjas/vim-python-pep8-indent"
})

require("mason").setup()

require("nvim-dap-virtual-text").setup()
require("dapui").setup()
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
-- require('dap-python').test_runner = 'pytest'

require("nvim-autopairs").setup()

require'nvim-web-devicons'.setup()

require("quinn-caverly")
