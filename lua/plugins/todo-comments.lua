return {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        signs = false,
        merge_keywords = true,
        keywords = {
            NOTE = { color = "hint", alt = { "INFO" } },
            TODO = { color = "info" },
            WARN = { color = "warning", alt = { "HACK" } },
            FIX = { color = "error", alt = { "BUG", "DEV", "DEL" } },
            TEST = { color = "test" },
            PERF = {},
        }
    },
}
-- TODO: add keymap for telescope picker to list and find existing marks
