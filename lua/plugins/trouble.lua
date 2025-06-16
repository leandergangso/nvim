-- https://github.com/folke/trouble.nvim
return {
    "folke/trouble.nvim",
    enabled = false,
    opts = {
        icons = false,
    },
    config = function()
        local trouble = require("trouble")
        vim.keymap.set("n", "<leader>tt", function() trouble.toggle() end)
        vim.keymap.set("n", "[t", function() trouble.next({ skip_groups = true, jump = true }) end)
        vim.keymap.set("n", "]t", function() trouble.previous({ skip_groups = true, jump = true }) end)
    end,
}
