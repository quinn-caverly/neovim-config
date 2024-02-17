require('hypersonic').setup({
    ---@type 'none'|'single'|'double'|'rounded'|'solid'|'shadow'|table
    border = 'rounded',
    ---@type number 0-100
    winblend = 0,
    ---@type boolean
    add_padding = true,
    ---@type string
    hl_group = 'Keyword',
    ---@type string
    wrapping = '"',
    ---@type boolean
    enable_cmdline = true
})
