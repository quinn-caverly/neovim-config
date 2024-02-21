local dap = require("dap")

dap.adapters.python = {
    type = "executable",
    command = os.getenv("HOME") .. "/miniconda3/bin/python",
    args = { "-m", "debugpy.adapter" }
}

dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function() return os.getenv("HOME") .. "/miniconda3/bin/python" end
    }
}

local map = function(lhs, rhs, desc)
    if desc then desc = "[DAP] " .. desc end

    vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
end

map("<leader>sb", require("dap").step_back, "step_back")
map("<leader>i", require("dap").step_into, "step_into")
map("<leader>v", require("dap").step_over, "step_over")
map("<leader>so", require("dap").step_out, "step_out")
map("<leader>dc", require("dap").continue, "continue")

map("<leader>dr", require("dap").repl.open)
map("<leader>dl", function() require("dap").run_last() end)

map("<leader>db", require("dap").toggle_breakpoint)
map("<leader>dB", function() require("dap").set_breakpoint(vim.fn.input "[DAP] Condition > ") end)

map("<leader>de", require("dapui").eval)
map("<leader>dE", function() require("dapui").eval(vim.fn.input "[DAP] Expression > ") end)
