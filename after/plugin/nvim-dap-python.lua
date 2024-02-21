local map = function(lhs, rhs, desc)
    if desc then
        desc = "[DAP-PYTHON] " .. desc
    end

    vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
end

map("<leader>dm", require('dap-python').test_method, "test_method")
map("<leader>dc", require('dap-python').test_class, "test_class")
map("<leader>ds", require('dap-python').debug_selection, "debug_selection")
