local null_ls = require("null-ls")

local sources = {
    -- python
    -- black is an opinionated py formatter
    null_ls.builtins.formatting.black.with({
        extra_args = { "--line-length=120" }
    }), null_ls.builtins.formatting.isort, -- sorts python imports alphabetically

    -- lua
    null_ls.builtins.formatting.lua_format.with(
        { -- https://github.com/Koihik/LuaFormatter
            extra_args = {
                "--single-quote-to-double-quote",
                "--spaces-inside-table-braces", "--column-limit=120"
            }
        }),

    -- general with prettier (prettierd is faster than prettier)
    null_ls.builtins.formatting.prettierd
}

null_ls.setup({ sources = sources })
