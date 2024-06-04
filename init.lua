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
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins

        config = function() vim.cmd("colorscheme nordfox") end
    }, { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } }, "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim", "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", -- install formatters and language servers using Mason, may need config in null-ls

    "neovim/nvim-lspconfig", "jose-elias-alvarez/null-ls.nvim",                              -- enables formatting, snippets, linting via config in after/

    "nvim-treesitter/nvim-treesitter", "windwp/nvim-autopairs", "folke/trouble.nvim", "nvim-telescope/telescope.nvim",
    {
        "numToStr/Comment.nvim",
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
    }, "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui", "theHamsta/nvim-dap-virtual-text", "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap-python", "Vimjas/vim-python-pep8-indent",

    -- autocompletion with nvim-cmp (has many dependencies)
    { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" }, { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" }, { "neovim/nvim-lspconfig" }, { "L3MON4D3/LuaSnip" },
    { "hrsh7th/nvim-cmp" }, { "hrsh7th/cmp-nvim-lsp" }, { "hrsh7th/cmp-buffer" }, { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" }, { "rafamadriz/friendly-snippets" },
    -- fixes global vim problem: does a lot more also ?
    "folke/neodev.nvim", "ggandor/leap.nvim", "github/copilot.vim", {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function() require("dashboard").setup { theme = "hyper" } end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } }
}
})

require("neodev").setup()

local lsp_zero = require("lsp-zero")
lsp_zero.extend_lspconfig()
lsp_zero.on_attach(function(_, bufnr) lsp_zero.default_keymaps({ buffer = bufnr }) end)

lsp_zero.set_sign_icons({ error = "✘", warn = "▲", hint = "⚑", info = "»" })

require("mason").setup()
require("mason-lspconfig").setup({
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
        end
    }
})

require("lspconfig").lua_ls.setup({})
require("cmp").setup({})

require("nvim-dap-virtual-text").setup({})
require("dapui").setup()
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
-- require('dap-python').test_runner = 'pytest'

require("nvim-autopairs").setup()
require "nvim-web-devicons".setup()
require("leap").create_default_mappings()

require("quinn-caverly")
