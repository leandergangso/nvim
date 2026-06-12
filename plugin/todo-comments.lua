vim.pack.add({
	"https://github.com/folke/todo-comments.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
})

local ok, todo_comments = pcall(require, "todo-comments")
if not ok then
	return
end

todo_comments.setup({
	signs = true,
	merge_keywords = true,
	keywords = {
		NOTE = { color = "hint" },
		TODO = { color = "info" },
		WARN = { color = "warning", alt = { "BUG" } },
		FIX = { color = "error", alt = { "DEL" } },
		TEST = { color = "test" },
		PERF = {},
	},
})

vim.keymap.set("n", "<leader>st", function()
	if vim.fn.exists(":TodoTelescope") == 2 then
		vim.cmd.TodoTelescope()
	else
		vim.api.nvim_echo({ { "todo-comments.nvim is not available", "WarningMsg" } }, true, {})
	end
end, { desc = "[S]earch [T]odo" })
