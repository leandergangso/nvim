-- https://github.com/folke/trouble.nvim
return {
    "folke/trouble.nvim",
    enabled = false,
    opts = {
        icons = false,
    },
    keys = {
        {
            "<leander>tt",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leander>[t",
            "<cmd>Trouble diagnostics next<cr>",
        },
        {
            "<leander>]t",
            "<cmd>Trouble diagnostics previous<cr>",
        },
    },
    config = function()
        local trouble = require("trouble")
        vim.keymap.set("n", "<leader>tt", function() trouble.toggle() end)
        vim.keymap.set("n", "[t", function() trouble.next({ skip_groups = true, jump = true }) end)
        vim.keymap.set("n", "]t", function() trouble.previous({ skip_groups = true, jump = true }) end)
    end,
}
