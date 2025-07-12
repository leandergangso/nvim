return {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    opts = {
        signs = false,
        merge_keywords = true,
        keywords = {
            NOTE = { color = "hint" },
            TODO = { color = "info" },
            WARN = { color = "warning" },
            FIX = { color = "error"  },
            TEST = { color = "test" },
            PERF = {},
        }
    },
    config = function()
        require("todo-comments").setup()
        vim.keymap.set("n", "<leader>st", "<cmd>TodoTelescope<CR>", { desc = "Find TODO comments" })
    end,
}
