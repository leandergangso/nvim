return {
	"folke/todo-comments.nvim",
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim", lazy = true },
	opts = { signs = false },
}
-- TODO: add keymap for telescope picker to list and find existing marks
