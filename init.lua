local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
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
    }, "nvim-lua/plenary.nvim", "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim", -- enables formatting, snippets, linting via config in after/

    "nvim-treesitter/nvim-treesitter", "ms-jpq/coq_nvim",
    "ms-jpq/coq.artifacts", "windwp/nvim-autopairs", "folke/trouble.nvim",

    "nvim-telescope/telescope.nvim", "numToStr/Comment.nvim"
})

require("mason").setup()

require("nvim-autopairs").setup()

require("quinn-caverly")
