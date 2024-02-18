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

vim.g.mapleader = " "

require("lazy").setup({
    "nvim-lua/plenary.nvim",

    "andersevenrud/nordic.nvim",

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim",

    "nvim-treesitter/nvim-treesitter",

    "ms-jpq/coq_nvim",
    "ms-jpq/coq.artifacts",

    "windwp/nvim-autopairs",

    "folke/trouble.nvim",

    "nvim-telescope/telescope.nvim",

    "numToStr/Comment.nvim",
})

require("mason").setup()

require('nvim-autopairs').setup()

require("quinn-caverly")
