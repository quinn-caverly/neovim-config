require("autoclose").setup({
    config = {
        keys = {
            ["("] = { escape = false, close = true, pair = "()" },
            ["["] = { escape = false, close = true, pair = "[]" },
            ["{"] = { escape = false, close = true, pair = "{}" },

            [">"] = { escape = true, close = false, pair = "<>" },
            [")"] = { escape = true, close = false, pair = "()" },
            ["]"] = { escape = true, close = false, pair = "[]" },
            ["}"] = { escape = true, close = false, pair = "{}" },

            ['"'] = { escape = true, close = true, pair = '""' },
            ["'"] = { escape = true, close = true, pair = "''" },
            ["`"] = { escape = true, close = true, pair = "``" },
        },
        options = {
            disabled_filetypes = {},
            -- if the cursor touches an alphanumeric ch then insert does not autoclose
            disable_when_touch = true,
            auto_indent = true,
        }
    }
})
