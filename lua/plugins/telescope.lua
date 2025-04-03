return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                pickers = {
                    diagnostics = { initial_mode = "normal" },
                    buffers = { initial_mode = "normal" },
                    marks = { initial_mode = "normal" },
                }
            })
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<C-p>", builtin.git_files, {})
            vim.keymap.set("n", "<leader>sf", builtin.find_files, {})
            vim.keymap.set("n", "<leader>sg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>sw", builtin.grep_string, {})
            vim.keymap.set("n", "<leader>sd", builtin.diagnostics, {})
            vim.keymap.set("n", "<leader>sb", builtin.buffers, {})
            vim.keymap.set("n", "<leader>sm", builtin.marks, {})
            vim.keymap.set("n", "<leader>sh", builtin.help_tags, {})
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
